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
 * Servlet implementation class UpdateByCartItemNoController1
 */
public class UpdateByCartItemNoController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    Connection con = null;
   @Override
public void init() throws ServletException {
	// TODO Auto-generated method stub
	super.init();
	System.out.println("Update By Cart Item Item Decrease Init Method Called");
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
	System.out.println("Update By Cart Item Item Decrease Destroy Called");
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
		 	String sql1 = "select item_quantity_no from Meat_User_Cart where cart_id=?";
		 	pstmt=con.prepareStatement(sql1);
		 	pstmt.setLong(1, cart_id);
		 	rs = pstmt.executeQuery();
		 	
			while(rs.next()){
				 count = rs.getLong("item_quantity_no");
			}
		
				String sql2 = "update Meat_User_Cart set item_quantity_no=? where cart_id=?";
				pstmt= con.prepareStatement(sql2);
				count=count-1;
					pstmt.setLong(1, count);
					
				
				pstmt.setLong(2,cart_id);
				int update  = pstmt.executeUpdate();
				System.out.print(update);
			
		} catch(Exception e){
			e.printStackTrace();
		}
	 if(count==0){
		 request.setAttribute("cartId",cart_id );
		 request.getRequestDispatcher("RemoveItemFromCartController").forward(request, response);
	 }else{
		 response.sendRedirect("CartViewController");
	 }
}

/**
 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
}

    
	
	
}



