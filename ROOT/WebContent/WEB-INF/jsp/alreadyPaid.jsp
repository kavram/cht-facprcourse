<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="resources.jsp" />
<jsp:include page="header.jsp" />
</head>
<div class="container">
	<div class="row-fluid">
          <div id="legend">
            <legend class="">Dear ${user.firstName} ${user.lastName} our records indicate you already paid for the ${paidCourse.name} course. 
            Please click on the Watch Videos button to start watching course videos.</legend>
          </div>   
          <div class="form-group">
	     	<a href="/courses"><button type="button" id="watchVideos" class="btn btn-default">Watch Videos</button></a>
  		  </div>
	</div>
</div>

<!-- Footer -->
<%@ include file="footer.jsp" %>
<!-- Footer End --> 
</body>
</html>