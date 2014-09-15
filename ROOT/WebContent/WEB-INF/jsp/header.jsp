<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>First Aid Prototype</title>
<!-- bootstrap 2.3.0 -->
    <!-- style sheets bootstrap 2.3.0 -->
    <link href="/content/bootstrap.css" rel="stylesheet" />
    <link href="/content/bootstrap-responsive.css" rel="stylesheet" />
	<link href="/content/site.css" rel="stylesheet" />
    <!-- style sheets End -->
    <!----======================== Java scripts =============================----->
    <!-- jQuery (latest version) -->
    <script src="/js/jquery-1.8.2.js"></script>
	<script src="/js/jquery-ui-1.8.24.js"></script>
	<script src="/js/jquery.bxslider.min.js"></script>
    <!-- bootstrap 2.3.0 -->
    <script type="text/javascript" src="/js/bootstrap.js"></script>
    <script type="text/javascript" src="/js/script.js"></script>
    <script type="text/javascript" src="/js/payment-utils.js"></script>
    <!----======================== End =====================================----->
	<script type="text/javascript" >
	    $('#openBtn').click(function(){
	    	$('#myLogin').modal({show:true})
	    });
	    $('#openBtn').click(function(){
	    	$('#myRegister').modal({show:true})
	    });
    </script>
</head>
<body>
<!-- Header -->
    <div class="container">
        <div class="row-fluid">
            <div class="span4">
                <a href="index.jsp">
                        <img src="images/logo-cross-fa3.png" border=0>
                </a>
            </div>
            <div class="span8" align=right>
				<a href="#myRegister"  data-toggle="modal" > Not a Member? Join Now For FREE </a> | 
				<a href="#myLogin"  data-toggle="modal" >Login</a><br>
				<span class="glyphicon glyphicon-phone" style="margin-right: 5px;"></span>1-877-295-0933 <br>          
				Mon - Fri, 9am - 8pm EST <br>  
    			<div class="clearfix"></div>
            </div>
        </div> 
    </div>   
	<div style="background-image: url(images/header_bg.jpg)">
	<div class="container">
		<ul class="nav nav-pills">
    		<li class='<%= request.getParameter("menu1")%>'><a href=index.jsp>Home</a></li>
    		<li class='<%= request.getParameter("menu2")%>'><a href=certify.jsp>Pricing</a></li>
    		<li class='<%= request.getParameter("menu3")%>'><a href=courses.jsp>Training Courses</a></li>
    		<li class='<%= request.getParameter("menu4")%>'><a href=faq.jsp>FAQ's</a></li>
    		<li><a href="#myRegister" data-toggle="modal" >Register</a></li>
    		<li><a href="#myLogin" data-toggle="modal" >Log In</a></li>
    		<li class='<%= request.getParameter("menu5")%>'><a href=contact.jsp>Contact Us</a></li>
		</ul>
	</div>
	</div>
<!-- Header End -->
<!-- Popups -->
	<div class="modal fade" id="myLogin" style="baground-color: grey;">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title"><center>Site Login</center></h4>
		      </div>
		      <div class="modal-body">
		          <form id="loginForm" method="post" class="form-horizontal">
	              	  <div class="form-group">
	                        <label class="col-md-3 control-label">Email Address</label>
	                        <div class="col-md-5">
	                            <input type="text" class="form-control" name="username" />
	                        </div>
	                  </div>
	                  <div class="form-group">
	                        <label class="col-md-3 control-label">Password</label>
	                        <div class="col-md-5">
	                            <input type="password" class="form-control" name="password" />
	                        </div>
	                  </div>
	                  <div class="form-group">
	                        <div class="col-md-5 col-md-offset-3">
	                            <button type="submit" class="btn-success">Login </button>
	                            <a href="#forgotPassword">Forgot Password</a>
	                        </div>
	                 </div>
	              </form>
	              <center>By clicking <b>Login</b>, you agree to our <a href="#">Terms </a>
	            	and <br>that you have read our <a href="#">Privacy Policy </a>
				  </center>
		     </div>
		   </div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<div class="modal fade" id="myRegister">
		<div class="modal-dialog">
		    <div class="modal-content">
		    	<div class="modal-header">
		        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        	<h4 class="modal-title"><center>Site Registration</center></h4>
		      	</div>
		    	<div class="modal-body">
		    		<form id="registerForm" method="post" class="form-horizontal">
	              	  	<div class="form-group">
	                        <label class="col-md-3 control-label">First Name</label>
	                        <div class="col-md-5">
	                            <input type="text" class="form-control" name="fname" />
	                        </div>
	                  	</div>
	                  	<div class="form-group">
	                        <label class="col-md-3 control-label">Last Name</label>
	                        <div class="col-md-5">
	                            <input type="text" class="form-control" name="lname" />
	                        </div>
	                 	 </div>
	                 	 <div class="form-group">
	                        <label class="col-md-3 control-label">Email Address</label>
	                        <div class="col-md-5">
	                            <input type="text" class="form-control" name="email" />
	                        </div>
	                 	 </div>
	                  	 <div class="form-group">
	                        <label class="col-md-3 control-label">Password</label>
	                        <div class="col-md-5">
	                            <input type="password" class="form-control" name="password" />
	                        </div>
	                  	 </div>
	                  	<div class="form-group">
	                  		<div class="col-md-5 col-md-offset-3">
							<button class="btn btn-default" data-dismiss="modal" type="button">Close</button>
							<button class="btn btn-success" data-dismiss="modal" type="button">Register</button>
							</div>
				  		</div> 
					</form>	
					<center>By clicking <b>Register</b>, you agree to our <a href="#">Terms </a>
	            	and <br>that you have read our <a href="#">Privacy Policy </a></center>	
	 			</div><!--  </form>-->
	 		</div>
		</div>
	</div>