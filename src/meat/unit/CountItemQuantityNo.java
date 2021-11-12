package meat.unit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import meet.util.db.SisDbConnectionUtil;

public class CountItemQuantityNo {

	public static void main(String[] args) {
		Connection con=null;
		 PreparedStatement pstmt=null;
		 ResultSet rs = null;
		 try {
			con=SisDbConnectionUtil.getConnection();
			String sql="select count(item_quantity_no) from User_Cart where item_id=1";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				long sum = rs.getLong("count(item_quantity_no)");
				System.out.print(sum);
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
