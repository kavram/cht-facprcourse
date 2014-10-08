<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="grad1">
<br><br>
	<div class="container">
		<div class="col-lg-2 col-sm-2" style=" line-height: 15px;">
		<b>COMPANY</b>
		<br><br><a href="contact">Contact Us</a>
		</div>
		<div class="col-lg-2 col-sm-2" style=" line-height: 15px;">
		<b>COURSES</b>
		<br><br><a href="courses">Our Courses</a>
		</div>
		<div class="col-lg-2 col-sm-2" style=" line-height: 15px;">
		<b>WEBSITE</b>
		<c:if test="${user.email == null}">
			<br><br><a href="#loginModal"  data-toggle="modal" data-target="#loginModal" >Log In</a>
			<br><br><a href="#registerModal"  data-toggle="modal" data-target="#registerModal" >Register</a>
		</c:if>	
		<br><br><a href="contact.jsp" data-toggle="modal" >Get Help</a>
		</div>
		<div class="col-lg-2 col-sm-2" style=" line-height: 15px;">
		<b>LEGAL</b>
		<br><br><a href="#myPrivacy" data-toggle="modal" >Privacy Policy</a>
		<br><br><a href="#myTerms" data-toggle="modal" >Terms of Use</a>
		<br><br><a href="#mySecurity" data-toggle="modal" >Security Policy</a>
		<br><br><a href="#myRefund" data-toggle="modal" >Refund Policy</a>
		</div>
		<div class="col-lg-2 col-sm-3" style=" line-height: 15px;">
			<center>
        	Follow Us On<BR> <BR>
       		<a href="#"><img src="${domain}/images/g_plus.png" height=25px width=25px></a> 
        	<a href="#" target="_blank"><img src="${domain}/images/youtube.png" height=25px width=25px></a>           
        	<a href="#"><img src="${domain}/images/in.png" height=25px width=25px /></a>
        	<a href="#" target="_blank"><img src="${domain}/images/fb.png" height=25px width=25px /></a> 
        	<a href="#"><img src="${domain}/images/tweet.png" height=25px width=25px></a>
        	<a href="#"><img src="${domain}/images/email.png" height=25px width=25px></a> 
        </center>
		</div>
	</div>
<br>
</div> 
<!-- Footer End --> 