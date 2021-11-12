package meat.unit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import meet.bo.Cart;
import meet.bo.Item;
import meet.bo.Shop;
import meet.util.db.SisDbConnectionUtil;

public class CartViewDb {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Connection con=null;
		 PreparedStatement pstmt=null;
		 ResultSet rs = null;
		 try {
			con=SisDbConnectionUtil.getConnection();

			String sql="select s.shop_id,s.shop_name,s.shop_address,s.shop_details,"
					+ "uc.cart_id,uc.dop,uc.Item_quantity_no,i.item_id,i.item_name,i.item_price,"
					+ "i.shop_id,i.item_quantity from item i,User_cart uc,Shop s where"
					+ " uc.item_id=i.item_id and i.shop_id=s.shop_id and "
					+ " mail_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "raghvp672@gmail.com");
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				long shop_id = rs.getLong("shop_id");
				String shop_name = rs.getString("shop_name");
				String shop_address = rs.getString("shop_address");
				String shop_details = rs.getString("shop_details");
				System.out.println(shop_id);
				System.out.println(shop_name);
				System.out.println(shop_address);
				
				System.out.println(shop_details);
			
				
				long item_id = rs.getLong("item_id");
				String item_name = rs.getString("item_name");
				long item_price = rs.getLong("item_price");
				
				long item_quantity = rs.getLong("item_quantity");
				System.out.println(item_id);
				System.out.println(item_name);
				System.out.println(item_name);
				System.out.println(item_quantity);
				
				long cart_id = rs.getLong("cart_id");
				java.sql.Date dop = rs.getDate("dop");
				long item_quantity_no  =rs.getLong("item_quantity_no");
				System.out.println(cart_id);
				System.out.println(dop);
				System.out.println(item_quantity_no);
				
			
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
	}

}
