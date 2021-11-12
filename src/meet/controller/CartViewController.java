package meet.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meet.bo.Cart;
import meet.bo.Item;
import meet.bo.Shop;
import meet.bo.User;
import meet.util.db.SisDbConnectionUtil;

/**
 * Servlet implementation class CartViewController
 */
public class CartViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  Connection con = null;
	   @Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		System.out.println("Cart  view Controller Init Method Called");
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
		System.out.println("Cart  view Controller Destroy Called");
		try {
			SisDbConnectionUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session  = request.getSession();
		User userObj = (User)session.getAttribute("user");
		PreparedStatement pstmt=null;
		 ResultSet rs = null;
		 Cart cart = null;
		 Shop shop = null;
		 Item item = null;
		 ArrayList<Cart> cartList = new ArrayList<Cart>();
		 try {
			
			String sql="select s.shop_id,s.shop_name,s.shop_address,s.shop_details,"
					+ "uc.cart_id,uc.dop,uc.Item_quantity_no,"
					+ "i.item_id,i.item_name,i.item_price,i.shop_id,i.item_quantity"
					+ " from Meat_Item i,Meat_User_Cart uc,Meat_Shop s where uc.item_id=i.item_id and i.shop_id=s.shop_id and "
					+ " mail_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, userObj.getMail_id());
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				long shop_id = rs.getLong("shop_id");
				String shop_name = rs.getString("shop_name");
				String shop_address = rs.getString("shop_address");
				String shop_details = rs.getString("shop_details");
				
				shop = new Shop();
				shop.setShop_address(shop_address);
				shop.setShop_details(shop_details);
				shop.setShop_id(shop_id);
				shop.setShop_name(shop_name);
				
				long item_id = rs.getLong("item_id");
				String item_name = rs.getString("item_name");
				long item_price = rs.getLong("item_price");
				
				long item_quantity = rs.getLong("item_quantity");
				
				item = new Item();
				item.setItem_id(item_id);
				item.setItem_name(item_name);
				item.setItem_price(item_price);
				item.setItem_quantity(item_quantity);
				item.setShop(shop);
				
				long cart_id = rs.getLong("cart_id");
				java.sql.Date dop = rs.getDate("dop");
				long item_quantity_no  =rs.getLong("item_quantity_no");
				
				cart = new Cart();
				cart.setCart_id(cart_id);
				cart.setDop(dop);
				cart.setItem(item);
				cart.setItem_quantity_no(item_quantity_no);
				cart.setShop(shop);
				cart.setMail_id(userObj.getMail_id());
				cartList.add(cart);
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		request.setAttribute("CartList", cartList);
		if(cartList.size()==0){
			request.setAttribute("msg", "Cart Is Empty");
		}
		request.getRequestDispatcher("Cart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
