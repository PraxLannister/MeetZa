<%@page import="meet.bo.Item"%>
<%@page import="java.util.List"%>
<%@page import="meet.bo.Shop"%>
<%@include file="Header.jsp" %>
<%Shop shopObj = (Shop)request.getAttribute("shopObj") ;
List<Item> Itemlist = (List<Item>)request.getAttribute("itemlist");
HttpSession session1  = request.getSession();
User user1 = (User)session.getAttribute("User");

String erromsg = (String)request.getAttribute("error_msge");
long shop_id = 0L;
String shop_name = null;
%>
<%if(erromsg!=null){ %>
<h1><%=erromsg %></h1>
<%} %>
<%if(user!=null){ 
	shop_id = (Long)session1.getAttribute("shop_id");
	shop_name = (String)session1.getAttribute("shop_name");
}%>
    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Shop Detail</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="ShopList">Shop</a></li>
                        <li class="breadcrumb-item active">Shop Detail </li>
                       
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Shop Detail  -->
    <div class="shop-detail-box-main">
        <div class="container">
            <div class="row">
                <div class="col-xl-5 col-lg-5 col-md-6">
                    <div id="carousel-example-1" class="single-product-slider carousel slide" data-ride="carousel">
                        <div class="carousel-inner" role="listbox">
                        	  
                        <%for(int i=0;i<Itemlist.size();i++){ %>
                        	  <div class="carousel-item <%if(i==0){%>active<%}%>"> <img class="d-block w-100" src="ImageViewControllerItem?item_id=<%=Itemlist.get(i).getItem_id() %>" > </div>
                       <%} %>
                        </div>
                        <a class="carousel-control-prev" href="#carousel-example-1" role="button" data-slide="prev"> 
								<i class="fa fa-angle-left" aria-hidden="true"></i>
								<span class="sr-only">Previous</span> 
						</a>
                        <a class="carousel-control-next" href="#carousel-example-1" role="button" data-slide="next"> 
								<i class="fa fa-angle-right" aria-hidden="true"></i> 
								<span class="sr-only">Next</span> 
						</a>
                  
                    </div>
                </div>
                <div class="col-xl-7 col-lg-7 col-md-6">
                    <div class="single-product-details">
                        <h2><%=shopObj.getShop_name() %></h2>
                        <!-- <p class="available-stock"><span> More than 20 available / <a href="#">8 sold </a></span><p> -->

								<div class="col-sm-12" style="max-width:70">
								<div class="contact-info-left1">
									<h2>CONTACT INFO</h2>
									<p> </p>
									<ul>
										<li>
											<p><i class="fas fa-map-marker-alt"></i><%=shopObj.getShop_address() %> </p>
										</li>
										<li>
											<p><i class="fas fa-phone-square"></i>Phone: <%=shopObj.getShop_details() %></a></p>
										</li>
										
									</ul>
								</div>
								</div>
				
                    </div>
                </div>
            </div>
			
			
            <div class="row my-5">
                <div class="col-lg-12">
                    <div class="featured-products-box owl-carousel owl-theme">
                    
                    <!-- start -->
                    <%for(Item obj:Itemlist){ %>
                        <div class="item">
                            <div class="products-single fix">
                                <div class="box-img-hover">
                                  <!-- <img src="images/img-pro-01.jpg" class="img-fluid" alt="Image"> -->
                                    <img src="ImageViewControllerItem?item_id=<%=obj.getItem_id()%>" height="42" width="42"class="img-fluid" alt="Image"> 
                                    <div class="mask-icon">
                                        <ul>
                                          
                                            
                                        </ul>
                                        <%if(user==null){%>
                                        	 
                                        <a class="cart" href="Login.jsp">Add to Cart</a>
                                        <%}else if(obj.getShop().getShop_id()==shop_id|| shop_id==0){ %>
                                        <a class="cart" href="CartController?item_id=<%=obj.getItem_id()%>&shop_id=<%=shopObj.getShop_id()%>">Add to Cart</a>
                                       <%} else{
                                       shop_id  = (Long)session.getAttribute("shop_id");
											 shop_name = (String)session.getAttribute("shop_name");%>
                                        <a class="cart" href="CartController?item_id=<%=obj.getItem_id()%>&shop_id=<%=shopObj.getShop_id()%>"><h8>your cart contains dishes from <%=shop_name%> do you want discard the selection and add dishes from <%=shopObj.getShop_name() %> then click here</h8></a>

                                       <%} %>
                                    </div>
                                </div>
                                <div class="why-text">
                                    <h4><%=obj.getItem_name()%></h4>
                                    <h5> <%=obj.getItem_price()%>RS/kg</h5>
                                </div>
                            </div>
                        </div>
                        <%} %>
                       <!-- end --> 
                                                   
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- End Cart -->
<%@include file="Footer.jsp" %>
