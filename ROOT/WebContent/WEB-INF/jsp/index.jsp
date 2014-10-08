<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<html>
<head>
<jsp:include page="resources.jsp" />
<jsp:include page="header.jsp" />
<link rel="stylesheet" href="//releases.flowplayer.org/5.5.0/skin/minimalist.css">
<script src="//releases.flowplayer.org/5.5.0/flowplayer.min.js"></script>
</head>
<body>
<jsp:include page="topNav.jsp" >
  <jsp:param name="menu1" value="active" />
  <jsp:param name="menu2" value="" />
  <jsp:param name="menu3" value="" />
  <jsp:param name="menu4" value="" />
  <jsp:param name="menu5" value="" />
  <jsp:param name="menu6" value="" />
  <jsp:param name="menu7" value="" />
</jsp:include>
<!---=========== Start slider ==============----->
<div class="container">
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  	<!-- Indicators -->
  		<ol class="carousel-indicators">
    		<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    		<li data-target="#carousel-example-generic" data-slide-to="1"></li>
    		<li data-target="#carousel-example-generic" data-slide-to="2"></li>
  		</ol>
 
		<!-- Wrapper for slides -->
  		<div class="carousel-inner">
    		<div class="item active">
      			<img src="images/header-bg6.png" alt="...">
      			<div class="carousel-caption">
          		<h2><span>Get Certified For That Perfect Job</span></h2>
      			</div>
    		</div>
    		<div class="item">
      			<img src="images/header-bg7.jpg" alt="...">
      			<div class="carousel-caption">
          			<h2>We Offer Infant Training As Well</h2>
      			</div>
    		</div>
    		<div class="item">
      			<img src="images/header-bg8.jpg" alt="...">
      			<div class="carousel-caption">
          			<h2>Would You Know What To Do Next?</h2>
      			</div>
    		</div>
  		</div>
 	</div>
  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div>
<!---============ End slider ===============----->

<div class="container">
	<br>
    <p style="color: #4A4646; font-size: 20px;">
    Welcome to FirstAidCPRCourse.com where you can receive First Aid, CPR, and other medical certifications 
    online quickly and easily with our comprehensive instructional videos.  <br><br>
    Trainees are also automatically registered with the <a href=www.HomeHealthWorker.com> www.HomeHealthWorker.com</a> professional network where members 
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
    <div class="row-fluid">
        <div class="span4">
            <center><img src="images/title2.png" height=130px border=0></center>
            <ul>
            	<li>Only pay when you see the quality of the demo videos</li>
            	<li>Register for a login</li>
        	    <li>We do not share email address</li>
            </ul>
        </div>
        <div class="span4">
            <center><img src="images/title1.png" height=130px border=0></center>
            <ul>
            	<li>Pay for the course you wish to take</li>
    	        <li>Use your login to complete course content</li>
            </ul>
        </div>
        <div class="span4">
            <center><img src="images/title4.png" height=130px border=0></center>
            <ul>
            	<li>Take the Final Quiz</li>
        	    <li>Get a passing grade</li>
    	        <li>Retry as many times as required</li>
				<li>Print temporary card right from your browser</li>
				<li>Receive a pocket card and wall certificate in 5 to 10 days via USPS</li>
            </ul>
        </div>
    </div>
    <br>
    <h2><center>FirstAidCPRCourse.com has Various Healthcare Certifications <br>to Help Advance Your Medical Career!</center></h2>
    <h4>FirstAidCPRCourse.com is the premier training site for healthcare professionals seeking First Aid and CPR certifications. 
    To ensure sucess, our courses follow the latest AHA, OSHA, and ECC/ILORC standards. Take a look below at some of our courses 
    and become a certified medical professional today! <br> <br>
    <div class="table-responsive">
  		<table class="table table-bordered">
			<tr>
  				<th class="danger"><h4><b>Certifications Available</b></h4></th>
  				<th class="danger"><h4><b>Sample Video</b></h4></th>
  				<th class="danger"><h4><b>Adult CPR</b></h4></th>
  				<th class="danger"><h4><b>Pediatric<br>CPR </b></h4></th>
  				<th class="danger"><h4><b>First Aid</b></h4></th>
  				<th class="danger"><h4><b>AED</b></h4></th>
  				<th class="danger"><h4><b>Health <br>Care BLS</b></h4></th>
  				<th class="danger"><h4><b>Price</b></h4></th>
  				<th class="danger"></th>		
			</tr>
			<tr>
				<td><h4>CPR Basic</h4></td>
				<td><a href="#myDemo" data-toggle="modal" ><center><img src="images/demovideo.jpg" height=35px border=0></center></a></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td></td>
				<td></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td></td>
				<td><h4>$14.95</h4></td>
				<td><a href="payment?courses=4"><center><img src="images/starthere.jpg" height=40px border=0></center></a></td>
			</tr>
			<tr>
				<td><h4>First Aid Basic</h4></td>
				<td><a href="#myDemo" data-toggle="modal" ><center><img src="images/demovideo.jpg" height=35px border=0></center></a></td>
				<td></td>
				<td></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td></td>
				<td></td>
				<td><h4>$14.95</h4></td>
				<td><a href="payment?courses=1"><center><img src="images/starthere.jpg" height=40px border=0></center></a></td>
			</tr>
			<tr>
				<td><h4>CPR and First Aid</h4></td>
				<td><a href="#myDemo" data-toggle="modal" ><center><img src="images/demovideo.jpg" height=35px border=0></center></a></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td></td>
				<td><h4>$29.95</h4></td>
				<td><a href="payment?courses=2"><center><img src="images/starthere.jpg" height=40px border=0></center></a></td>
			</tr>
			<tr>
				<td><h4>Healthcare Basic Life Support (BLS) </h4></td>
				<td><a href="#myDemo" data-toggle="modal" ><center><img src="images/demovideo.jpg" height=35px border=0></center></a></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td><h4>$49.95</h4></td>
				<td><a href="payment?courses=3"><center><img src="images/starthere.jpg" height=40px border=0></center></a></td>
			</tr>
  		</table>
	</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>