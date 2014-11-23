<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>

<script src="${domain}/js/jquery-1.8.2.js"></script>

<jsp:include page="flowPlayerResources.jsp" />

<!-- bootstrap 2.3.0 -->
<!-- style sheets bootstrap 2.3.0 -->
<link href="${domain}/content/bootstrap.css" rel="stylesheet" />
<link href="${domain}/content/bootstrap-responsive.css" rel="stylesheet" />
<!-- style sheets End -->
<!----======================== Java scripts =============================----->
<!-- include flowplayer -->
<!-- bootstrap 2.3.0 -->
<script type="text/javascript" src="${domain}/js/bootstrap.js"></script>

<c:if test="${enabled == false}">
<script type="text/javascript">
	$(document).ready(function(){
	var api = flowplayer();
	api.disable(true);
	});
</script>
</c:if>

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
</head>
<body>
<h4 style="position: relative; top: 0px; text-align:center;">${name}</h4>
<div class="flowplayer is-disabled" data-rtmp="rtmp://rtmp.flowplayer.org/cfx/st/" data-ratio="0.5625" data-qualities="216p,360p,720p" data-default-quality="360p" style="width: 100%; height: 460px;">
    <video>
        <source type="video/webm" src="${video}">
        <source type="video/mp4"  src="${video}">
        <source type="video/ogg"  src="${video}">
    </video>
</div>
</body>
</html>