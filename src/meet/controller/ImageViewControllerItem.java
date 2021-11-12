package meet.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import meet.util.db.SisDbConnectionUtil;

/**
 * Servlet implementation class ImageViewControllerItem
 */
public class ImageViewControllerItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con =null;
		
		@Override
		public void init(ServletConfig config) throws ServletException {
			super.init(config);
			System.out.println("Image view Of Item  init called");
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
			System.out.println("Image view Of Item destroy called destroy called");
			//TODO con close
			try {
				SisDbConnectionUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	   

		/**
		 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//String tableName = (String)request.getSession().getAttribute("name");
			
			long id  = Long.parseLong(request.getParameter("item_id"));
			ServletOutputStream sos = response.getOutputStream();
		//	System.out.println(id+" create img data for request ");
			String originalFileName = "";
			InputStream inStream  =null;
			PreparedStatement pstmt =null; 
			try {
				System.out.println(con); 
				pstmt = con.prepareStatement("select * from Meat_Item where item_id=?");
				pstmt.setLong(1, id);
				ResultSet rs  = pstmt.executeQuery();
			
				if(rs.next()){
					originalFileName= rs.getString("item_file_name");
					//originalFileName=originalFileName+System.currentTimeMillis();
					inStream = rs.getBinaryStream("item_file_data");
					//set MIME
					//Set header info 
					response.setContentType("image/jpg");
					
					byte[] mybuff = new byte[1024];
					int totalReadLength;
					while( (totalReadLength=inStream.read(mybuff))!=-1){
						sos.write(mybuff, 0, totalReadLength);
					}
				}else{
					response.getWriter().print("try later no record found");
					response.setHeader("refresh","2;url=index.jsp");
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
		}

		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
		}

}
