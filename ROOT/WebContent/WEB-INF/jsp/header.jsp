<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
    <link href="/css/bootstrapValidator.min.css" rel="stylesheet" />
	<link href="/content/site.css" rel="stylesheet" />
    <!-- style sheets End -->
    <!----======================== Java scripts =============================----->
    <!-- jQuery (latest version) -->
    <script src="/js/jquery-1.8.2.js"></script>
	<script src="/js/jquery-ui-1.8.24.js"></script>
	<script src="/js/jquery.validate-min.js"></script>
	<script src="/js/jquery.bxslider.min.js"></script>
    <!-- bootstrap 2.3.0 -->
    <script type="text/javascript" src="/js/bootstrap.js"></script>
    <script type="text/javascript" src="/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="/js/script.js"></script>
    <script type="text/javascript" src="/js/utils.js"></script>
    <!----======================== End =====================================----->
	<script type="text/javascript" >
	<c:if test="${user.email == null}">
		$(document).ready(function() {
	    	$('#openBtn').click(function(){
	    		$('#myLogin').modal({show:true})
	    	});
	    	$('#openBtn').click(function(){
	    		$('#myRegister').modal({show:true})
	    	});
		});
	 </c:if>   
	 <c:if test="${user.email != null}">
	 	$(document).ready(function(){
	 		$('#logouta').click(function(e){
	 			e.preventDefault();	
	 			processLogout();
	 		});
	 	});
	 
	 </c:if>
    </script>
</head>
<body>
<!-- Header -->
    <div class="container">
        <div class="row-fluid">
            <div class="span4">
                <a href="/">
                        <img src="images/logo-cross-fa3.png" border=0>
                </a>
            </div>
            <div class="span8" align=right>
            	<div id="userHead">
					<c:if test="${user.email == null}">
						<a href="#registerModal"  data-toggle="modal" data-target="#registerModal"> Not a Member? Join Now For FREE </a> | 
						<a href="#loginModal"  data-toggle="modal" data-target="#loginModal" >Login</a>
					</c:if>
					<c:if test="${user.email != null}">
	 					Welcome, ${user.firstName} ${user.lastName} | <a id="logouta" href="" >Log out</a>
	 				</c:if>
						
				</div>
				<br>
				<span class="glyphicon glyphicon-phone" style="margin-right: 5px;"></span>1-877-295-0933 <br>          
				Mon - Fri, 9am - 8pm EST <br>  
    			<div class="clearfix"></div>
            </div>
        </div> 
    </div>   
	<div style="background-image: url(images/header_bg.jpg)">
	<div class="container">
		<ul class="nav nav-pills">
    		<li class='<%= request.getParameter("menu1")%>'><a href=/>Home</a></li>
    		<li class='<%= request.getParameter("menu2")%>'><a href=/certify>Pricing</a></li>
    		<li class='<%= request.getParameter("menu3")%>'><a href=/courses>Training Courses</a></li>
    		<li class='<%= request.getParameter("menu4")%>'><a href=/faq>FAQ's</a></li>
    		<li><a href="#myRegister" data-toggle="modal" >Register</a></li>
    		<li><a href="#myLogin" data-toggle="modal" >Log In</a></li>
    		<li class='<%= request.getParameter("menu5")%>'><a href=/contact>Contact Us</a></li>
		</ul>
	</div>
	</div>
