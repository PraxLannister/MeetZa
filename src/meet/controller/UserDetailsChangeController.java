package meet.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meet.bo.User;
import meet.util.db.SisDbConnectionUtil;

/**
 * Servlet implementation class UserDetailsChangeController
 */
public class UserDetailsChangeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Connection con = null;
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		
		System.out.println("Init Method Called Of User Details Changes Controller ");
		try {
			con = SisDbConnectionUtil.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void destroy() {
		// TODO Auto-generated method stub
		super.destroy();
		System.out.println("Destroy Called Of User Details Changes ControllerDS");
		try {
			SisDbConnectionUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//address
		
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		

	
		String address = request.getParameter("address");
					
					PreparedStatement pstmt = null;
					ResultSet rs= null;
					
					try {
						 String sql =" update Meat_user set user_address=? where id=?";
						 pstmt = con.prepareStatement(sql);
						 pstmt.setString(1, address);
						 
						 pstmt.setLong(2, user.getId());
					
						 int update = pstmt.executeUpdate();
						 if(update ==1){
							 System.out.println("Updation Successfull");
						 }
					} catch (Exception e) {
						e.printStackTrace();
					}
		
		user.setUser_address(address);
		response.sendRedirect("OrderHistoryController");
		
	}
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	/*
		username
		email
       password*/
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		
		String user_Name = request.getParameter("username");
		String user_Email = request.getParameter("email");
		String user_Password = request.getParameter("password");
		
		System.out.println(user.getId());
		
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		try {
			 String sql =" update Meat_user set user_name=?,user_password=? where id=?";
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, user_Name);
			 pstmt.setString(2, user_Password);
			 pstmt.setLong(3, user.getId());
			
			 int update = pstmt.executeUpdate();
			 if(update ==1){
				 System.out.println("Updation Successfull");
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		user.setUser_name(user_Name);
		user.setUser_password(user_Password);
		response.sendRedirect("OrderHistoryController");
		
	}

}
