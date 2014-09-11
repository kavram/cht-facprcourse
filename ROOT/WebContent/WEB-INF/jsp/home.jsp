<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<!-- saved from url=(0033)http://www.firstaidcprcourse.com/ -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta http-equiv="Content-Style-Type" content="text/css">

<title>First Aid Prototype</title>
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
            <div class="span8" align="right">
            	<c:if test="${user == null}"> 
					<a href="/register"> Not a Member? Join Now For FREE </a> | 
					<a href="/login"> Login</a><br>
				</c:if>
            	<c:if test="${user != null}"> 
					<a> Welcome ${user.firstName} ${user.lastName} </a> | 
					<a href="/logout"> Logout</a><br>
				</c:if>
				
				
				<span class="glyphicon glyphicon-phone" style="margin-right: 5px;"></span>1-888-888-8888 <br>          
				Mon - Fri, 9am - 8pm EST <br>
				<div class="pull-right social_links">
         			<span>Follow Us:- </span>
       				<a href="http://www.firstaidcprcourse.com/#"><img src="/images/g_plus.png" height="25px" width="25px"></a>
        			<a href="http://www.firstaidcprcourse.com/#" target="_blank"><img src="/images/youtube.png" height="25px" width="25px"></a>          
        			<a href="http://www.firstaidcprcourse.com/#"><img src="/images/in.png" height="25px" width="25px"></a>
        			<a href="http://www.firstaidcprcourse.com/#" target="_blank"><img src="/images/fb.png" height="25px" width="25px"></a>
        			<a href="http://www.firstaidcprcourse.com/#"><img src="/images/tweet.png" height="25px" width="25px"></a>
        			<a href="http://www.firstaidcprcourse.com/#"><img src="/images/email.png" height="25px" width="25px"></a>
    			</div>
    			<div class="clearfix"></div>
            </div>
        </div> 
    </div>   
	<div style="background-image: url(/images/header_bg.jpg)">
	<div class="container">
		<ul class="nav nav-pills">
    		<li class="active"><a href="/home">Home</a></li>
    		<li><a href="/certifications">Certifications</a></li>
    		<li><a href="/courses">Courses</a></li>
    		<li><a href="/vtraining">Virtual Training</a></li>
    		<li><a href="/group-discounts">Group Discounts</a></li>
    		<li><a href="/jobs">Job Openings</a></li>
    		<li><a href="/faq">FAQ</a></li>
    		<li><a href="/contact">Contact Us</a></li>
		</ul>
	</div>
	</div>
<!-- Header End -->
<!---=========== Start slider ==============----->
<div class="container">
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  	<!-- Indicators -->
  		<ol class="carousel-indicators">
    		<li data-target="#carousel-example-generic" data-slide-to="0" class=""></li>
    		<li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
    		<li data-target="#carousel-example-generic" data-slide-to="2" class="active"></li>
  		</ol>
 
		<!-- Wrapper for slides -->
  		<div class="carousel-inner">
    		<div class="item">
      			<img src="/images/header-bg6.png" alt="...">
      			<div class="carousel-caption">
          		<h2><span>Need To Get Certified For That Perfect Job?</span></h2>
      			</div>
    		</div>
    		<div class="item">
      			<img src="/images/header-bg7.jpg" alt="...">
      			<div class="carousel-caption">
          			<h2>We Offer Infant Training As Well</h2>
      			</div>
    		</div>
    		<div class="item active">
      			<img src="/images/header-bg8.jpg" alt="...">
      			<div class="carousel-caption">
          			<h2>Would You Know What To Do Next?</h2>
      			</div>
    		</div>
  		</div>
 	</div>
  <!-- Controls -->
  <a class="left carousel-control" href="http://www.firstaidcprcourse.com/#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="http://www.firstaidcprcourse.com/#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div>
<!---============ End slider ===============----->
<!-- Footer Start -->
<div class="container">
	<br>
    <p style="color: #4A4646; font-size: 20px;">
    Welcome to Firstaidcprcourse.com where you can receive your First Aid, CPR, and other medical certifications 
    online fast and easy with our comprehensive instructional videos.  <br><br>
    Our trainees are also automatically signed up with our <a href="http://www.firstaidcprcourse.com/www.HomeHealthWorker.com"> www.HomeHealthWorker.com</a> social network where users 
    can receive the latest industry news, browse job openings, and connect with other 
    industry professionals.
    </p>
    <br>
    <h1>
    <center>
    	Start your CPR and First Aid Training Now!<br>
    	Pay when you are ready. Get Certified Today!<br>
    </center>
    </h1>
</div>
<!-- Footer End --> 

</body></html>