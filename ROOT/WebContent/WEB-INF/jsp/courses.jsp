<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<jsp:include page="resources.jsp" />
<jsp:include page="header.jsp" />
<jsp:include page="flowPlayerResources.jsp" />
<style>
@media (min-width: 768px) {
  .navbar-collapse {
    height: auto;
    border-top: 0;
    box-shadow: none;
    max-height: none;
    padding-left:0;
    padding-right:0;
  }
  .navbar-collapse.collapse {
    display: block !important;
    width: auto !important;
    padding-bottom: 0;
    overflow: visible !important;
  }
  .navbar-collapse.in {
    overflow-x: visible;
  }

.navbar
{
	max-width:300px;
	margin-right: 0;
	margin-left: 0;
}	

.navbar-nav,
.navbar-nav > li,
.navbar-left,
.navbar-right,
.navbar-header
{float:none !important;}

.navbar-right .dropdown-menu {left:0;right:auto;}
.navbar-collapse .navbar-nav.navbar-right:last-child {
    margin-right: 0;
}
}
.dropdown:hover .dropdown-menu {
    display: block;
 }
</style>
<script>
$(document).ready(function(){
	$('li.myImenu').click(function(e){
		var paid = $(this).attr('paid');
		$('#videoDiv').find('a').remove();
		var aTag = '';
		if(paid == 'false'){
			aTag = '<a href="payment?courses=' + $(this).attr('course_id') + '" id="item9" class="pull-right"><button type="button" class="btn btn-warning"  style="float:right position:relative; top:100;">Pay Now To Proceed</button></a>';
		}else
			aTag = '<a href="quiz?courses=' + $(this).attr('course_id') + '" id="item9" class="pull-right"><button type="button" style="float:right position:absolute; top:50;" class="btn btn-success">Take The Quiz</button></a>';
		$('#iframeDiv').before(aTag);
		$('#iframeDiv').after(aTag);			
    	var play_url = $(this).attr('div_data');
    	iframe = document.getElementById('myIframe');
    	iframe.src = play_url;
	});
});
</script>
</head>
<body>
<jsp:include page="topNav.jsp" >
  <jsp:param name="menu1" value="" />
  <jsp:param name="menu2" value="" />
  <jsp:param name="menu3" value="active" />
  <jsp:param name="menu4" value="" />
  <jsp:param name="menu5" value="" />
  <jsp:param name="menu6" value="" />
  <jsp:param name="menu7" value="" />
</jsp:include>  

<div class="container">
<div class="row-fluid">
	<div class="span4">
		<div class="collapse navbar-collapse navbar-ex1-collapse" id="">
			<br>
			<h4>Select A Course:</h4>
			<hr>
    		<ul class="nav navbar-nav">
<c:forEach var="userCourse" items="${courses}" >    		
    			<li class="dropdown">
    			<c:if test="${userCourse.paid == true}">
					<a href="#" class="dropdown-toggle" style="color: green; font-size: 18px; font-weight: bold;" data-toggle="dropdown"><img src="images/checkmark.jpg" height=15px>&nbsp;${userCourse.name}<b class="caret"></b></a>    			
    			</c:if>
    			<c:if test="${userCourse.paid == false}">    			
      				<a href="#" class="dropdown-toggle" style="color: #1569C7; font-size: 18px; font-weight: bold;" data-toggle="dropdown">${userCourse.name}<b class="caret"></b></a>
      			</c:if>
        		<ul class="dropdown-menu">
        		<c:if test="${userCourse.paid == true}">
        			<c:if test="${userCourse.courseId == 1}">
       					<li><a href="documents/First_Aid_Course_Manual.pdf" target="_blank">Basic First Aid Course Manual</a></li> 			
        			</c:if>
        			<c:if test="${userCourse.courseId == 2}">
						<li><a href="documents/CPR_AED_Course_Manual.pdf" target="_blank" >Basic CPR Course Manual</a></li>
        				<li><a href="documents/First_Aid_Course_Manual.pdf" target="_blank" >Basic First Aid Course Manual</a></li> 			
        			</c:if>
        			<c:if test="${userCourse.courseId == 3}">
						<li><a href="documents/CPR_AED_Course_Manual.pdf" target="_blank">Basic CPR Course Manual</a></li>
        				<li><a href="documents/First_Aid_Course_Manual.pdf" target="_blank">Basic First Aid Course Manual</a></li>
        			</c:if>
        			<c:if test="${userCourse.courseId == 4}">
						<li><a href="documents/CPR_AED_Course_Manual.pdf" target="_blank">Basic CPR Course Manual</a></li>
        			</c:if>
        		</c:if>
        		<c:if test="${userCourse.paid == false}">
        			<c:if test="${userCourse.courseId == 1}">
       					<li><a target="_blank">Basic First Aid Course Manual</a></li> 			
        			</c:if>
        			<c:if test="${userCourse.courseId == 2}">
						<li><a target="_blank" >Basic CPR Course Manual</a></li>
        				<li><a target="_blank" >Basic First Aid Course Manual</a></li> 			
        			</c:if>
        			<c:if test="${userCourse.courseId == 3}">
						<li><a target="_blank">Basic CPR Course Manual</a></li>
        				<li><a target="_blank">Basic First Aid Course Manual</a></li>
        			</c:if>
        			<c:if test="${userCourse.courseId == 4}">
						<li><a target="_blank">Basic CPR Course Manual</a></li>
        			</c:if>
        		</c:if>
        		
        <c:forEach var="video" items="${userCourse.videos}" >
            <c:if test="${userCourse.paid == true}">
        		<li class="myImenu" course_id=${userCourse.courseId} paid=${userCourse.paid} div_data="playvideo?video=${video.url}&name=${video.name}&enabled=true"><a href="#tab_a" data-toggle="tab" id="tab_data" >${video.name}</a></li>
			</c:if>
 			<c:if test="${userCourse.paid == false}">
			    <li class="myImenu" course_id=${userCourse.courseId} paid=${userCourse.paid} div_data="playvideo?video=${video.url}&name=${video.name}&enabled=false"><a href="#tab_a" data-toggle="tab" id="tab_data" >${video.name}</a></li>
			</c:if>   
		</c:forEach>
        		</ul>
        		</li>
</c:forEach>
</ul>
</div>
</div>
<div class="span8" id="videoDiv">
		<div class="tab-content" id="iframeDiv">
        	<iframe id="myIframe" name="myIframe" src="playvideo?video=http://drive.flowplayer.org/196963/32547-CPRIntro.mp4&name=CPR Introduction&enabled=true" frameborder="0" scrolling="no" width="100%" height="500px"></iframe>
		</div><!-- tab content -->
	</div>
	<div class="clearfix"></div>
</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>