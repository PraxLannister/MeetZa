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

import meet.util.db.SisDbConnectionUtil;

/**
 * Servlet implementation class RemoveItemFromCartController
 */
public class RemoveItemFromCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;


    Connection con = null;
   @Override
public void init() throws ServletException {
	// TODO Auto-generated method stub
	super.init();
	System.out.println(" Remove Item from Cart Controller Init Method Called");
	try {
		con = SisDbConnectionUtil.getConnection();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
   @Override
public void destroy() {
	// TODO Auto-generated method stub
	super.destroy();
	System.out.println("Remove Item from Cart Controlle Destroy Called");
	try {
		SisDbConnectionUtil.closeConnection(con);
	} catch (SQLException e) {
		e.printStackTrace();
	}
}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	long cart_id= Long.parseLong(request.getParameter("cart_id"));
	System.out.println(cart_id);

	
	long count=0;

	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	 try {
		 	String sql1 = "delete Meat_user_cart where cart_id=? ";
		 	pstmt=con.prepareStatement(sql1);
		 	pstmt.setLong(1, cart_id);
		 	
		 	rs = pstmt.executeQuery();
		 	
		
			
		} catch(Exception e){
			e.printStackTrace();
		}
response.sendRedirect("CartViewController");
}

/**
 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	

}

    

}
