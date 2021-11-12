package meat.unit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import meet.bo.Shop;
import meet.util.db.SisDbConnectionUtil;

public class ShopList {

	public static void main(String[] args) {
		Connection con=null;
		 PreparedStatement pstmt=null;
		 ResultSet rs = null;
		 try {
			con=SisDbConnectionUtil.getConnection();
			String sql="Select shop_id,shop_name,shop_address,shop_file_name,shop_details from shop";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				long shop_id= rs.getLong(1);
				String shop_name = rs.getString(2);
				
				String shop_address = rs.getString(3);
				String shop_file_name= rs.getString(4);
				String shop_details = rs.getString(5);
				System.out.println(shop_id);
				System.out.println(shop_name);
				System.out.println(shop_address);
				System.out.println(shop_file_name);
				System.out.println(shop_details);
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
