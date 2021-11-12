<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="meet.util.db.SisDbConnectionUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="meet.bo.Coupon"%>
<%@page import="java.util.ArrayList"%>
<%@include file="Header.jsp" %>
<!-- Coupon Controller db  -->
<%String code = (String)request.getParameter("code");
String text = "";
if(code!=null){
	session.setAttribute("text",code);
}else{
 text=(String)session.getAttribute("text");
}%>
<%

			ArrayList<Coupon> CouponList = new ArrayList<Coupon>();

				Connection con = null;
				Coupon coupon = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				con = SisDbConnectionUtil.getConnection();
				try {
					String sql = "select *from Meat_Code";
					pstmt = con.prepareStatement(sql);
					rs=pstmt.executeQuery();
					while(rs.next()){
					long c_id = rs.getLong(1);
					long value = rs.getLong(2);
					long range = rs.getLong(3);
					String coupon_name = rs.getString(4); 
					long max_value = rs.getLong(5);
					
				
					
					coupon = new Coupon();
					coupon.setId(c_id);
					coupon.setValue(value);
					coupon.setRange(range);
					coupon.setCode(coupon_name);
					coupon .setMax_value(max_value);
					
					CouponList.add(coupon);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					try{
						if(con!=null){
						 SisDbConnectionUtil.closeConnection(con);
						}
					}catch(SQLException e){
						e.printStackTrace();
					}
				}
				
				session.setAttribute("couponList",CouponList );
				
				
				




%>
<!--  Coupon Controller db -->
<%String value =""; %>

    <!-- Start Slider -->
 	
    <!-- End Blog  -->
<div>
 <div id="slides-shop" class="cover-slides">
        <ul class="slides-container">
            <li class="text-center">
                <img src="images/max-delsid-oBwnHsjCx9A-unsplash.jpg" style="object-fit:cover;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br> MeatZa</strong></h1>
                         
                            <p><a class="btn hvr-hover" href="ShopList">Shop </a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="images/victoria-shes-WxNCLEKq4-Y-unsplash.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br> MeatZa</strong></h1>
                           
                            <p><a class="btn hvr-hover" href="ShopList">Shop </a></p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="images/armando-ascorve-morales-XpmsZmAMf_g-unsplash (1).jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br> MeatZa</strong></h1>
                           
                            <p><a class="btn hvr-hover" href="ShopList">Shop </a></p>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div>
    </div>
    <!-- End Slider -->

    <!-- Start Categories  -->
  <div class="categories-shop">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="shop-cat-box">
                        <img class="img-fluid" src="images/smp-img-03.jpg" alt="" />
                        <%value= "Chicken"; %>
                        <a class="btn hvr-hover" href="SearchByItemNameController?item_name=<%=value%>">Chicken</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="shop-cat-box">
                    <%value = "Meat"; %>
                        <img class="img-fluid" src="images/download.jpg" alt="" />
                        <a class="btn hvr-hover" href="SearchByItemNameController?item_name=<%=value%>">Meat</a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="shop-cat-box">
                    <%value = "Egg"; %>
                        <img class="img-fluid" src="images/Eggs-with-Whisk-030-1.jpg" alt="" />
                        <a class="btn hvr-hover" href=" SearchByItemNameController?item_name=<%=value%>">Others</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Categories -->
    
 

    <!-- Start Products  -->
    <div class="container">
		<div class="row">
		<%for(Coupon obj:CouponList){ %>
			<div class="col-lg-3 col-md-3 col-sm-3 col-12 " style="padding-bottom: 20px;">
				 <div class="card" >
				 	
				 	<div class="card-body">
				 		<h4 class="card-title text-center"><%=obj.getCode().toUpperCase()%></h4>
				 		<p class="card-text"><h5></h5><strong>Get <%=obj.getValue()%> %discount using  this Code</strong> </h5></p><br>
				 		<h6><p>Use <%=obj.getCode() %> & get <%=obj.getValue()%>% discount up to Rs.<%=obj.getMax_value() %> on orders above Rs.<%=obj.getRange() %></h6>

				 		</p>
				 		<%if(user==null){ %>
			 		<a href="Login.jsp" class="btn hvr-hover d-block text-white"  >Copy Code</a>
				 		<%}else if(code!=null&&obj.getCode().equalsIgnoreCase(code)){ %>
				 			<button class="btn hvr-hover d-block text-white"  style="padding-left: 78px;padding-right: 80px;"  type="button" disabled="disabled">Copied</button>
				 		<%}else if(text!=null &&obj.getCode().equalsIgnoreCase(text)){%>
				 			<button class="btn hvr-hover d-block text-white"  style="padding-left: 78px;padding-right: 80px;"  type="button" disabled="disabled">Copied</button>
				 		<%}else{ %>
				 			<a href="index.jsp?code=<%=obj.getCode() %>" class="btn hvr-hover d-block text-white"  >Copy Code</a>
				 		
				 		<%} %>
				 			
				 	</div>
				 </div>
			</div>
			<%} %>
		</div>
	
	</div>
    <!-- End Products  -->

    <!-- Start Blog  -->
    <!-- <div class="latest-blog">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>Why you should order from us?</h1>
                        </div>
						<div class="row">
						To write
						</div>
                </div>
            </div>
            
        </div>
    </div> -->
</div>

    <!-- Start Instagram Feed  -->
    
    <!-- End Instagram Feed  -->


    <!-- Start Footer  -->
    

  <%@include file="Footer.jsp"%>