<%@include file="Header.jsp"%>
<%String forgot = "forgot"; %>
<%String erromsg = (String)request.getAttribute("loginErroMsg");
User user1 = (User)request.getAttribute("userObj");%>

<div class="container-login100" >
        <div class="wrap-login1001 p-l-555 p-r-555 p-t-800 p-b-300" style="padding-left: 30px">
            <form class="login100-form validate-form" action="LoginController" method="post">
                <span class="login100-form-title p-b-37">
          Sign In
        </span>
 
        <div class="wrap-input1001 validate-input m-b-20" data-validate="Enter username or email">
       <% if(erromsg!=null){%>
			<h6 style="padding: 10px ;color: red"><%=erromsg %></h6>
		<%} %>
 		<%if(user1!=null) {%>
          <input class="input100" type="text" name="email" placeholder="email" value="<%=user1.getMail_id()%>">
        <%} else{%>
          <input class="input100" type="text" name="email" placeholder="email">
          <%} %>
          <span class="focus-input100"></span>
        </div>

        <div class="wrap-input1001 validate-input m-b-25" data-validate = "Enter password">
          <input class="input100" type="password" name="password" placeholder="password">
          <span class="focus-input100"></span>
        </div>

        <div class="container-login100-form-btn">
          <button class="login100-form-btn">
            Sign In
          </button>
        </div>

        <div class="text-center">
          <a href="SignUp.jsp" class="txt2 hov1">
            Sign Up
          </a>
        </div>
		
		<%if(erromsg!=null){%>
        <div class="text-center">
          <a href="SignUp.jsp?forgot=<%=forgot %>" class="txt2 hov1">
            Forgot Password
          </a>
        </div>
        <%} %>
</form>

			
		</div>
	</div>
	
	<div id="dropDownSelect1"></div>

<%@include file="Footer.jsp"%>