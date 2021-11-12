package meet.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meet.bo.Shop;
import meet.util.db.SisDbConnectionUtil;

/**
 * Servlet implementation class SearchByItemNameController
 */
public class SearchByItemNameController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con =null;
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		System.out.println("Shop List Controller init method called");
		try {
			con  = SisDbConnectionUtil.getConnection();
		}catch(SQLException e){
			e.printStackTrace();
		}
		//TODO open connection
	}
	
	@Override
	public void destroy() {
		super.destroy();
		System.out.println("Shop List Controller destroy called*****************");
		//TODO con close
		try {
			SisDbConnectionUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String item_name =request.getParameter("item_name");
		
		item_name ="%"+item_name+"%";
		ArrayList<Long> shop_id_list = new ArrayList<Long>();
		List<Shop>Shoplist = new ArrayList<Shop>();
		HttpSession session = request.getSession();
		long shop_id1=0L;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		 try {
	 if(item_name.equalsIgnoreCase("%Meat%")||item_name.equalsIgnoreCase("%Mutton%")||item_name.equalsIgnoreCase("%Chicken%")){ 	
			 String sql="Select s.shop_id,s.shop_name,s.shop_address,s.shop_file_name,s.shop_details,i.item_name from Meat_Shop s,Meat_Item i where s.shop_id=i.shop_id and i.item_name like ? union "
						+ " Select s.shop_id,s.shop_name,s.shop_address,s.shop_file_name,s.shop_details,i.item_name from Meat_Shop s,Meat_Item i where s.shop_id=i.shop_id and i.item_name like ? ";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1,item_name);
				if(item_name.equalsIgnoreCase("%Meat%")){
					item_name = "%Mutton%";
				}
				
				pstmt.setString(2, item_name);
				rs=pstmt.executeQuery();
				while(rs.next()){
					long shop_id= rs.getLong("shop_id");
					if(shop_id_list.contains(shop_id)){
						continue;
					}else{
						shop_id_list.add(shop_id);
					String shop_name = rs.getString("shop_name");
					
					String shop_address = rs.getString("shop_address");
					String shop_file_name= rs.getString("shop_file_name");
					String shop_details = rs.getString("shop_details");
					Shop s = new Shop();
					
					s.setShop_id(shop_id);
					s.setShop_name(shop_name);
					s.setShop_address(shop_address);
					s.setShop_file_name(shop_file_name);
					s.setShop_details(shop_details);
					
					Shoplist.add(s);
					}
				}
	  }
	 else{
				 String sql1="Select s.shop_id,s.shop_name,s.shop_address,s.shop_file_name,s.shop_details"
				 		+ " from   Meat_Item i,Meat_Shop s  where s.shop_id=i.shop_id and  i.item_name Not "
				 		+ " like ? and i.item_name Not like?and i.item_name "
				 		+ "Not like ? and i.item_name not like ? ";
					pstmt=con.prepareStatement(sql1);
					
						
						pstmt.setString(1, "%Meat%");
						pstmt.setString(2, "%Mutton%");
						pstmt.setString(3, "%Chicken%");
						pstmt.setString(4, "%KadakNath%");
						
					rs=pstmt.executeQuery();
					while(rs.next()){
						long shop_id= rs.getLong("shop_id");
						if(shop_id_list.contains(shop_id)){
							continue;
						}else{
							shop_id_list.add(shop_id);
						String shop_name = rs.getString("shop_name");
						
						String shop_address = rs.getString("shop_address");
						String shop_file_name= rs.getString("shop_file_name");
						String shop_details = rs.getString("shop_details");
						Shop s = new Shop();
						
						s.setShop_id(shop_id);
						s.setShop_name(shop_name);
						s.setShop_address(shop_address);
						s.setShop_file_name(shop_file_name);
						s.setShop_details(shop_details);
						
						Shoplist.add(s);
						}
					}
			}
			
				String sql1= "select shop_id from Meat_User_Cart ";
		 		pstmt = con.prepareStatement(sql1);
		 		
		 		rs = pstmt.executeQuery();
				 while(rs.next()){
					 shop_id1 = rs.getLong("shop_id");
				
				 }
				 if(shop_id1==0){
				
					 session.setAttribute("shop_id", shop_id1);
				 }
			} catch(Exception e){
				e.printStackTrace();
			}	
		 request.setAttribute("shoplist",Shoplist);
		 request.getRequestDispatcher("Shops.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
