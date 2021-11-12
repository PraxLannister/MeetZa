package meat.unit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import meet.bo.Coupon;
import meet.bo.Shop;
import meet.bo.User;
import meet.bo.User_Order;
import meet.util.db.SisDbConnectionUtil;

public class ShowRecentOrder {

	public static void main(String[] args) {
		
		
		/*ArrayList<User_Order> userObjList = new ArrayList<User_Order>();
		
		Connection con=null;
		 PreparedStatement pstmt=null;
		 ResultSet rs = null;
		 
		 Coupon coupon ;
		 Shop shop  ;
		 User user ;
		 try {
			 con = SisDbConnectionUtil.getConnection();
			 String sql1 ="select muo.id, s.shop_id, s.shop_name,s.shop_address,s.shop_details ,"
			 		+ "muo.price,muo.user_status,muo.coupon_id,muo.dop"
			 		+ " from Meat_User_Order muo ,Meat_Shop s where muo.order_shop_id=s.shop_id and muo.order_mail_id=?";
				pstmt=con.prepareStatement(sql1);
				pstmt.setString(1, "raghvp672@gmail.com");
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
					
				//	System.out.print(Meat_User_Order_Dop);
					timstamp = Meat_User_Order_Dop;
					obj.setShop(shop);
					obj.setUser(null);
					obj.setCoupon(coupon);
					obj.setDate(Meat_User_Order_Dop);
					
					userObjList.add(obj);
					
				}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				SisDbConnectionUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		 
		 for(User_Order obj:userObjList){
			 System.out.println("Shop Name"+obj.getShop().getShop_name());
			 System.out.println("Order Id"+obj.getId());
			 System.out.println("Shop Details"+obj.getShop().getShop_address());
			 System.out.println("price"+obj.getPrice());
			
			 
			 
			 try {
				 con = SisDbConnectionUtil.getConnection();
				 String sql1 ="select muoi.item_id,muoi.item_quantity,muoi.price,mi.item_name"
				 		+ " from MEAT_USER_ORDER_ITEM muoi,Meat_item	 mi where mi.item_id=muoi.item_id and"
				 		+ " ORDER_DOP=? and "
				 		+ "user_mail_id=?";
					pstmt=con.prepareStatement(sql1);
					pstmt.setTimestamp(1, obj.getDate());
					pstmt.setString(2, "raghvp672@gmail.com");
					rs = pstmt.executeQuery();
					while(rs.next()){
						long item_id = rs.getLong(1);
						long item_quantity = rs.getLong(2);
						long price = rs.getLong(3);
						String item_name = rs.getString(4);
						
						
						System.out.println("item_id= "+item_id);
						
						System.out.println("item_quantity= "+item_quantity);
						System.out.println("price= "+price);
						System.out.println("item_name= "+item_name);
					//	System.out.println("shop_name= "+shop_name);
					}
					
			} catch (SQLException e) {
				e.printStackTrace();
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try {
					SisDbConnectionUtil.closeConnection(con);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			 System.out.println("***************************");
		 }*/
		/*java.sql.Timestamp timstamp = ;
		 System.out.println("Operaition on Date");*/
		 
		java.util.Date date = new java.util.Date(System.currentTimeMillis());
		System.out.println(date);
		System.out.println(date.getDate());
		DateFormat dateFormat1 = new SimpleDateFormat("dd MM yyyy hh.mm  aa");
		DateFormat dateFormat2 = new SimpleDateFormat("EEEE, dd MMMM yyyy hh:mm aa");
    	String dateString2 = dateFormat2.format(date).toString();
    	System.out.println("Current date and time in AM/PM: "+dateString2);
		 
    	//System.out.println(  dateString2.substring(0,10)+" at "+dateString2.substring(10));
		 

	}

}
