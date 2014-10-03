<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	<div style="background-image: url(images/header_bg.jpg)">
	<div class="container">
		<ul class="nav nav-pills">
    		<li class='<%= request.getParameter("menu1")%>'><a href=/>Home</a></li>
    		<li class='<%= request.getParameter("menu2")%>'><a href=/certify>Pricing</a></li>
    		<li class='<%= request.getParameter("menu3")%>'><a href=/courses>Training Courses</a></li>
    		<li class='<%= request.getParameter("menu4")%>'><a href=/faq>FAQ's</a></li>
    		<c:if test="${user.email == null}">
    			<li><a href="#registerModal"  data-toggle="modal" data-target="#registerModal" >Register</a></li>
    			<li><a href="#loginModal"  data-toggle="modal" data-target="#loginModal" >Log In</a></li>
    		</c:if>
    		<li class='<%= request.getParameter("menu5")%>'><a href=/contact>Contact Us</a></li>
		</ul>
	</div>
	</div>
