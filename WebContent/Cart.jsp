<%@page import="meet.bo.Coupon"%>
<%@page import="java.util.List"%>
<%@page import="meet.bo.Cart"%>
<%@include file="Header.jsp" %>
<%List<Cart> cartList = (List<Cart>)request.getAttribute("CartList"); %>
<%String msge = (String)request.getAttribute("msg");
		Coupon coupon = (Coupon)session.getAttribute("CouponCode");
		//System.out.println(coupon.getCode());
		String couponCode =(String) session.getAttribute("text");
		List<Coupon>couponList = (List<Coupon>)session.getAttribute("couponList");
		long coupondis = 0;
		long max_value = 0;
		long range = 0;
		if(coupon!=null){
		coupondis = coupon.getValue();
		max_value = coupon.getMax_value();
		range = coupon.getRange();
		System.out.println("---------------When Coupon in Session----------- ");
		System.out.println(coupondis);
		System.out.println(max_value);
		System.out.println(range);
		System.out.println("-------------------------------------------------------");
		}
%>
<%long sum=0;
long extra = 0;
if(msge==null){ %>
 <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Cart</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="ShopList">Shop</a></li>
                        <li class="breadcrumb-item active">Cart</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Cart  -->
    <div class="cart-box-main">
        <div class="container">
        
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Images</th>
                                    <th>Shop Name</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Updation</th>
                                    <th>Quantity</th>
                                    <th>Remove</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%for(Cart obj:cartList){ %>
                            <%if(obj.getItem_quantity_no()==0){
                           
                            	continue;
                            } %>
                                <tr>
                                    <td class="thumbnail-img">
                                        <a href="#">
											<%-- 	<img class="img-fluid" src="mageViewControllerItem?item_id=<%=obj.getItem().getItem_id()%>"> --%>
												  <img src="ImageViewControllerItem?item_id=<%=obj.getItem().getItem_id()%>" class="img-fluid" alt="Image"> 
										</a>
                                    </td>
                                    
                                    <td class="name-pr">
                                        <a href="ShopDetailsController?shop_id=<%=obj.getShop().getShop_id()%>">
												<%=obj.getShop().getShop_name() %>
										</a>
                                    </td>
                                       <td class="name-pr">
                                        <a href="SearchByItemNameController	?item_name=<%=obj.getItem().getItem_name()%>">
												<%=obj.getItem().getItem_name() %>
										</a>
                                    </td>
                                    
                                    
                                    <td class="price-pr">
                                    <%long quantity = obj.getItem_quantity_no();
                                    		sum = sum+(obj.getItem().getItem_price())*quantity;%>
                                        <h5><b>Rs. <%=obj.getItem().getItem_price() %></b></h5>
                                    </td>
                                 
                                    <%if(obj.getItem_quantity_no()==0){ %>
                                    <td class="price-pr">
                                        <button class="btn btn-sm btn-success" ><a style="color:white" href="UpdateByCartItemNoController?cart_id=<%=obj.getCart_id()%>"><i class="fa fa-plus"></i></a></button>
                                        
                                    </td>
                                    <%}else{ %>
                                    <td class="price-pr">
                                        <button class="btn btn-sm btn-success"><a style="color:white" href="UpdateByCartItemNoController?cart_id=<%=obj.getCart_id()%>"><i class="fa fa-plus"></i></a></button>
                        
                                        <button class="btn btn-sm btn-danger"><a style="color:white" href="UpdateByCartItemNoController1?cart_id=<%=obj.getCart_id()%>"><i class="fa fa-minus"></i></a></button>
                                    </td>
                                    <%} %>
                                      <td class="price-pr">
                                      <h5><b><%=obj.getItem_quantity_no() %></b></h5>  
                                  
                                   
                                    </td>
                                <!--     <td class="quantity-box"><input type="number" size="4" value="1" min="0" step="1"  class="c-input-text qty text"></td> -->
                                   
                              <%--       <td class="total-pr">
                                    <%sum = sum+ (obj.getItem_quantity_no())*(obj.getItem().getItem_price()) %>
                                        <p>Rs. <%=(obj.getItem_quantity_no())*(obj.getItem().getItem_price()) %></p>
                                    </td>
                                     --%>
                                    <td class="remove-pr">
                                        <a href="RemoveItemFromCartController?cart_id=<%=obj.getCart_id()%>">
												<i class="fas fa-times"></i>
										</a>
                                    </td>
                                    
                                </tr>
                                
                          <%} %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
   
  <%System.out.println(sum); %>
			  <form action="CouponCodeController" method="get"> 
			            <div class="row my-5">
			                <div class="col-lg-6 col-sm-6">
			                    <div class="coupon-box">
					                    <div class="input-group mb-2 mr-sm-2">
					                    <%if(couponCode!=null){ %>
											    <input type="text"  name="coupon"  value=<%=couponCode.toUpperCase()%> class="form-control" id="inlineFormInputGroupUsername2" placeholder="Enter your coupon code"" style="border: 1px solid #e3dede !important;">
								
											  <%}else{ %>
											    <input type="text"  name="coupon"   class="form-control" id="inlineFormInputGroupUsername2" placeholder="Enter your coupon code"" style="border: 1px solid #e3dede !important;">
											  <%} %>  
											    <div class="input-group-append">
											      <button class="btn btn-theme"  type="submit"> Apply Coupon</button>
											    </div>
										</div>
								</div>
			                </div>
			            </div>
			  </form>
		</div>
   </div>
   
   
       <div class="row"><!-- for  small -->
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 ">
            <div class="container "  style="padding-left: 30px;padding-right: 30px;">
              <div class="table-main table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    
                                    <th>Coupon Name</th>
                                    <th>Value</th>
                                    <th>Price</th>
                                    <th>Maximum</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%for(Coupon obj:couponList){ %>
                                <tr>
                                   
                                    <td class="name-pr">
                                     <strong> <p><%=obj.getCode().toUpperCase()%></p></strong>  
                                    </td>
                                    <td class="name-pr">
                                 <strong>  <p><%=obj.getValue() %>%</p>  </strong>  
                                    </td>
                                   <td>
                                  <strong> <p><%=obj.getRange() %></p></strong>  
                                   </td>
                                  <td>
                                  <strong> <p><%=obj.getMax_value()%></p></strong>  
                                   </td>
                                </tr>
                                <%} %>
                                  
                            </tbody>
                        </table>
                    </div>
                    </div>
              </div>
              <%
              long margin = 0;
              if(sum<range){
            	  System.out.println("------------------range is greater Than Sum Means Coupon is Not Apply-------------------");
            	  coupondis = 0;
              }else{
            	  System.out.println("--------------Sum is greater Than Range-------------------------");
            	  margin = (sum*10)/100;
            	  
            	  if(margin>max_value){
            		  margin = max_value;
            	  }
            	  System.out.println("margin is  "+margin);
              }
              %>
              
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 ">
            
                
                <div class="container " style="padding-left: 30px;padding-right: 30px;">
               
             
                    <div class="order-box "  >
                        <h3>Order summary</h3>
                        <div class="d-flex">
                            <h4>Item Total</h4>
                            <div class="ml-auto font-weight-bold"> <%=sum %> </div>
                        </div>
                  
                        <hr class="my-1">
                        <div class="d-flex">
                            <h4>Coupon Discount</h4>
                            <%if(sum>range){%>
                            <div class="ml-auto font-weight-bold"> <%=coupondis%>%</div>
                            <%}else{ %>
                            <div class="ml-auto font-weight-bold"> 0%</div>
                            <%} %>
                        </div>
                        <div class="d-flex">
                            <h4>GST</h4>
                            <% long gst = (sum*2)/100;
                            System.out.println("gst"+gst);
                            extra = gst+extra ;%>
                            <div class="ml-auto font-weight-bold">2%</div>
                     
                        </div>
                        <div class="d-flex">
                            <h4>Shipping Cost</h4>
                            <%long shiping = (sum*1)/100;
                            System.out.println("Shiping"+shiping);
                            extra = shiping+extra ;%>
                            
                            <div class="ml-auto font-weight-bold">1%</div>
                    
                        </div>
                        <hr>
                        <div class="d-flex gr-total">
                            <h5>Grand Total</h5>
                             <%sum = sum+extra;%> 
                             <%long price =sum-margin ;  %>
                            <div class="ml-auto h5"> <%=sum-margin %> </div>
                           
                        </div>
                       	 <hr> </div>
              
                <div class="col-12 d-flex shopping-box"><a href="BillpaymentController?amount=<%=price %>" class="ml-auto btn hvr-hover">Checkout</a> </div>
                </div>
            </div>
            
                

          
          
        </div><br>
    	
    <%}else{ %>
		    <div class="container my-5">
		    	<div class="row">
				    	<div class="col-12">
						    	<div class="card bg-info text-white">
								    	<div class="card-body text-center">
								  			<h1><%=msge %> and for add Item</h1>
								  			<button class="btn hvr-hover""><a href="ShopList"  class="text-white">BROWSE RESTAURANTS</a></button>
								    	</div>
						    	</div>
				    	</div>
		    	</div>
		    </div>
  
  <%} %>
    <!-- End Cart -->
<%@include file="Footer.jsp" %>