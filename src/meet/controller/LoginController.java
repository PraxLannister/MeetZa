package meet.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//For Encryption and Decrption
import javax.crypto.*;


import meet.bo.User;
import meet.util.db.SisDbConnectionUtil;




/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
Connection con =null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		System.out.println("login Controller  init method called");
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
		System.out.println("Login Controller  destroy method called");
		//TODO con close
		try {
			SisDbConnectionUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
  
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mail_id=request.getParameter("email");
		String password=request.getParameter("password");
		
		Long shop_id=0L;
		String shop_name = null;
		
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		User user=null;
		try {
		
		String sql="select id,user_name, mail_id,user_password,user_address,user_phone,User_Query,Role from"
				+ " Meat_user  where mail_id=? and user_password=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,mail_id) ;
		pstmt.setString(2,password) ;
		rs=pstmt.executeQuery();
		while(rs.next()){
			long user_Id = rs.getLong("id");
			String UserName = rs.getString("user_name");
			String mail_Id = rs.getString("mail_id");
			String User_Password = rs.getString("user_password");
			String user_Address = rs.getString("user_address");
			String user_PhoneNo = rs.getString("user_phone");
			String user_query = rs.getString("User_Query");
			String Role = rs.getString("Role");
			 user=new User();
			user.setId(user_Id);
			user.setUser_name(UserName);
			user.setMail_id(mail_Id);
			user.setUser_password(User_Password);
			user.setUser_address(user_Address);
			user.setUser_phone(user_PhoneNo);
			user.setUser_Query(user_query);
			user.setRole(Role);
			
		}
		if(user!=null){
			
			String sql1 = "select uc.shop_id,s.shop_name from Meat_User_Cart uc,Meat_Shop s where uc.shop_id=s.shop_id and uc.mail_id=?";
	 		pstmt = con.prepareStatement(sql1);
	 		pstmt.setString(1,user.getMail_id());
	 		rs = pstmt.executeQuery();
			 while(rs.next()){
				 shop_id = rs.getLong("shop_id");
				 shop_name = rs.getString("shop_name");
			 }
		}
		}catch(Exception e){
			
			e.printStackTrace();
		}
		
		if(user!=null){
			HttpSession session =  request.getSession();
		
			session.setAttribute("user",user );
			session.setAttribute("shop_id", shop_id);
			session.setAttribute("shop_name", shop_name);
			session.setAttribute("couponCode", 0L);
			System.out.print("shop_id="+shop_id);
			System.out.print("shop_name="+shop_name);
			System.out.println("Role is"+user.getRole());
			response.sendRedirect("index.jsp");
		}else{
			request.setAttribute("userObj",user);
			request.setAttribute("loginErroMsg", "Invalid EmailId Or Password");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
	}

}
