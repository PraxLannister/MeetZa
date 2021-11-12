package meat.unit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import meet.util.db.SisDbConnectionUtil;

public class SearchItemByName {

	public static void main(String[] args) {
		String item_name="%Mutton%";
		String item_name1="%Meat%";
		String item_name2="%Chicken%";

		Connection con=null;
		 PreparedStatement pstmt=null;
		 ResultSet rs = null;
		 try {
			con=SisDbConnectionUtil.getConnection();
		/*	String sql="Select s.shop_id,s.shop_name,s.shop_address,s.shop_file_name,s.shop_details,i.item_name from shop s,item i where s.shop_id=i.shop_id and i.item_name like ? union "
					+ " Select s.shop_id,s.shop_name,s.shop_address,s.shop_file_name,s.shop_details,i.item_name from shop s,item i where s.shop_id=i.shop_id and i.item_name like ? ";*/
			String sql = "Select s.shop_id,s.shop_name,i.item_name from item i,shop s where s.shop_id=i.shop_id and   item_name Not  like ? and item_name Not like ? and item_name Not like ? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,item_name);
			pstmt.setString(2,item_name1);
			pstmt.setString(3,item_name2);
		
		
			rs=pstmt.executeQuery();
			while(rs.next()){
				long shop_id= rs.getLong(1);
				String shop_name = rs.getString(2);
				String item_name4 = rs.getString(3);
		
				System.out.print(shop_id+" ");
				System.out.print(shop_name+" ");
				System.out.println(item_name4+" ");
	

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
