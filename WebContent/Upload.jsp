<%@page import="meet.util.db.SisDbConnectionUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="meet.bo.Shop"%>
<%@page import="java.util.List"%>
<%@include file="Header.jsp" %>
	<%
		List<Shop>Shoplist = new ArrayList<Shop>();
		
		
		Connection con = null;
		 PreparedStatement pstmt=null;
		 ResultSet rs = null;
		 con = SisDbConnectionUtil.getConnection();
		 try {
			
			String sql="Select shop_id,shop_name,shop_address,shop_file_name,shop_details from Meat_Shop";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				long shop_id= rs.getLong("shop_id");
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
			
		} catch(Exception e){
			e.printStackTrace();
			try{
				SisDbConnectionUtil.closeConnection(con);
			}catch(Exception e1){
				e1.printStackTrace();
			}
		}	
		 %>
<div class="container-login100" >
        <div class="wrap-login1001 p-l-555 p-r-555 p-t-800 p-b-300" style="padding-left: 30px">
      
          <fieldset>
          <legend>upload into db for Shop</legend>
			<!-- <form action="UploadControllerShop" method="post" enctype="multipart/form-data">
								id<input type="text" name="id1">
					doc_data<input type="file" name="file_Name1">
					<input type="submit" value="uploadfile">
				</form> -->
				<!-- -----------------------------------------------------------------------  -->
				
				<div class="container pt-2 my-5 bg-primary ">
									<form action="UploadControllerShop" method="post" enctype="multipart/form-data">
								  
								  <div class="form-group">
								    <label for="pwd">Shop Name:</label>
								    <input type="text" class="form-control" placeholder="Enter Shop Name" name="name">
								  </div>
								   <div class="form-group">
								    <label for="email">Shop address:</label>
								    <input type="text" class="form-control" placeholder="Shop address" name="address">
								  </div>
								   
								   <div class="form-group">
								    <label for="email">Shop File Data:</label>
								    <input type="file" class="form-control" placeholder="Shop File Data" name="file_data">
								  </div>
								   <div class="form-group">
								    <label for="email">Shop  Details:</label>
								    <input type="text	" class="form-control" placeholder="Shop  Details" name="Details">
								  </div>
						
								  <div class="form-group form-check">
								    <label class="form-check-label">
								      <input class="form-check-input" type="checkbox"> Remember me
								    </label>
								  </div>
								  <button type="submit" class="btn btn-dark">Upload</button>
							</form>
				</div>
				
				<div class="container pt-2 my-5 bg-success ">
	<form action="UploadControllerItem" method="post" enctype="multipart/form-data">
		  
		  <div class="form-group">
		    <label for="pwd">Item Name:</label>
		    <input type="text" class="form-control" placeholder="Enter Item Name" name="Item name">
		  </div>
		   <div class="form-group">
		    <label for="email">Item Price:</label>
		    <input type="text" class="form-control" placeholder="Enter Item Price" name="Item Price">
		  </div>
		     <div class="form-group">
		    <label for="text">Shop Id:</label>
		    
		     <%for(Shop obj:Shoplist){ %>
		    <input type="radio" name="id" value="<%=obj.getShop_id()%>">
		     <label for="male"><%=obj.getShop_name() %></label><br>
		    <%} %> 
		  </div>
		     <div class="form-group">
		    <label for="email">Item  Quantity:</label>
		    <input type="text" class="form-control" placeholder="Enter Item  Queantity" name="Quantity">
		  </div>
		  
		   <div class="form-group">
		    <label for="email">Item_File_data:</label>
		    <input type="file" class="form-control" placeholder="Item_File_data" name="file_data">
		  </div>
		  
		 
		  
		

		 

		   <div class="form-group form-check">
		    <label class="form-check-label">
		      <input class="form-check-input" type="checkbox"> Remember me
		    </label>
		  </div>
		  <button type="submit" class="btn btn-dark">Submit</button>
	</form>
	</div>
				<!-- -----------------------------------------------------------------------  -->
				
		</fieldset>
				<!-- <fieldset><legend>Download from db</legend>
				<form action="download" method="get" >
					Enter Id<input type="text" name="id" value="">
					<input type="submit" value="download"> 
				</form> -->
			
		</div>
	</div>
	
	<div id="dropDownSelect1"></div>
	
	
	<div id="dropDownSelect1"></div>
<%@include file="Footer.jsp" %>