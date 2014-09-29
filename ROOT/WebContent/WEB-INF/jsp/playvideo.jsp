<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="//releases.flowplayer.org/5.5.0/skin/minimalist.css">
<script src="${domain}/js/jquery-1.8.2.js"></script>
<script src="//releases.flowplayer.org/5.5.0/flowplayer.min.js"></script>
<script src="//embed.flowplayer.org/5.5.0/embed.min.js"></script>
<!-- bootstrap 2.3.0 -->
<!-- style sheets bootstrap 2.3.0 -->
<link href="${domain}/content/bootstrap.css" rel="stylesheet" />
<link href="${domain}/content/bootstrap-responsive.css" rel="stylesheet" />
<link href="${domain}/content/site.css" rel="stylesheet" />
<!-- player skin -->
<link rel="stylesheet" href="${domain}/content/minimalist.css">
<!-- include flowplayer -->
<script src="${domain}/js/flowplayer.min.js"></script>
<!-- style sheets End -->
<!----======================== Java scripts =============================----->
<!-- include flowplayer -->
<!-- bootstrap 2.3.0 -->
<script type="text/javascript" src="${domain}/js/bootstrap.js"></script>
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
<div class="flowplayer" style="width: 100%; height: 460px;">
    <video>
        <source type="video/webm" src="${video}">
        <source type="video/mp4"  src="${video}">
        <source type="video/ogg"  src="${video}">
    </video>
</div>
</body>
</html>