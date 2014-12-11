<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<html>
<head profile="http://www.w3.org/2005/10/profile">


<jsp:include page="resources.jsp" />
<jsp:include page="flowPlayerResources.jsp" />
<jsp:include page="header.jsp" />
<script type="text/javascript">
	$(document).ready(function(){
 		$('#myDemo2').on('hidden.bs.modal', function(e){
 			flowplayer(1).stop();
 		});
 		$('#myDemo3').on('hidden.bs.modal', function(e){
 			flowplayer(2).stop();
 		});
 		$('#myDemo4').on('hidden.bs.modal', function(e){
 			flowplayer(3).stop();
 		});
 		$('#myTrainer').on('hidden.bs.modal', function(e){
 			flowplayer(4).stop();
 		});
 	});

	 <c:if test="${user.email == null}">
	 	$(document).ready(function(){
	 		$('#crsPmt1').click(function(e){
	 			e.preventDefault();
	 			$('#loginModal').modal({show:true});
	 		});
	 		$('#crsPmt2').click(function(e){
	 			e.preventDefault();
	 			$('#loginModal').modal({show:true});
	 		});
	 		$('#crsPmt3').click(function(e){
	 			e.preventDefault();
	 			$('#loginModal').modal({show:true});
	 		});
	 		$('#crsPmt4').click(function(e){
	 			e.preventDefault();
	 			$('#loginModal').modal({show:true});
	 		});
	 	});
	 </c:if>
	
	
</script>
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

	<div class="modal fade" id="myDemo2">
		<div class="modal-dialog modal-lg">
		    <div class="modal-content">
		    	<div class="modal-header">
		    		<h4 class="modal-title"><center>First Aid Demo Video</center></h4>
		    	</div>
		    	<div class="modal-body">
		    		<br>
					<div class="flowplayer" style="width: 100%; height: 460px;">
    					<video>
        					<source type="video/webm" src="http://drive.flowplayer.org/196963/36197-fademo.webm">
        					<source type="video/mp4"  src="http://drive.flowplayer.org/196963/36197-fademo.mp4">
        					<source type="video/ogg"  src="http://drive.flowplayer.org/196963/36197-fademo.ogg">
    					</video>
					</div>
					<br>
					<br>
					<button type="button" class="close" data-dismiss="modal">Close Video</button>
					<br>
					<br>
				</div>
		    </div>
		</div>
	</div>
	<div class="modal fade" id="myDemo3">
		<div class="modal-dialog modal-lg">
		    <div class="modal-content">
		    	<div class="modal-header">
		    		<h4 class="modal-title"><center>First Aid and CPR Demo Video</center></h4>
		    	</div>
		    	<div class="modal-body">
		    		<br>
					<div class="flowplayer" data-rtmp="rtmp://rtmp.flowplayer.org/cfx/st/" data-ratio="0.5625" data-qualities="216p,360p,720p" data-default-quality="360p">
  <video>
    <source type="application/x-mpegurl" src="http://drive.flowplayer.org/196963/36200-facprdemo.m3u8">
    <source type="video/webm" src="http://drive.flowplayer.org/196963/36200-facprdemo.webm">
    <source type="video/mp4" src="http://drive.flowplayer.org/196963/36200-facprdemo.mp4">
    <source type="video/flash" src="mp4:196963/36200-facprdemo.mp4">
  </video>
</div>
					<br>
					<br>
					<button type="button" class="close" data-dismiss="modal">Close Video</button>
					<br>
					<br>
				</div>
		    </div>
		</div>
	</div>
	<div class="modal fade" id="myDemo4">
		<div class="modal-dialog modal-lg">
		    <div class="modal-content">
		    	<div class="modal-header">
		    		<h4 class="modal-title"><center>Basic Life Support Demo Video</center></h4>
		    	</div>
		    	<div class="modal-body">
		    		<br>
					<div class="flowplayer" style="width: 100%; height: 460px;">
    					<video>
        					<source type="video/webm" src="http://drive.flowplayer.org/196963/36199-blsdemo.webm">
        					<source type="video/mp4"  src="http://drive.flowplayer.org/196963/36199-blsdemo.mp4">
        					<source type="video/ogg"  src="http://drive.flowplayer.org/196963/36199-blsdemo.ogg">
    					</video>
					</div>
					<br>
					<br>
					<button type="button" class="close" data-dismiss="modal">Close Video</button>
					<br>
					<br>
				</div>
		    </div>
		</div>
	</div>
	<div class="modal fade" id="myTrainer">
		<div class="modal-dialog modal-lg">
		    <div class="modal-content">
		    	<div class="modal-header">
		    		<h4 class="modal-title"><center>Instructor Testimonial</center></h4>
		    	</div>
		    	<div class="modal-body">
		    		<br>
					<div class="flowplayer" style="width: 100%; height: 460px;">
    					<video>
        					<source type="video/webm" src="http://drive.flowplayer.org/196963/35970-TrainerTestimonial.webm">
        					<source type="video/mp4"  src="http://drive.flowplayer.org/196963/35970-TrainerTestimonial.mp4">
        					<source type="video/ogg"  src="http://drive.flowplayer.org/196963/35970-TrainerTestimonial.ogg">
    					</video>
					</div>
					<br>
					<br>
					<button type="button" class="close" data-dismiss="modal">Close Video</button>
					<br>
					<br>
				</div>
		    </div>
		</div>
	</div>

