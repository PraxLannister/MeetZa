package meet.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meet.bo.Item;
import meet.bo.Shop;
import meet.bo.User;
import meet.util.db.SisDbConnectionUtil;

/**
 * Servlet implementation class ShopDetailsController
 */
public class ShopDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Connection con = null;
   @Override
public void init() throws ServletException {
	// TODO Auto-generated method stub
	super.init();
	System.out.println("Shop Details Controller Init Method Called");
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
	System.out.println("Shop Details Controller Destroy Called");
	try {
		SisDbConnectionUtil.closeConnection(con);
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long shop_id = Long.parseLong(request.getParameter("shop_id"));
		//System.out.println("Shop_id"+shop_id);
		Shop shop = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			String sql="select shop_name,shop_address,shop_details from Meat_Shop where shop_id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setLong(1, shop_id);
			rs=pstmt.executeQuery();
				while(rs.next()){
					String shop_name = rs.getString("shop_name");
					String shop_address = rs.getString("shop_address");
					String shop_details = rs.getString("shop_details");
					shop = new Shop();
					shop.setShop_address(shop_address);
					shop.setShop_id(shop_id);
					shop.setShop_details(shop_details);
					shop.setShop_name(shop_name);
				}
			}catch(Exception e){
				
				e.printStackTrace();
			}
			
		
		
		 request.setAttribute("shopobj",shop);
		 //also set Attribute of item list of this Shop
		 request.getRequestDispatcher("ItemDataController").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
