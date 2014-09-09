<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<!-- saved from url=(0033)http://www.firstaidcprcourse.com/ -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta http-equiv="Content-Style-Type" content="text/css">

<title>Register</title>
<!-- bootstrap 2.3.0 -->
    <!-- style sheets bootstrap 2.3.0 -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/bootstrap-responsive.css" rel="stylesheet">
	<link href="/css/site.css" rel="stylesheet">
    <!-- style sheets End -->
    <!----======================== Java scripts =============================----->
    <!-- jQuery (latest version) -->
    <script src="/js/jquery-1.8.2.js"></script>
	<script src="/js/jquery-ui-1.8.24.js"></script>
	<script src="/js/jquery.bxslider.min.js"></script>
    <!-- bootstrap 2.3.0 -->
    <script type="text/javascript" src="/js/bootstrap.js"></script>
    <script type="text/javascript" src="/js/script.js"></script>
    <!----======================== End =====================================----->
</head>
<body>
<!-- Header -->
    <div class="container">
        <div class="row-fluid">
            <div class="span4">
                <a href="/home">
                        <img src="/images/logo-cross-fa4.png" border="0">
                </a>
            </div>

        </div> 
    </div>   
	<div style="background-image: url(/images/header_bg.jpg)">
	<div class="container">
	<div>Registration Page</div>
	<form id="f" name="f" action="register" method="post">
		<div>
			<span>First Name</span>
			<span> 
				<input type="text" onblur="if (this.value == '') {this.value = 'Your First Name';}" onfocus="if(this.value == 'Your First Name') {this.value = '';}" maxlength="50" value="${user.firstName}" class="text" id="firstName" name="firstName" /> 
			</span>
	   </div>
		<div>
			<span>Last Name</span>
			<span> 
				<input type="text" onblur="if (this.value == '') {this.value = 'Your Last Name';}" onfocus="if(this.value == 'Your Last Name') {this.value = '';}" maxlength="50" value="${user.lastName}" class="text" id="lastName" name="lastName" /> 
			</span>
	   </div>

		<div>
			<span>Email</span>
			<span> 
				<input type="text" onblur="if (this.value == '') {this.value = 'Your Email';}" onfocus="if(this.value == 'Your Email') {this.value = '';}" maxlength="50" value="${user.email}" class="text" id="email" name="email" /> 
			</span>
	   </div>

	   <div>
			<span>&nbsp;</span><span> <input type="submit" value="Submit" id="submit" /> </span>
	   </div>
	</form>
	</div>
	</div>
<!-- Header End -->


<!-- Footer Start -->
<div class="container">
	<br>
</div>
<!-- Footer End --> 

</body></html>