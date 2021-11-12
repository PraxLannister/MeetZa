 package meet.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import com.sun.mail.iap.Response;

import meet.bo.Item;
import meet.bo.Shop;
import meet.bo.User;
import meet.util.db.SisDbConnectionUtil;

/**
 * Servlet implementation class CartController
 */
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Connection con = null;
   @Override
public void init() throws ServletException {
	// TODO Auto-generated method stub
	super.init();
	System.out.println("Cart Controller Init Method Called");
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
	System.out.println("Cart Controller  Destroy Called");
	try {
		SisDbConnectionUtil.closeConnection(con);
	} catch (SQLException e) {
		e.printStackTrace();
	}
}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession  session = request.getSession();
		long item_id = Long.parseLong(request.getParameter("item_id"));
		long shop_id = Long.parseLong(request.getParameter("shop_id"));
		
		
		
		long count=0;
		boolean flag = true;
		Item item =null;
		
		User userObj= (User)session.getAttribute("user");
		
		long date = System.currentTimeMillis();
		Date date1 = new Date(date);
		java.sql.Date sqlDate = new java.sql.Date(date1.getTime());
		long shop_id1=0;
		String shop_name=null;
		String shop_name1 = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 try {
			 
			 String sql3 = "select shop_id from Meat_User_Cart ";
			 	pstmt=con.prepareStatement(sql3);
			 	rs = pstmt.executeQuery();
			 	while(rs.next()){
			 		shop_id1 = rs.getLong("shop_id"); 
			 	}
			 	if(shop_id1!=0 && shop_id!=shop_id1 ){
			 		try{
			 			String sql = "delete from Meat_User_Cart where mail_id=?";
			 			pstmt = con.prepareStatement(sql);
			 			pstmt.setString(1, userObj.getMail_id());
			 			pstmt.executeUpdate();
			 		}catch(Exception e){
						e.printStackTrace();
					}
			 	}
			 
			 
			 
			 
			 		String sql = "select i.shop_id,s.shop_name from Meat_Item i,Meat_Shop s where s.shop_id=i.shop_id and item_id=?";
			 		pstmt = con.prepareStatement(sql);
			 		pstmt.setLong(1,item_id);
			 		rs = pstmt.executeQuery();
					 while(rs.next()){
						 shop_id1 = rs.getLong("shop_id");
						 shop_name1 = rs.getString("shop_name");
					 }
			 	String sql1 = "select uc.item_quantity_no,s.shop_id,s.shop_name from Meat_User_Cart uc,Meat_Shop s where uc.shop_id=s.shop_id and uc.item_id=? and uc.shop_id=?";
			 	pstmt=con.prepareStatement(sql1);
			 	pstmt.setLong(1, item_id);
			 	pstmt.setLong(2, shop_id);
			 	rs = pstmt.executeQuery();
			 	
				while(rs.next()){
					 count = rs.getLong("item_quantity_no");
					 shop_id1 = rs.getLong("shop_id");
					 shop_name = rs.getString("shop_name");
				}
				System.out.println("shop_id1="+shop_id1);
				if(count==0&&shop_id==shop_id1){
					String sql2="insert into Meat_User_Cart(cart_id,mail_id,dop,item_id,shop_id,item_quantity_no)"
							+ "values((select nvl(max(cart_id),0)+1 from Meat_User_Cart),?,sysdate,?,?,?)";
					pstmt=con.prepareStatement(sql2);
					pstmt.setString(1,userObj.getMail_id());
					
					pstmt.setLong(2,item_id);
					pstmt.setLong(3,shop_id);
					pstmt.setLong(4, 1);
					pstmt.executeUpdate();
					session.removeAttribute("shop_id");
					session.setAttribute("shop_id", shop_id);
					session.setAttribute("shop_name",shop_name1);
					System.out.print(shop_name1);
					System.out.print(shop_id);
				}else if(shop_id==shop_id1) {
					String sql2 = "update Meat_User_Cart set item_quantity_no=? where item_id=?";
					pstmt= con.prepareStatement(sql2);
					pstmt.setLong(1, count+1);
					pstmt.setLong(2, item_id);
					int update  = pstmt.executeUpdate();
					System.out.print(update);
				}
				
			
					
			} catch(Exception e){
				e.printStackTrace();
			}
		 
		response.sendRedirect("CartViewController");
		 
		
	}
		
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
