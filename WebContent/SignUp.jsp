<%@include file="Header.jsp" %>
<%String erromsg = (String)request.getAttribute("error");%>
<%String num = request.getParameter("forgot"); 
System.out.println(num);
%>
<div class="container-login100" >
        <div class="wrap-login1001 p-l-555 p-r-555 p-t-800 p-b-300" style="padding-left: 30px">
<%-- <%if(num.equals("forgot")){ %> --%>
          <%--   <form class="login100-form validate-form" action="EmailVerifcation?forgot=<%=num%>"> --%>
          <%-- <%}else{ %> --%>
          <%-- <%} %> --%>
          <%if(num==null){ %>
            <form class="login100-form validate-form" action="EmailVerifcation">
            <%}else{ %>
            <form class="login100-form validate-form" action="EmailVerifcation" method="post">
            
            <%} %>
                <span class="login100-form-title p-b-37">
                 
          Sign up
        </span>

        <div class="wrap-input1001 validate-input m-b-20" data-validate="Enter username or email">
          <input class="input100" type="text" name="emailid" placeholder="Enter your email">
          <% if(erromsg!=null){%>
			<h6 style="padding: 10px ;color: red"><%=erromsg %></h6>
		<%} %>
          <span class="focus-input100"></span>
        </div>


        <div class="container-login100-form-btn">
          <button class="login100-form-btn">
            Verify your mail
          </button>
        </div>
</form>

			
		</div>
	</div>
	
	<div id="dropDownSelect1"></div>
<%@include file="Footer.jsp" %>