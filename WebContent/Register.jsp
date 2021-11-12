<%@include file="Header.jsp" %>
<%String erromsg = (String)request.getAttribute("error");
if(erromsg!=null){
	User user1 = (User)request.getAttribute("userObj");
%>




<div class="container-login100" >

		<div class="wrap-login1001 p-l-555 p-r-555 p-t-800 p-b-300" style="padding-left: 30px ">
			<form class="login100-form validate-form" action="RegistrationController" method="post">
				<span class="login100-form-title p-b-37">
				
					Register Yourself
				</span>

        
        <div class="wrap-input1001 validate-input m-b-20" data-validate="Enter username">
          <input class="input100" type="text" name="username" placeholder="Enter Name" value="<%=user1.getUser_name()%>">
          <span class="focus-input100"></span>
        </div>

 

        <%-- <div class="wrap-input1001 validate-input m-b-20" data-validate="Email">
        <h6 style="padding: 10px ;color: red"><%=erromsg %></h6>
          <input class="input100" type="text" name="email" placeholder="Email" value="<%=user1.getMail_id()%>">
          <span class="focus-input100"></span>
        </div> --%>

        <div class="wrap-input1001 validate-input m-b-20" data-validate="Password">
          <input class="input100" type="password" name="password" placeholder="Password" value="<%=user1.getUser_password()%>">
          <span class="focus-input100"></span>
        </div>
		
		
        <div class="wrap-input1001 validate-input m-b-20" data-validate="Re-enter Password">
          <input class="input100" type="password" name="password"  value="<%=user1.getUser_password()%>" placeholder=" Re-enter Password">
          <span class="focus-input100"></span>
        </div>
		
        <div class="text-center">
         <div class="container-login100-form-btn">
          <button class="login100-form-btn">
            SUBMIT
          </button>
        </div> 
        </div>
     </form>

			
		</div>
	</div>
	
	<div id="dropDownSelect1"></div>
<%}else{ %>
<div class="container-login100" >

		<div class="wrap-login1001 p-l-555 p-r-555 p-t-800 p-b-300" style="padding-left: 30px ">
			<form class="login100-form validate-form" action="RegistrationController" method="post">
				<span class="login100-form-title p-b-37">
					Register Yourself
				</span>

        
        <div class="wrap-input1001 validate-input m-b-20" data-validate="Enter username">
          <input class="input100" type="text" name="username" placeholder="Enter Name">
          <span class="focus-input100"></span>
        </div>

 

       <!--  <div class="wrap-input1001 validate-input m-b-20" data-validate="Email">
          <input class="input100" type="text" name="email" placeholder="Email">
          <span class="focus-input100"></span>
        </div> -->

        <div class="wrap-input1001 validate-input m-b-20" data-validate="Password">
          <input class="input100" type="password" name="password" placeholder="Password">
          <span class="focus-input100"></span>
        </div>
		
		
        <div class="wrap-input1001 validate-input m-b-20" data-validate="Re-enter Password">
          <input class="input100" type="password" name="password" placeholder=" Re-enter Password">
          <span class="focus-input100"></span>
        </div>
		
        <div class="text-center">
         <div class="container-login100-form-btn">
          <button class="login100-form-btn">
            SUBMIT
          </button>
        </div> 
        </div>
     </form>

			
		</div>
	</div>
	
	<div id="dropDownSelect1"></div>
<%} %>
<%@include file="Footer.jsp" %>