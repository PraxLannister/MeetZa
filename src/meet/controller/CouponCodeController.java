package meet.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meet.bo.Coupon;
import meet.util.db.SisDbConnectionUtil;

/**
 * Servlet implementation class CouponCodeController
 */
public class CouponCodeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    	Connection con = null;
    	@Override
    	public void init() throws ServletException {
    		// TODO Auto-generated method stub
    		super.init();
    		System.out.print("Coupon Code Controller init method calling");
    		try {
    			con = SisDbConnectionUtil.getConnection();	
			} catch (Exception e) {
				e.printStackTrace();
			}
    		
    	}
    	@Override
    	public void destroy() {
    		// TODO Auto-generated method stub
    		super.destroy();
    		System.out.print("Coupon Code Controller destroy method called");
    		try {
				SisDbConnectionUtil.closeConnection(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String couponCode = (String)request.getParameter("coupon");
		
		System.out.println(couponCode);
		//Data Base Data Fetch
		Coupon coupon = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select *from Meat_Code  where Meat_Code_name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, couponCode.toLowerCase());
			rs=pstmt.executeQuery();
			while(rs.next()){
			long c_id = rs.getLong(1);
			long value = rs.getLong(2);
			long range = rs.getLong(3);
			
			long max_value = rs.getLong(5);
			
			System.out.println("id is "+ c_id);
			System.out.println("value is "+ value);
			System.out.println("range is "+ range);
			System.out.println("max value is "+ max_value);
			coupon = new Coupon();
			coupon.setId(c_id);
			coupon.setValue(value);
			coupon.setRange(range);
			coupon.setCode(couponCode);
			coupon .setMax_value(max_value);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		if(coupon!=null){
			HttpSession session = request.getSession();
			
			
			
			session.setAttribute("CouponCode", coupon);
			session.setAttribute("text", couponCode);
		
		}
		
		
		
		response.sendRedirect("CartViewController");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
