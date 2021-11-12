<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="meet.bo.Item"%>
<%@page import="java.sql.SQLException"%>
<%@page import="meet.util.db.SisDbConnectionUtil"%>
<%@page import="meet.bo.Shop"%>
<%@page import="meet.bo.Coupon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="meet.bo.User_Order"%>
<%@page import="java.util.List"%>
<%@include file="Header.jsp" %>
<%List<User_Order> userObjList = (List<User_Order>)request.getAttribute("UserOrderObject");

	List<ArrayList<Item>> itemListByShop = new ArrayList<ArrayList<Item>>();
%>
<%List<Coupon> couponList = (List<Coupon>)session.getAttribute("couponList"); %>

<% 
Connection con=null;
 PreparedStatement pstmt=null;
 ResultSet rs = null;
 
 Coupon  coupon ;
 Shop shop  ;
 Item item ;
 
	 
	
 con = SisDbConnectionUtil.getConnection();
	 for(User_Order obj:userObjList){
		 System.out.println("Shop Name"+obj.getShop().getShop_name());
		 System.out.println("Order Id"+obj.getId());
		 System.out.println("Shop Details"+obj.getShop().getShop_address());
		 System.out.println("price"+obj.getPrice());
		 System.out.println("Dop"+obj.getDate());
		 
		 
		 
		 try {
			
			 String sql1 ="select muoi.item_id,muoi.item_quantity,muoi.price,mi.item_name"
			 		+ " from MEAT_USER_ORDER_ITEM muoi,Meat_item	 mi where mi.item_id=muoi.item_id and"
			 		+ " ORDER_DOP=? and "
			 		+ "user_mail_id=?";
				pstmt=con.prepareStatement(sql1);
				pstmt.setTimestamp(1, obj.getDate());
				pstmt.setString(2,user.getMail_id() );
				rs = pstmt.executeQuery();
				
				ArrayList<Item> itemList = new ArrayList<Item>();
				while(rs.next()){
					item = new Item();
					
					long item_id = rs.getLong(1);
					long item_quantity = rs.getLong(2);
					long item_price = rs.getLong(3);
					String item_name = rs.getString(4);
					
					item.setItem_id(item_id);
					item.setItem_quantity(item_quantity);
					item.setItem_price(item_price);
					item.setItem_name(item_name);
					
					itemList.add(item);
					
					
				//	System.out.println("shop_name= "+shop_name);
					}
				itemListByShop.add(itemList);
				
				
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
		 System.out.println("***************************");
	 }
	
			try {
				SisDbConnectionUtil.closeConnection(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
%>
<style>
 .img-box {
    width: 50px;
    height: 50px;
    overflow: hidden;
    border-radius: 5px;
  }
  .img-box img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
  .order-section {
    font-size: 80%;
  }
  .title {
    overflow: hidden;
  }
  .title h6 {
    width: 100%;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
  }
  .subtotal-bg {
    background: #fffed361;
  }
  .saving-box {
    border: 1px solid #47a745;
    border-radius: 5px;
    background: #47a74526;
  }
  
.profile-box .nav-pills .nav-link{
    color: #fff;
}

.profile-box .nav-pills .nav-link.active, .show>.nav-pills .nav-link{
    color: #565a5f;
    background-color: #ffffff;
    border-radius: 0;
}

.account-form input,.account-form textarea{
border: none;
    border-bottom: 2px solid #565a5f;
    border-radius: 0;
}

.account-form input:focus,.account-form textarea:focus{
outline:none !important;
border-color:#565a5f  !important;
box-shadow:none !important;
background: #f7f7f7  !important;
}
</style>
<div class="py-4" style=" background: #565a5f;">
<div class="container">
<div class="row">
<div class='col-md-10'>
<h1 class="mb-1 text-white"><b><%=user.getUser_name() %></b></h1>
<div class="d-flex align-items-end">
<%if(user.getUser_phone()!=null){ %>
<p class="mb-0 text-white"><%=user.getUser_phone()%></p>
<span class="mx-2 text-white">.</span>
<%} %>
<p class="mb-0 text-white"><%=user.getMail_id() %></p>
</div>
</div>
<div class="col-md-2">
<button class="btn btn-outline-info" style="background: white;color: #565a5f;border-color: white;">Edit Profile</button>
</div>
</div>
</div>
</div>

<div class="container my-3 profile-box">

<div class="row">
<div class="col-md-2 px-0" style="   background: #565a5f;
    padding: 10px;">
<div class="nav flex-column nav-pills" style="padding-left: 20px;" id="v-pills-tab" role="tablist" aria-orientation="vertical">
  <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">Account</a>
  <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">Orders</a>
  <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">Address</a>
</div>
</div>
<!-- Account Start -->
<div class="col-md-10">
<div class="tab-content" id="v-pills-tabContent">
  <div class="tab-pane fade show active  p-2" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
  <h4><b>Edit Account</b></h4>
  <form class="login100-form validate-form account-form" action="UserDetailsChangeController" method="post">
				<div class="form-group">
				<lable> Name</lable>
				<div class="wrap-input100  m-b-20" data-validate="Phone">
					<input class="form-control" type="text" name="username" value="<%=user.getUser_name().toUpperCase()%>" autofocus="autofocus" >
				</div>
				</div>
				
				<div class="form-group">
				<lable>Email Id</lable>
				<div class="wrap-input100 validate-input m-b-20" data-validate="Phone">
					<input class="form-control" type="text" name="email" value="<%=user.getMail_id() %>" autofocus="autofocus" readonly="readonly" >
				</div>
				</div>
				
					
				<div class="form-group">
				<lable>Password</lable>
				<div class="wrap-input100 validate-input m-b-20" data-validate="Phone">
					<input class="form-control" type="password" name="password" value="<%=user.getUser_password() %>" autofocus="autofocus">
				</div>
				</div>

				<div class="text-right">
					<button class="btn btn-outline-success">
						Save
					</button>
				</div> 
			</form>
  
  </div>
  
  <div class="tab-pane fade p-2" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
  <h4><b>Orders History</b></h4>
  <div class="container my-3">
  	<div class="row">
  	 <%int i=0; 
  	 String dateString2 ="";%>
  <%for(User_Order obj:userObjList){ %>
	  
				  <!--First Start Order  -->
				    <div class="col-lg-4 col-md-4 col-sm-6 col-12 mb-4 pb-2">
				      <div class="rounded border p-2">
				        <div
				          class="d-flex flex-wrap justify-content-space-between border-bottom pb-1"
				        >
				          <div class="px-0 d-flex col-8">
				            <div class="img-box col-3 px-0">
				              <img
				                src="ImageViewControllerShop?shop_id=<%=obj.getShop().getShop_id()%>"
				                class="rounded-img"
				              />
				             <%--  <img src="ImageViewControllerShop?shop_id=<%=obj.getShop().getShop_id()%>" class="img-fluid" alt="Image"> --%>
				            </div>
				            <div class="title px-2">
				              <h6 class="mb-0"><%=obj.getShop().getShop_name() %></h6>
				              <p class="text-muted py-0 small"><%=obj.getShop().getShop_address() %></p>
				            </div>
				          </div>
				          <div class="text-right col-4 px-2">
				            <p class="mb-0">
				              
				            <%=obj.getStatus() %> 
				            </p>
				          </div>
				        </div>
				        <div class="order-section">
				          <div class="py-2">
				            <p class="mb-0 font-weight-bold">Order Number</p>
				            <p class="mb-0 text-muted py-0"><%=obj.getId() %></p>
				          </div>
				          <div class="py-2">
				            <p class="mb-0 font-weight-bold">Total Amount</p>
				            <p class="mb-0 text-muted py-0"><i class="fa fa-inr"></i> <%=obj.getPrice() %></p>
				          </div>
				          <div class="py-2">
				            <p class="mb-0 font-weight-bold">Items</p>
				         <%List<Item> itemList = itemListByShop.get(i); %>
				         <%for(Item iobj:itemList){ %>
				            <p class="mb-0 text-muted py-0"><%=iobj.getItem_quantity() %> x <%=iobj.getItem_name() %></p>
				          <%} %>
				          </div>
				          <div class="py-2">
				            <p class="mb-0 font-weight-bold">Order On</p>
<!-- 				            <p class="mb-0 text-muted py-0">Dec 15 ,2020 at 05:00 PM</p> -->
						
								<% 
								Timestamp time = obj.getDate();
								java.util.Date date = new java.util.Date(time.getTime());
								
								
								DateFormat dateFormat2 = new SimpleDateFormat("EEEE, dd MMMM yyyy hh:mm aa");
						    	 dateString2 = dateFormat2.format(date).toString();
						    	
						    	 %>
				            <p class="mb-0 text-muted py-0"><%=dateString2%></p>
				          </div>
				        </div>
				        <div class="text-right">
				          <button
				            class="btn btn-sm btn-block btn-rounded btn-outline-danger"
				            data-toggle="modal"
				            data-target="#<%=obj.getId()%>"
				          >
				            Order Details
				          </button>
				        </div>
				      </div>
				    </div>
				    
				    <!-- First Order End  -->
				    <!-- order Modal start-->
<!-- Modal -->
<div

  class="modal fade"
  id="<%=obj.getId() %>"
  tabindex="-1"
  role="dialog"
  aria-hidden="true"
>
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header border-0">
        <h5 class="modal-title" id="exampleModalLongTitle">Order Details</h5>
        <button
          type="button"
          class="close"
          data-dismiss="modal"
          aria-label="Close"
        >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div
          class="d-flex flex-wrap justify-content-space-between border-bottom pb-1 px-3"
        >
          <div class="px-0 d-flex col-12">
            <div class="img-box col-2 px-0">
                <img
				                src="ImageViewControllerShop?shop_id=<%=obj.getShop().getShop_id()%>"
				                class="rounded-img"
				              />
            </div>
            <div class="px-2">
              <h6 class="mb-0"><%obj.getShop().getShop_name();%></h6>
              <p class="text-muted py-0 small"><%=obj.getShop().getShop_address() %></p>
            </div>
          </div>
        </div>
        <div class="order-modal-details">
          <h5 class="py-2 mb-0 px-3">Your Order</h5>
          <div class="row mx-0 justify-content-space-between mb-4">
                          
                <%List<Item> itemList1 = itemListByShop.get(i); %>
                <%long sum = 0; 
                long margin = 0;%>
				         <%for(Item iobj:itemList1){ %>
				         <%long prod = 0; %>
            <div class="col-9">
              <p class="font-weight-bold mb-0 text-muted py-0">
                <%=iobj.getItem_name() %>
              </p>
				            <p class="mb-0 text-muted py-0"><%=iobj.getItem_quantity() %> x<i class="fa fa-inr"></i> <%=iobj.getItem_price()%></p>
           <%--    <small><b><%=iobj.getItem_quantity() %> X <i class="fa fa-inr"></i><%=iobj.getItem_price() %></b></small> --%>
            </div>
              
              <% prod = iobj.getItem_quantity()*iobj.getItem_price() ;%>
              <%sum  =sum+prod; %>
            <div class="col-3 d-flex align-items-center justify-content-end">
              <p class="mb-0 text-right"><i class="fa fa-inr"></i><%=prod %></p>
            </div>
				          <%} %> 
				          
            
          </div>
          <div class="subtotal-bg py-2">
            <div class="row mx-0 justify-content-space-between">
              <div class="col-9">
                <p class="font-weight-bold mb-0 text-muted py-0">Subtotal</p>
              </div>
              <div class="col-3 d-flex align-items-center justify-content-end">
                <p class="mb-0 text-right"><i class="fa fa-inr"></i><%=sum %></p>
              </div>
            </div>
            <div class="row mx-0 justify-content-space-between">
              <div class="col-9">
              	<%String codeName = obj.getCoupon().getCode();
              
              	%> 
              	<%Coupon couponObj = null; %>
               	<%for(Coupon coupon1:couponList){ 
               		if(coupon1.getCode().equalsIgnoreCase(codeName)){
               		
               			
               			couponObj = coupon1;
               	
               			break;       
               		} 
               	}
               	//code for coupon margin
               
           
                %>
                
               <%long max_value = 0 ; %>
                <p class="font-weight-bold mb-0 text-success">
                 <%if(couponObj!=null){ %>
                 Promo - ( <%=couponObj.getValue() %>off up to <i class="fa fa-inr"></i><%=couponObj.getMax_value() %> )  
               <%}else{ %>
              	No Promo Code Apply
               <% }%> 
                </p>
              </div>
              <%if(couponObj!=null){ 
            	  
            	  	max_value = couponObj.getMax_value();
                    
                   	  System.out.println("--------------Sum is greater Than Range-------------------------");
                   	  margin = (sum*10)/100;
                   	  
                   	  if(margin>max_value){
                   		  margin = max_value;
                   	  }
                   	  System.out.println("margin is  "+margin);
              
              %>
                <div class="col-3 d-flex align-items-center justify-content-end">
                <p class="text-right text-success mb-0"><i class="fa fa-inr"></i>-<%=margin %></p>
                
              </div>
             <%} %>
               
              </div>
            </div>
            
            <div class="row mx-0 justify-content-space-between">
              <div class="col-9">
                <p class="small mb-0 text-muted py-0">GST Charge</p>
              </div>
              <div class="col-3 d-flex align-items-center justify-content-end">
              <%long GST = (sum*2)/100; 
              sum = sum+GST;%>
                <p class="small mb-2 text-right text-muted py-0"><i class="fa fa-inr"></i><%=GST %></p>
              </div>
            </div>
            
            <div class="row mx-0 justify-content-space-between">
              <div class="col-9">
                <p class="small mb-0 text-muted py-0">Delivery Charge</p>
              </div>
              <div class="col-3 d-flex align-items-center justify-content-end">
              <%long shiping = (sum*1)/100; 
              sum = sum+shiping;%>
                <p class="small mb-2 text-right text-muted py-0"><i class="fa fa-inr"></i><%=shiping %></p>
              </div>
              
            </div>
            
            <div class="px-2">
              <div
                class="row mx-0 justify-content-space-between saving-box py-1"
              >
                <div class="col-9">
                  <p class="small mb-0 text-success">Total Saving</p>
                </div>
                <div
                  class="col-3 d-flex align-items-center justify-content-end"
                >
                  <p class="small text-right mb-0 text-success"><i class="fa fa-inr"></i><%=margin %></p>
                </div>
              </div>
            </div>
            <hr />
            <div class="row mx-0 justify-content-space-between">
              <div class="col-9">
                <p class="mb-0">Total</p>
              </div>
              <div class="col-3 d-flex align-items-center justify-content-end">
                <p class="text-right mb-0"><i class="fa fa-inr"></i><%=sum-margin %></p>
              </div>
            </div>
          </div>
		</div>
		<div class="row border-bottom"></div>
		<div class="col-12">
			<div class="order-section">
				<div class="py-2">
				  <p class="mb-0 font-weight-bold">Order Number</p>
				  <p class="mb-0 text-muted py-0"><%=obj.getId() %></p>
				</div>
				
				
				<div class="py-2">
				  <p class="mb-0 font-weight-bold">Deliver To</p>
				  <p class="mb-0 text-muted py-0"><%=user.getUser_address()
				  %>
				</p>
				</div>
				<div class="py-2">
				  <p class="mb-0 font-weight-bold">Order On</p>
				  <p class="mb-0 text-muted py-0"><%=dateString2 %></p>
				</div>
			  </div>
		</div>
      </div>
    </div>
  </div>
				<%
				i=i+1;} %>
</div>
<!-- order Modal end -->


   
  </div>
</div>
  </div>
  
  
  <div class="tab-pane fade  p-2" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
  <div class="d-flex justify-content-between">
  <h4><b>Manage Addresses</b></h4>
 
  </div>
  <div class="my-3">
  <div class="d-flex flex-wrap">
  <div class="col-md-6 my-2">
  <div class="address-box border d-flex p-3">
  	<div class="px-2">
  	<h4><i class="fa fa-home"></i></h4>
  	</div>
  	<div>
  	<h5><b>Home</b></h5>
  	<%if(user.getUser_address()==null){ %>
  	 <button class="btn btn-sm btn-outline-primary" data-toggle="modal" data-target=".add-address-modal">NEW ADDRESS</button>
  	<%}else{ %>
  	<p><%=user.getUser_address() %>
  	</p>
  	<div class="mt-1">
  	<button class="btn btn-link p-0" data-toggle="modal" data-target=".edit-address-modal"><b>EDIT</b></button>
  	<a href="UserDetailsChangeController"><button class="btn btn-link p-0 px-2"><b>DELETE</b></button></a>
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

</div>
</div>

	
	<div id="dropDownSelect1"></div>
	
	
	<div class="modal edit-address-modal" tabindex="-1" role="dialog">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
    
      <div class="modal-header">
        <h5 class="modal-title">Edit Address</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <form action="UserDetailsChangeController">
      <div class="modal-body">
        
        <div class="form-group">
        <lable>Address</lable>
        <textarea class="form-control mt-2" name="address"><%=user.getUser_address() %></textarea>
        </div>
        
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary" >Save changes</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
      </form>
      
    </div>
  </div>
</div>

<div class="modal add-address-modal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Address</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="UserDetailsChangeController" >
      <div class="modal-body">
        
        <div class="form-group">
        <lable>Address</lable>
        <textarea class="form-control mt-2" name="address"></textarea>
        </div>
        
      </div>
      <div class="modal-footer">
       <button type="submit" class="btn btn-primary" >Save </button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
      </form>
    </div>
  </div>
</div>


	
<%@include file="Footer.jsp" %>