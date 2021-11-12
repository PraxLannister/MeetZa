<%@page import="java.util.List"%>
<%@include file="Header.jsp" %>
<%@page import="meet.bo.Shop"%>

<%List<Shop> shoplist = (List<Shop>)request.getAttribute("shoplist");%>

    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2></h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        <li class="breadcrumb-item active">Shop</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Shop Page  -->
    <div class="shop-box-inner">
        <div class="container">
            <div class="row">
                <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
                    <div class="right-product-box">
                       <h1><b>Shops</b></h1>
                        <div class="product-categorie-box">
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                    <div class="row">
                                    
										<%for(Shop obj:shoplist){ %>
										 <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                            <div class="products-single fix">
                                                <div class="box-img-hover">
                                                    <div class="type-lb">
                                                        
                                                    </div>
                                                    <img src="ImageViewControllerShop?shop_id=<%=obj.getShop_id()%>" class="img-fluid" alt="Image">
                                                    
                                                    <div class="mask-icon">
                                                     
                                                        <a class="cart"  href="ShopDetailsController?shop_id=<%=obj.getShop_id()%>">Open</a>
                                                    </div>
                                                </div>
                                                <div class="why-text">
                                                    <h4><%=obj.getShop_name()%></h4>
                                                 
                                                </div>
                                             
                                            </div>
                                        </div>
                                        <%} %>
                                    </div>
                                </div>
                                 </div>
                        </div>
                    </div>
                </div>
		     </div>
        </div>
    </div>
    <!-- End Shop Page -->

<%@include file="Footer.jsp" %>