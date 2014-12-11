<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="grad1">
<br><br>
	<div class="container">
		<div class="col-lg-2 col-sm-2" style="line-height:15px; color:white">
			<b>COMPANY</b>
			<br><br><a href="contact" style="color:#eeeeee;">Contact Us</a>
			<br><br><a href="courses" style="color:#eeeeee;">Our Courses</a>
		</div>
		<div class="col-lg-2 col-sm-2" style="line-height:15px; color:white">
			<b>LINKS</b>
			<br><br><a href="http://www.homehealthworker.com" target="_blank" style="color:#eeeeee;">Home Health Worker</a>
			<br><br><a href="http://www.heart.org/HEARTORG/" target="_blank" style="color:#eeeeee;">American Heart Association</a>
		</div>
		<div class="col-lg-2 col-sm-2" style="line-height:15px; color:white">
			<b>WEBSITE</b>
			<c:if test="${user.email == null}">
				<br><br><a href="#loginModal" style="color:#eeeeee;" data-toggle="modal" data-target="#loginModal" >Log In</a>
				<br><br><a href="#registerModal" style="color:#eeeeee;" data-toggle="modal" data-target="#registerModal" >Register</a>
			</c:if>	
			<br><br><a href="contact" style="color:#eeeeee;" data-toggle="modal" >Get Help</a>
		</div>
		<div class="col-lg-2 col-sm-2" style="line-height:15px; color:white">
			<b>LEGAL</b>
			<br><br><a href="#myPrivacy" style="color:#eeeeee;" data-toggle="modal" >Privacy Policy</a>
			<br><br><a href="#myTerms" style="color:#eeeeee;" data-toggle="modal" >Terms of Use</a>
			<br><br><a href="#mySecurity" style="color:#eeeeee;" data-toggle="modal" >Security Policy</a>
		    <br><br><a href="#myRefund" style="color:#eeeeee;" data-toggle="modal" >Refund Policy</a>
		</div>
		<div class="col-lg-2 col-sm-3" style="line-height:15px; color:white">
			<center>
        	Follow Us On<BR> <BR>
       		<a href="https://plus.google.com/u/0/104044872068298502015/posts" target="_blank"><img src="images/g_plus.png" height=25px width=25px></a> 
        	<a href="https://www.facebook.com/pages/First-Aid-Cpr-Course/647149218731125" target="_blank"><img src="images/fb.png" height=25px width=25px></a>           
        	<a href="https://www.linkedin.com/company/4839820?trk=tyah&trkInfo=tarId%3A1417740448409%2Ctas%3Afirstaidcpr%2Cidx%3A1-1-1" target="_blank"><img src="images/in.png" height=25px width=25px /></a>
        	<a href="mailto:info@firstaidcprcourse.com"><img src="${domain}/images/email.png" height=25px width=25px></a>
        	 <br><br>
        	<!-- (c) 2005, 2014. Authorize.Net is a registered trademark of CyberSource Corporation --> 
      		<div class="AuthorizeNetSeal"> 
    			<script type="text/javascript" language="javascript">var ANS_customer_id="7c7bfc97-097a-4385-8375-521f4f2e79a4";</script> 
    			<script type="text/javascript" language="javascript" src="//verify.authorize.net/anetseal/seal.js" ></script> 
    			<a href="http://www.authorize.net/" id="AuthorizeNetText" target="_blank"></a> 
      		</div>
        	</center>
        </div>	
	</div>
<br>
</div> 
<!-- Footer End --> 