<%@page import="java.sql.SQLException"%>
<%@page import="meet.bo.Shop"%>
<%@page import="meet.bo.Coupon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="meet.util.db.SisDbConnectionUtil"%>
<%@page import="java.util.List"%>
<%@page import="meet.bo.User_Order"%>
<%@include file="Header.jsp" %>

<%List<User_Order> userObjList = (List<User_Order>)request.getAttribute("UserOrderObject"); %>


<% 
Connection con=null;
 PreparedStatement pstmt=null;
 ResultSet rs = null;
 
 Coupon coupon ;
 Shop shop  ;
 
	 
	User userObj = (User)session.getAttribute("user");
	
	 for(User_Order obj:userObjList){
		 System.out.println("Shop Name"+obj.getShop().getShop_name());
		 System.out.println("Order Id"+obj.getId());
		 System.out.println("Shop Details"+obj.getShop().getShop_address());
		 System.out.println("price"+obj.getPrice());
		 System.out.println("Dop"+obj.getDate());
		 
		 
		 try {
			 con = SisDbConnectionUtil.getConnection();
			 String sql1 ="select muoi.item_id,muoi.item_quantity,muoi.price,mi.item_name"
			 		+ " from MEAT_USER_ORDER_ITEM muoi,Meat_item	 mi where mi.item_id=muoi.item_id and"
			 		+ " ORDER_DOP=? and "
			 		+ "user_mail_id=?";
				pstmt=con.prepareStatement(sql1);
				pstmt.setTimestamp(1, obj.getDate());
				pstmt.setString(2,userObj.getMail_id() );
				rs = pstmt.executeQuery();
				while(rs.next()){
					long item_id = rs.getLong(1);
					long item_quantity = rs.getLong(2);
					long price = rs.getLong(3);
					String item_name = rs.getString(4);
					
					
					System.out.println("item_id= "+item_id);
					
					System.out.println("item_quantity= "+item_quantity);
					System.out.println("price= "+price);
					System.out.println("item_name= "+item_name);
				//	System.out.println("shop_name= "+shop_name);
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
		 System.out.println("***************************");
	 }
	
%>
			 
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-4 col-12 ">
				 <div class="card">
				 	<img src="img-pro-02.jpg" class="rounded img-fluid ">
				 	<div class="card-body">
				 		<h4 class="card-title text-center">Foods</h4>
				 		<p class="card-text">its very higenic and delicious </p>
				 		<a href="" class="btn btn-primary m-auto d-block">Add</a>
				 	</div>
				 </div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 col-12 ">
				 <div class="card">
				 	<img src="E:\4 th sem project\freshshop\shop images\istockphoto-1156861477.jpg" class="rounded img-fluid ">
				 	<div class="card-body">
				 		<h4 class="card-title text-center">Foods</h4>
				 		<p class="card-text">its very higenic and delicious </p>
				 		<a href="" class="btn btn-primary d-block">Add</a>
				 	</div>
				 </div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 col-12 ">
				 <div class="card">
				 	<img src="img-pro-02.jpg" class="rounded img-fluid ">
				 	<div class="card-body">
				 		<h4 class="card-title text-center">Foods</h4>
				 		<p class="card-text">its very higenic and delicious </p>
				 		<a href="" class="btn btn-primary d-block">Add</a>
				 	</div>
				 </div>
			</div><br>	
			<div class="col-lg-4 col-md-4 col-sm-4 col-12 ">
				 <div class="card">
				 	<img src="img-pro-02.jpg" class="rounded img-fluid ">
				 	<div class="card-body">
				 		<h4 class="card-title text-center">Foods</h4>
				 		<p class="card-text">its very higenic and delicious </p>
				 		<a href="" class="btn btn-primary d-block">Add</a>
				 	</div>
				 </div>
			</div>	
		</div>
	
	</div>

<%@include file="Footer.jsp" %>