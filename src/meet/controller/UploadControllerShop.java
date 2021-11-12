package meet.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
 * Servlet implementation class UploadController
 */
public class UploadControllerShop extends HttpServlet {
	Connection con =null;
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		System.out.println("Upload Controller for SHop init called");
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
		System.out.println("Upload Controller for SHop destroy called");
		//TODO con close
		try {
			SisDbConnectionUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadControllerShop() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long id = null;

		
		String Shop_Name = null;
		String Shop_Address = null;
		String fileName = null;
		String Shop_details = null;
		
		long fileSize = 0 ;
		InputStream docInputStream = null;
		
		boolean isMultipleContent = ServletFileUpload.isMultipartContent(request);
		
		if(isMultipleContent){
			ServletFileUpload requestparser = null;
			requestparser = new ServletFileUpload(new DiskFileItemFactory());
			
			try {
				List<FileItem> filelist = requestparser.parseRequest(request);
				System.out.println(filelist);
				
				FileItem Shop_name = filelist.get(0);
				FileItem Shop_address = filelist.get(1);
				
				FileItem Shop_File_data  = filelist.get(2);
				FileItem Shop_Details = filelist.get(3);
				
				
				
				
				docInputStream = Shop_File_data.getInputStream();
				fileSize = Shop_File_data.getSize();
				fileName = Shop_File_data.getName();
				Shop_details = Shop_Details.getString();
				Shop_Address = Shop_address.getString();
				Shop_Name = Shop_name.getString();
				
				
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try{
					String sql = "insert into Meat_Shop(shop_id,shop_name,shop_address,shop_details,"
							+ "Shop_File_Name,Shop_File_Data)"
							+ "values((select nvl(max(shop_id),0)+1 from Meat_Shop),?,?,?,?,?)";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, Shop_Name);
					pstmt.setString(2, Shop_Address);
					pstmt.setString(3, Shop_details);
					pstmt.setString(4,fileName);
		        	pstmt.setBinaryStream(5, docInputStream,(int)fileSize);
					int r = pstmt.executeUpdate();
					if(r==1){
						response.getWriter().print("uploaded");
						response.setHeader("refresh","1,Upload.jsp");
					}else {
						response.getWriter().print("uploaded failed");
						
					}
				   
				}catch(Exception e){
					e.printStackTrace();
				}
				
	
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
			
				/*try {
					
					String sql = "update Meat_Shop set "
					+ " shop_file_name=?,shop_file_data=?"
					+ "where shop_id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,fileName);
					pstmt.setBinaryStream(2,docInputStream,(int)fileSize);
					pstmt.setLong(3,id);

					int r = pstmt.executeUpdate();
					if(r==1){
						response.getWriter().print("uploaded");
						
					}else {
						response.getWriter().print("uploaded failed");
						
					}
				} catch (Exception e) {
					e.printStackTrace();
				}*/
				
				
					
		}
		else {
			response.getWriter().print("Form is not multiper");
			
		}
		
	}

}
