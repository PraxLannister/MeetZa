<%@ include file="Header.jsp" %>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- <div class="container">
  <h2>Modal Login Example</h2>
  Trigger the modal with a button
  <button type="button" class="btn btn-default btn-lg" id="myBtn">Login</button>

  Modal
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      Modal content
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form" action="AjaxController" method="post">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
              <input type="text" class="form-control" id="usrname" placeholder="Enter email" >
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="text" class="form-control" id="psw" placeholder="Enter password">
            </div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>Not a member? <a href="#">Sign Up</a></p>
          <p>Forgot <a href="#">Password?</a></p>
        </div>
      </div>
      
    </div>
  </div> 
</div>
 
<script>
$(document).ready(function(){
  $("#myBtn").click(function(){
    $("#myModal").modal();
  });
});
</script> -->
<!-- <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js" ></script>


 -->

  <!--    <div class="mt-1">
  	<button class="btn btn-link p-0" data-toggle="modal" " data-target=".edit-address-modal"><b>
  	EDIT</b>
  </div>  -->
  
  
   <button type="button" class="btn btn-default btn-lg" id="myBtn">Login</button>
    <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    		<div class="modal-content">
    
      <div class="modal-header">
        <h5 class="modal-title">Edit Address</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <form role="form" action="UserDetailsChangeController">
      <div class="modal-body">
        
        <div class="form-group">
        <lable>Address</lable>
        <textarea class="form-control mt-2" name="address" id="address"></textarea>
        </div>
        
      </div>
      <div class="modal-footer">
     <button type="submit" class="btn btn-primary"  >Save changes</button> 
         <!-- <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button> -->
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
      </form>
      
    </div>
    </div>
    </div>
    
 <script>
$(document).ready(function(){
  $("#myBtn").click(function(){
    $("#myModal").modal();
  });
});
</script>

<%@include file="Footer.jsp" %>