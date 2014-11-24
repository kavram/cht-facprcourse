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
            <legend class="">Dear ${user.firstName} ${user.lastName}<br> 						
            Please confirm your registration by clicking on the &quot;Activate Account&quot; link in
						the &quot;Please Verify Your FirstaidCPRCourse.com Account Email Address&quot; email.
			</legend>
          </div>   
          <div class="form-group">
	     	<a href="/"><button type="button" id="ok" class="btn btn-default">OK</button></a>
  		  </div>
	</div>
</div>

<!-- Footer -->
<%@ include file="footer.jsp" %>
<!-- Footer End --> 
</body>
</html>