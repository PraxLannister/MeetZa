<%@include file="Header.jsp" %>
<%String erromsg = (String)request.getAttribute("error");%>

<div class="container-login100" >
        <div class="wrap-login1001 p-l-555 p-r-555 p-t-800 p-b-300" style="padding-left: 30px">
      
            <form class="login100-form validate-form" action="OtpVerifyController">
            	
                <span class="login100-form-title p-b-37">
                 
          Enter OTP
        </span>

        <div class="wrap-input1001 validate-input m-b-20" data-validate="OTP">
        
          <input class="input100" type="text" name="otp" placeholder="OTP" autofocus="autofocus">
          <% if(erromsg!=null){%>
			<h6 style="padding: 10px ;color: red"><%=erromsg %></h6>
		<%} %>
          <span class="focus-input100"></span>
        </div>


        <div class="container-login100-form-btn">
          <button class="login100-form-btn">
            Submit
          </button>
        </div>
</form>

			
		</div>
	</div>
	
	<div id="dropDownSelect1"></div>
<%@include file="Footer.jsp" %>