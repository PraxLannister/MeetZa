package meat.unit;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import meet.util.db.SisDbConnectionUtil;

public class InsertOrder {

	public static void main(String[] args) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		long Shop_id = 9 ;
		long sum = 1250;
		
		String code = "Fresh50";
		long item_quantity_sum = 3;
		String user_mail = "raghvp672@gmail.com";
		String status = "Yes";
		long date = System.currentTimeMillis();
		Date date1 = new Date(date);
		java.sql.Date sqlDate = new java.sql.Date(date1.getTime());
		try {
			con = SisDbConnectionUtil.getConnection();
			 String sql1 =" insert into User_Order(id,order_mail_id,order_shop_id,user_item_quantity,price,dop,user_status,coupon_id)values((select nvl(max(id),0)+1 from User_Order),?,?,?,?,?,?,?)";
			/*	String sql1 ="insert into User_Order(id,order_mail_id,order_shop_id,user_item_quantity,price,dop,user_status,coupon_id)values((select nvl(max(id),0)+1 from User_Order),'raghvp672@gmail.com',9,3,1250,'23-JUN-20','yes','fresh50')";*/
				pstmt=con.prepareStatement(sql1);
				
		pstmt.setString(1, user_mail);
				pstmt.setLong(2,Shop_id);
				pstmt.setLong(3,item_quantity_sum);
				pstmt.setLong(4,sum);
				pstmt.setDate(5,sqlDate);
				pstmt.setString(6,status);
				pstmt.setString(7,code);
				
				 pstmt.executeUpdate();
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
