<!DOCTYPE html>
<%@page import="meet.bo.User"%>

<html lang="en">
<!-- Basic -->

<head>
<style>
/*  start*/

.dropbtn {
  background-color: #b0b435;
  color: #ffffff;
  padding: 12px;
 font-family: monospace;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

	
	.box-img-hover  img{
		width: 255px;
		height: 255px;
		object-fit: cover;
	}
	
	.shop-cat-box  img{
   width: 255px;
	height: 255px;
	object-fit: cover;
}
	

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #222;}
</style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>MeetZa</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
  <!--   <link rel="shortcut icon" href="images/meat.ico" type="image/x-icon"> -->
<!--     <link rel="apple-touch-icon" href="images/apple-touch-icon.png"> -->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">
	
	<title>SignUp</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="imag" href="images/icons/meat.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
 <%
 	User user=null;
 	if(session.getAttribute("user")!=null){
 		user=(User)session.getAttribute("user");
 	}
 %>
<body>
    <!-- Start Main Top -->
    <header class="main-headers">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <!-- Start Header Navigation -->
					                <div class="navbar-header">
					                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
					                    <i class="fa fa-bars"></i>
					                </button>
					                    <a class="navbar-brand" href="index.jsp"><img src="images/Logo.png"  style="width:  100px"      class="meet"  alt="" ></a>
					                </div>	
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu" style="padding-left: 35px;">
               <form action="SearchByItemNameController" method="get">
              			<div class="input-group">
  								<input type="text" class="form-control" placeholder="Search" style="width: 343px" name="item_name"> 
										  <div class="input-group-append">
										    <button class="btn btn-dark" type="submit" >Go</button>
										  </div>
						</div>
				 </form>
                    	<ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
			                        <li class="nav-item active"><a class="nav-link" href="index.jsp">Home</a></li>
			                        <li class="nav-item"><a class="nav-link" href="About.jsp">About Us</a></li>
			                        <li class="nav-item d-none"><a class="nav-link" href="OrderHistoryController">Order History</a></li>
			                         <li class="nav-item"><a class="nav-link" href="ShopList">Shop</a></li>
			                        <li class="nav-item"><a class="nav-link" href="ContactUs.jsp">Contact Us</a></li>
									      <%if(user!=null){ %>   
			                        <li class="nav-item"><a class="nav-link" href="CartViewController">Cart</a></li>
                							<%} %>
									
			                     	      <%if(user==null){ %>   
              					  <li class="nav-item"><a class="nav-link" href="Login.jsp">login</a></li>
                							<%} %>
                							 <%if(user!=null) {
                 String role = (String)user.getRole();
                 %>
					<div class="dropdown">
					  <button class="dropbtn" style="    width: 100px;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;"><%=user.getUser_name() %></button>
							 <div class="dropdown-content">
							    <a href="OrderHistoryController" style="font-family: monospace;">My Account</a>
							
							    <a href="LogOutController" style="font-family: monospace;">logout</a>
							    
							    
							    <%if(role!=null){
							    	if(role.equals("admin")){ %>
							    
							    <a href="Upload.jsp" style="font-family: monospace;">db</a>
						<%
							    }
							    	}%>
							    
							  </div>
					</div>
                 <%}%>
           				</ul>
                    
                </div>
                <!-- Start Atribute Navigation -->

                
          <%--   <div class="collapse navbar-collapse" id="navbar-menu">
                <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                 
                 <%if(user==null){ %>   
                <li class="nav-item"><a class="nav-link" href="Login.jsp">login</a></li>
                <%} %>
               
				</ul>
    		</div> --%>
                
                 
                 
                <!-- End Atribute Navigation -->
            </div>
            <!-- End Side Menu -->
        </nav>
        </header>
        <!-- End Navigation-->
    <!-- End Main Top -->

	<div class="top-search">
        <div class="container">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                <input type="text" class="form-control" placeholder="Search">
                <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
            </div>
        </div>
    </div>
  
</div>