<!-- Header End -->
<!-- Popups -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
	                        <div class="col-md-6">
	                            <input type="text" class="form-control" name="email" id="email" required />
	                        </div>
	                  </div>
	                  <div class="form-group">
	                        <label class="col-md-3 control-label">Password</label>
	                        <div class="col-md-6">
	                            <input type="password" class="form-control" name="password" id="password" />
	                        </div>
	                  </div>
	                  <div class="form-group">
        					<div class="col-md-9 col-md-offset-3">
            					<div id="loginMessages"></div>
            					<div id="loginAjaxMessages"> </div>
        					</div>
    				  </div>
	                  <div class="form-group">
	                        <div class="col-md-5 col-md-offset-3">
	                            <button type="submit" id="loginSubmit" class="btn btn-default">Login </button>
	                            <button class="btn btn-default" id="forgotPassButton" data-dismiss="modal" type="button">Forgot Password</button>
	                        </div>
	                 </div>
	              </form>
	            </div>  
	              <center>By clicking <b>Login</b>, you agree to our <a href="#">Terms </a>
	            	and <br>that you have read our <a href="#">Privacy Policy </a>
				  </center>
		     </div>
		   </div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	
	<div class="modal fade" id="forogotPassModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title"><center>Forgot Password</center></h4>
		      </div>
		      <div class="modal-body">
		          <form id="forogotPassForm" method="post" class="form-horizontal">
  					  <div class="form-group">
	                        <label class="col-md-3 control-label">Email Address</label>
	                        <div class="col-md-6">
	                            <input type="text" class="form-control" name="email" id="email" required />
	                        </div>
	                  </div>
	                  <div class="form-group">
        					<div class="col-md-9 col-md-offset-3">
            					<div id="forgotPassMessages"></div>
            					<div id="forgotPassAjaxMessages"> </div>
        					</div>
    				  </div>
	                  <div class="form-group">
	                        <div class="col-md-5 col-md-offset-3">
	                            <button type="submit" id="forgotPassSubmit" class="btn btn-default">Submit Email</button>
	                            <button class="btn btn-default" id="loginButton" data-dismiss="modal" type="button">Login</button>
	                        </div>
	                 </div>
	              </form>
	            </div>  
	              <center>By clicking <b>Login</b>, you agree to our <a href="#">Terms </a>
	            	and <br>that you have read our <a href="#">Privacy Policy </a>
				  </center>
		     </div>
		   </div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->


	
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		    <div id="registerModalContent" class="modal-content">
		    	<div class="modal-header">
		        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        	<h4 class="modal-title"><center>Site Registration</center></h4>
		      	</div>
		    	<div class="modal-body">
		    		<form id="registerForm" method="post" class="form-horizontal">
	              	  	<div class="form-group">
	                        <label class="col-md-3 control-label">First Name</label>
	                        <div class="col-md-6">
	                            <input type="text" class="form-control" name="firstname" id="firstname" maxlength="15"/>
	                        </div>
	                  	</div>
	                  	<div class="form-group">
	                        <label class="col-md-3 control-label">Last Name</label>
	                        <div class="col-md-6">
	                            <input type="text" class="form-control" name="lastname" id="lastname" maxlength="15"/>
	                        </div>
	                 	 </div>
	                 	 <div class="form-group">
	                        <label class="col-md-3 control-label">Email Address</label>
	                        <div class="col-md-6">
	                            <input type="text" class="form-control" name="email" id="email" maxlength="25"/>
	                        </div>
	                 	 </div>
	                  	 <div class="form-group">
	                        <label class="col-md-3 control-label">Password</label>
	                        <div class="col-md-6">
	                            <input type="password" class="form-control" name="password" id="password" maxlength="10"/>
	                        </div>
	                  	 </div>
	                  	 <div class="form-group">
	                        <label class="col-md-3 control-label">Confirm Password</label>
	                        <div class="col-md-6">
	                            <input type="password" class="form-control" name="confirmpassword" id="confirmpassword" maxlength="10"/>
	                        </div>
	                  	 </div>

	                  	 <div class="form-group">
        					<div class="col-md-9 col-md-offset-3">
            					<div id="registerMessages"></div>
            					<div id="registerAjaxMessages"> </div>
        					</div>
    				    </div>
	                  	<div class="form-group">
	                  		<div class="col-md-5 col-md-offset-3">
								<button class="btn btn-default" id="registerSubmit" type="submit">Register</button>
								<button class="btn btn-default" data-dismiss="modal" type="button">Close</button>
							</div>
				  		</div> 
					</form>	
				</div>	
					<center>By clicking <b>Register</b>, you agree to our <a href="#">Terms </a>
	            	and <br>that you have read our <a href="#">Privacy Policy </a></center>	
	 			</div><!--  </form>-->
	 		</div>
	</div>
	