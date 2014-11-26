<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<html>
<head>
<jsp:include page="resources.jsp" />
<jsp:include page="header.jsp" />
</head>
<body>
<jsp:include page="topNav.jsp" >
  <jsp:param name="menu1" value="" />
  <jsp:param name="menu2" value="" />
  <jsp:param name="menu3" value="" />
  <jsp:param name="menu4" value="" />
  <jsp:param name="menu5" value="active" />
  <jsp:param name="menu6" value="" />
  <jsp:param name="menu7" value="" />
</jsp:include>
<div class="container">
	<div class="row-fluid">
    <h3> Shawn McBride - Instructor</h3>
    <div class="row-fluid">
    	<div class="span3">
    	<center>
    		<img src="images/shawn.jpg" height="400px" border=0>
    		<br><br>
    	</center>
    	</div>
    	<div class="span9">
    		My name is Shawn McBride. I have been drawn to public service all my life. 
    		At the age of eight, I joined the Boy Scouts of America and that is where I first became interested in first aid. 
    		Our troop met in the local fire department, so you could say that at an early age I was completely surrounded by 
    		those passionate about public safety. Later, I joined the military to serve my country and after leaving I 
    		continued to serve my community by working as a full time firefighter/first responder. As my career continued 
    		with the fire department, I became an Emergency Medical Technician (EMT). The opportunity was presented to me to 
    		start a career in law enforcement as well as in firefighting. So I accepted the challenge and discovered what it 
    		truly means to serve in multiple capacities. 
    		<br><br>
    		No matter what role I was in, medical response always played a huge 
    		part of my public service. After moving to the island of Oahu, I became an instructor for the state mandated public 
    		security certification to train and lead men and women responsible for public safety. I draw from the wealth of 
    		experience and knowledge that I have gained over the years and hope you benefit from this course.<br><br>

			I hope everyone enjoys this instructional series. I was honored when asked to narrate such an important informational
			tool. It's not a matter of if an emergency will take place but when it will take place and will you know what to do? 
			My goal is to provide you with the minimal skills and confidence that is needed to help in a real world emergency.
			<br><br>

			Sincerely,<br>
			<img src="images/signature.png" height=40px border=0><br>
			Shawn McBride
    	</div>
    	<div class="clearfix"></div>
    </div>
</div>
        <!-------/.container---------->

<%@ include file="footer.jsp" %>
</body>
</html>