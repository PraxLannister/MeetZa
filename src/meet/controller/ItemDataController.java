package meet.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;





import meet.bo.Item;
import meet.bo.Shop;
import meet.util.db.SisDbConnectionUtil;

/**
 * Servlet implementation class ItemDataController
 */
public class ItemDataController extends HttpServlet {
	private static final long serialVersionUID = 1L;
        Connection con = null;
       @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	System.out.println("Item Data Controller Init Method Called");
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
    	System.out.println("Item Data Controller Destroy Called");
    	try {
			SisDbConnectionUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
       
       
       
    public ItemDataController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Shop shop= (Shop)request.getAttribute("shopobj");
		long shopId = shop.getShop_id();
		
		List<Item>Itemlist = new ArrayList<Item>();
		HttpSession session = request.getSession();
		
		
		 PreparedStatement pstmt=null;
		 ResultSet rs = null;
		 try {
			
			String sql="Select item_id,item_name,item_price,item_quantity from Meat_Item where shop_id = ?";
			pstmt=con.prepareStatement(sql);
			pstmt.setLong(1, shopId);
			rs=pstmt.executeQuery();
			while(rs.next()){
				long item_id = rs.getLong("item_id");
				String item_name = rs.getString("item_name");
				long item_price = rs.getLong("item_price");
				long item_quantity = rs.getLong("item_quantity");
				Item item = new Item();
				item.setItem_id(item_id);
				item.setItem_name(item_name);
				item.setItem_price(item_price);
				item.setItem_quantity(item_quantity);
				item.setShop(shop);
				Itemlist.add(item);
				
			}
		} catch(Exception e){
			e.printStackTrace();
		}	
		 request.setAttribute("shopObj",shop);
		 request.setAttribute("itemlist",Itemlist);
		 request.getRequestDispatcher("ShopDetail.jsp").forward(request, response);
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