<!---=========== Start slider ==============----->

<div style="background: #555555;">
<div class="container" style="background: #555555;">
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
      			<img src="images/header-bg6.png" alt="..."  width = "100%">
      			<div class="carousel-caption">
          		<h2><span>Get Certified For That Perfect Job</span></h2>
      			</div>
    		</div>
    		<div class="item">
      			<img src="images/header-bg7.jpg" alt="..."  width = "100%">
      			<div class="carousel-caption">
          			<h2>We Offer Infant Training As Well</h2>
      			</div>
    		</div>
    		<div class="item">
      			<img src="images/header-bg8.jpg" alt="..."  width = "100%">
      			<div class="carousel-caption">
          			<h2>Would You Know What To Do Next?</h2>
      			</div>
    		</div>
  		</div>
 	</div>
</div>
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
    	Start your CPR and First Aid Training Now.<br>
    	Pay when you are ready. Get Certified Today!<br>
    </center>
    </h1>
    <div class="row-fluid">
        <div class="span3">
            <center><img src="images/title2.png" height=130px border=0></center>
            <ul>
            	<li>Only pay once you previewed the demo videos</li>
            	<li>Register to login</li>
        	    <li>We do not share email addresses with third parties</li>
            </ul>
        </div>
        <div class="span3">
            <center><img src="images/title1.png" height=130px border=0></center>
            <ul>
            	<li>Pay for the course(s) you wish to take</li>
            	<li>Conveniently watch videos at your own pace</li>
    	        <li>Great for certification renewals</li>
            </ul>
        </div>
        <div class="span3">
            <center><img src="images/title4.png" height=130px border=0></center>
            <ul>
            	<li>Take a quiz and get certified</li>
        	    <li>Take the final quiz at any Time</li>
    	        <li>Retake as many times as required</li>
            </ul>
        </div>
        <div class="span3">
            <center><img src="images/cert.png" height=120px border=0></center>
            <ul>
            	<li>Receive training certificate</li>
				<li>Print or save certificate image directly</li>
            </ul>
        </div>
    </div>
    <br>
    <h2><center>FirstAidCPRCourse.com has Various Healthcare Certifications <br>to Help Advance Your Medical Career</center></h2>
    <h4>FirstAidCPRCourse.com is the premier training site for healthcare professionals seeking First Aid and CPR certifications. 
    To ensure sucess, our courses follow the latest AHA, OSHA, and ECC/ILORC standards. Take a look below at some of our courses 
    and become a certified medical professional today</h4> <br> <br>
    <a href="#myTrainer" data-toggle="modal"><button type="button" class="btn btn-primary btn-lg">Watch Instructor Testimonial</button></a>
    <br> <br>
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
				<td><h4>$17.95</h4></td>
				<td><a id="crsPmt1" href="payment?courses=4"><center><img src="images/starthere.jpg" height=40px border=0></center></a></td>
			</tr>
			<tr>
				<td><h4>First Aid Basic</h4></td>
				<td><a href="#myDemo2" data-toggle="modal" ><center><img src="images/demovideo.jpg" height=35px border=0></center></a></td>
				<td></td>
				<td></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td></td>
				<td></td>
				<td><h4>$22.95</h4></td>
				<td><a id="crsPmt2" href="payment?courses=1"><center><img src="images/starthere.jpg" height=40px border=0></center></a></td>
			</tr>
			<tr>
				<td><h4>CPR and First Aid</h4></td>
				<td><a href="#myDemo3" data-toggle="modal" ><center><img src="images/demovideo.jpg" height=35px border=0></center></a></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td></td>
				<td><h4>$31.95</h4></td>
				<td><a id="crsPmt3" href="payment?courses=2"><center><img src="images/starthere.jpg" height=40px border=0></center></a></td>
			</tr>
			<tr>
				<td><h4>Healthcare Basic Life Support (BLS) </h4></td>
				<td><a href="#myDemo4" data-toggle="modal" ><center><img src="images/demovideo.jpg" height=35px border=0></center></a></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td><center><img src="images/checkmark.jpg" height=25px border=0></center></td>
				<td><h4>$51.95</h4></td>
				<td><a id="crsPmt4" href="payment?courses=3"><center><img src="images/starthere.jpg" height=40px border=0></center></a></td>
			</tr>
  		</table>
	</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>