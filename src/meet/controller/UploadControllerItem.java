package meet.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import meet.util.db.SisDbConnectionUtil;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadControllerItem
 */
public class UploadControllerItem extends HttpServlet {
	Connection con =null;
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		System.out.println("Upload Controller for Item init called");
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
		System.out.println(" destroy called");
		//TODO con close
		try {
			SisDbConnectionUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	private static final long serialVersionUID = 1L;
       
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long Shop_id = null;
       String item_name = null;
       Long Item_Quantity = null;
       Long item_price = null;
		
		String fileName = null;
		long fileSize = 0 ;
		InputStream docInputStream = null;
		
		boolean isMultipleContent = ServletFileUpload.isMultipartContent(request);
		
		if(isMultipleContent){
			ServletFileUpload requestparser = null;
			requestparser = new ServletFileUpload(new DiskFileItemFactory());
			
			try {
				List<FileItem> filelist = requestparser.parseRequest(request);
				
				FileItem Item_name = filelist.get(0);
				FileItem Item_price = filelist.get(1);
				FileItem shop_id = filelist.get(2);
				FileItem item_quantity = filelist.get(3);
				FileItem docItem = filelist.get(4);
				
				
				Shop_id = Long.parseLong(shop_id.getString());
				item_price = Long.parseLong(Item_price.getString());
				Item_Quantity = Long.parseLong(item_quantity.getString());
				item_name =Item_name .getString();
				
				
				docInputStream = docItem.getInputStream();
				fileSize = docItem.getSize();
				fileName = docItem.getName();
				
				
			
				PreparedStatement pstmt = null;
				
				try {
					String sql = "insert into Meat_Item(Item_id,Item_name,Item_price,shop_id,"
							+ "Item_Quantity,Item_File_Name,Item_File_Data)"
							+ "values((select nvl(max(Item_id),0)+1 from Meat_Item),?,?,?,?,?,?)";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, item_name);
					pstmt.setLong(2, item_price);
					pstmt.setLong(3, Shop_id);
					pstmt.setLong(4,Item_Quantity);
					pstmt.setString(5,fileName);
		        	pstmt.setBinaryStream(6, docInputStream,(int)fileSize);
					int r = pstmt.executeUpdate();
					if(r==1){
						response.getWriter().print("uploaded");
						response.setHeader("refresh","1,Upload.jsp");
					}else {
						response.getWriter().print("uploaded failed");
						
					}
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
	
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
					
		}
		else {
			response.getWriter().print("Form is not multiper");
			
		}
	}
}
