package meet.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meet.bo.User;
import meet.util.db.SisDbConnectionUtil;


/**
 * Servlet implementation class RegistrationController
 */
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
Connection con =null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		System.out.println("Registratin Controller init method  called");
		try {
			con  = SisDbConnectionUtil.getConnection();
		}catch(SQLException e){
			e.printStackTrace();
		}
		//TODO open connection
	}
	
	@Override
	public void destroy() {
		super.destroy();
		System.out.println(" Registration destroy  method called");
		//TODO con close
		try {
			SisDbConnectionUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String userName = (String)request.getParameter("username");
		
		String emailIdbySession = (String)session.getAttribute("email");
		//String emailByRegisterFrom = (String)request.getParameter("email");
		
		
		
		String userPassword = request.getParameter("password");
		
		User user = new User();
		user.setUser_name(userName);
		user.setMail_id(emailIdbySession);
		user.setUser_password(userPassword);
		
		
			
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			try{
				
				String sql = "insert into Meat_user (id,user_name,mail_id,user_password)"
						+ "values((select nvl(max(id),0)+1 from Meat_user),?,?,?)";

				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, userName);
				pstmt.setString(2, emailIdbySession);
				pstmt.setString(3, userPassword);
				
				pstmt.executeUpdate();
				 
			}catch(Exception e){
				e.printStackTrace();
				
			}
			  if(session!=null){
				  session.invalidate();
			  }
			  response.sendRedirect("Login.jsp");	
					
				

			
	}

}
