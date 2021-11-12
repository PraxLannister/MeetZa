  package meet.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.RequestContext;

import meet.bo.Cart;
import meet.bo.Coupon;
import meet.bo.Item;
import meet.bo.Shop;
import meet.bo.User;
import meet.bo.User_Order;
import meet.util.db.SisDbConnectionUtil;

/**
 * Servlet implementation class OrderHistoryController
 */
public class OrderHistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  Connection con = null;
	   @Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		System.out.println("Init Method Called Of Order History");
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
		System.out.println("Destroy Called Of Order History");
		try {
			SisDbConnectionUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderHistoryController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<User_Order> userObjList = new ArrayList<User_Order>();
		
		HttpSession session  = request.getSession();
		User userObj = (User)session.getAttribute("user");
		String code = "";
		Coupon coupon = (Coupon)session.getAttribute("CouponCode");
		
		if(coupon==null){
			code = "null";
		}else{
			code = coupon.getCode();
		}
		
		PreparedStatement pstmt=null;
		 ResultSet rs = null;
		 
		 
		 Shop shop = null;
		 Item item = null;
		
		 
		 
		 
		 
		 
		 try {
			 
			 String sql1 ="select muo.id, s.shop_id, s.shop_name,s.shop_address,s.shop_details ,"
				 		+ "muo.price,muo.user_status,muo.coupon_id,muo.dop"
				 		+ " from Meat_User_Order muo ,Meat_Shop s where muo.order_shop_id=s.shop_id and muo.order_mail_id=?";
					pstmt=con.prepareStatement(sql1);
					pstmt.setString(1, userObj.getMail_id());
					rs = pstmt.executeQuery();
					while(rs.next()){
						User_Order obj = new User_Order();
						shop  = new Shop();
						coupon = new   Coupon();

						long Meat_User_Order_Id = rs.getLong(1);
						
						obj.setId(Meat_User_Order_Id);
						
						long Meat_Shop_shop_id = rs.getLong(2);
						String Meat_Shop_Shop_name  = rs.getString(3);
						String Meat_Shop_Shop_address = rs.getString(4);
						String Meat_Shop_Shop_details = rs.getString(5);
						
						shop.setShop_address(Meat_Shop_Shop_address);
						shop.setShop_details(Meat_Shop_Shop_details);
						shop.setShop_id(Meat_Shop_shop_id);
						shop.setShop_name(Meat_Shop_Shop_name);
						
						long Meat_User_Order_Price = rs.getLong(6);
						String Meat_User_Order_Status = rs.getString(7);
						
						obj.setPrice(Meat_User_Order_Price);
						obj.setStatus(Meat_User_Order_Status);
						
					
						String Meat_Code_Name  =rs.getString(8);
						
						
					
						
						coupon.setCode(Meat_Code_Name);
						
						
						java.sql.Timestamp Meat_User_Order_Dop = rs.getTimestamp(9);
						
						//System.out.print(dop);
						obj.setShop(shop);
						obj.setUser(null);
						obj.setCoupon(coupon);
						obj.setDate(Meat_User_Order_Dop);
						
						userObjList.add(obj);
						
					}
					
			
		} catch(Exception e){
			e.printStackTrace();
		}
		 request.setAttribute("UserOrderObject",userObjList);
		request.getRequestDispatcher("Profile.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
