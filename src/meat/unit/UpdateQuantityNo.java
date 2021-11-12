package meat.unit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import meet.util.db.SisDbConnectionUtil;

public class UpdateQuantityNo {

	public static void main(String[] args) {
		long count=0;
		Connection con=null;
		 PreparedStatement pstmt=null;
		 ResultSet rs = null;
		 try {
			con=SisDbConnectionUtil.getConnection();
			String sql1 = "select item_quantity_no from User_Cart where item_id=?";
		 	pstmt=con.prepareStatement(sql1);
		 	pstmt.setLong(1, 1);
		 	rs = pstmt.executeQuery();
		 	
			while(rs.next()){
				 count = rs.getLong("item_quantity_no");
				 
			}
			if(count==0){
				String sql2="insert into User_Cart(cart_id,mail_id,dop,item_id,shop_id,item_quantity_no)"
						+ "values((select nvl(max(cart_id),0)+1 from User_Cart),?,?,?,?,?)";
				pstmt=con.prepareStatement(sql2);
				pstmt.setString(1,"ragvh");
				pstmt.setDate(2, null);
				pstmt.setLong(3,1);
				pstmt.setLong(4,2);
				pstmt.setLong(5,1);
				pstmt.executeUpdate();
			}else{
				String sql2 = "update User_cart set item_quantity_no=6 where item_id=1";
				pstmt=con.prepareStatement(sql2);
				
				int update  = pstmt.executeUpdate();
				System.out.print(update);
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
