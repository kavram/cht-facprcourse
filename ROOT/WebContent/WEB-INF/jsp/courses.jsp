<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<jsp:include page="resources.jsp" />
<jsp:include page="header.jsp" >
  <jsp:param name="menu1" value="" />
  <jsp:param name="menu2" value="" />
  <jsp:param name="menu3" value="active" />
  <jsp:param name="menu4" value="" />
  <jsp:param name="menu5" value="" />
  <jsp:param name="menu6" value="" />
  <jsp:param name="menu7" value="" />
</jsp:include>
<jsp:include page="topNav.jsp" />
<!-- player skin -->
<link rel="stylesheet" href="content/minimalist.css">
<!-- include flowplayer -->
<script src="js/flowplayer.min.js"></script>
<!-- 
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 -->
<style>
.flowplayer {
  width: 980px; /* same as grid */
  margin: 0 0 424px 0; /* 414 + 10 margin bottom */
  /* the following 3 directives not needed if the playlist is below the player from the start */
  -webkit-transition: margin .8s;
  -moz-transition: margin .8s;
  transition: margin .8s;
}
.is-splash.flowplayer {
  margin: 0;
  padding: 0;
}
 
/* playlist as grid */
.flowplayer .fp-playlist {
  padding: 0;
  height: 464px; /* (136 + 2) * 3 */
  position: absolute;
  left: 0;
  bottom: -424px; /* -414 - 10 */
  /* the following 3 directives not needed if the playlist is below the player from the start */
  -webkit-transition: bottom .8s;
  -moz-transition: bottom .8s;
  transition: bottom .8s;
}
/* in splash state playlist should be on top of the player in the z-axis
 * to avoid that the big white play button overlays the thumbnails */
.is-splash.flowplayer .fp-playlist {
  z-index: 2;
  bottom: 68px; /* (980 / 16 * 9 - 414) / 2 */
}
 
/* the playlist item elements */
.flowplayer .fp-playlist a {
  width: 239px;
  height: 136px;
  display: inline-block;
}
.flowplayer .fp-playlist a.is-active, .flowplayer .fp-playlist a:hover {
  background-image: url(//releases.flowplayer.org/5.5.0/skin/img/play_white.png);
  background-position: center;
  background-repeat: no-repeat;
}
@media (-webkit-min-device-pixel-ratio: 2) {
  .flowplayer .fp-playlist a.is-active, .flowplayer .fp-playlist a:hover {
    background-image: url(//releases.flowplayer.org/5.5.0/skin/img/play_white@x2.png);
  }
}
.flowplayer .fp-playlist a:hover {
  background-size: 12%;
}
.flowplayer .fp-playlist a.is-active {
  background-size: 24%;
}
 
#item0 {
  top: 0;
  left: 0;
  margin: 1px 1px 1px 0; /* leftmost */
}
#item1 {
  top: 0;
  left: 249px;
  margin: 1px;
}
#item2 {
  top: 0;
  left: 498px;
  margin: 1px;
}
#item3 {
  top: 0;
  left: 747px;
  margin: 1px 0 1px 1px; /* rightmost */
}
#item4 {
  top: 143px;
  left: 0;
  margin: 1px 1px 1px 0; /* leftmost */
}
#item5 {
  top: 143px;
  left: 249px;
  margin: 1px;
}
#item6 {
  top: 143px;
  left: 498px;
  margin: 1px;
}
#item7 {
  top: 143px;
  left: 747px;
  margin: 1px 0 1px 1px; /* rightmost */
}
#item8 {
  top: 286px;
  left: 0;
  margin: 1px 1px 1px 0; /* leftmost */
}
#item9 {
  top: 286px;
  left: 249px;
  margin: 1px;
}
#item10 {
  top: 286px;
  left: 498px;
  margin: 1px;
}
#item11 {
  top: 286px;
  left: 747px;
  margin: 1px 0 1px 1px; /* rightmost */
}
#item12 {
  top: 429px;
  left: 0;
  margin: 1px 1px 1px 0; /* leftmost */
}
#item13 {
  top: 429px;
  left: 249px;
  margin: 1px;
}
#item14 {
  top: 429px;
  left: 498px;
  margin: 1px;
}
#item15 {
  top: 429px;
  left: 747px;
  margin: 1px 0 1px 1px; /* rightmost */
}
</style>
<div class="container">
<br>
yada yada ... describe how to access content ... maybe a link to an introductory
video and/or manual and how to info
<br><br>
blah blah blah<br><br>
<div class="panel-group" id="accordion">
<c:forEach var="userCourse" items="${courses}" >
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
          <c:out value="${userCourse.name}"/> 
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse">
      <div class="panel-body">
      	<div class="row-fluid">
        	<div class="flowplayer is-splash is-closeable" data-ratio="0.5625">
			   <video>
			      <source type="video/webm" src="">
			      <source type="video/mp4" src="">
			      <source type="video/ogg" src="">
			   </video>
 			   <div class="fp-playlist">
 			   <c:forEach var="video" items="${userCourse.videos}" >
 			   <c:if test="${userCourse.paid == true}">
			      <a href="${video.url}"  id="${video.videoId}">
			      <img src="${video.activeThumbnail}">
			      <center>${video.name}</center></a>
			   </c:if>   
 			   <c:if test="${userCourse.paid == false}">
			      <a href=""  id="${video.videoId}">
			      <img src="${video.activeThumbnail}">
			      <center>${video.name}</center></a>
			   </c:if>   
			    </c:forEach>
			    <c:if test="${userCourse.paid == true}">
			     	<a href="TakeQuiz.jsp" style="position: relative; left:50px; top:-80px">
			      		<img src="images/startexam.png" height="60px" border=0>
			    	 </a>
			     </c:if>
			     <c:if test="${userCourse.paid == false}">
			     	<a href="/payment?courses=${userCourse.courseId}"><center><img src="images/starthere.jpg" height=40px border=0></center></a>
			     </c:if>
			   </div>
			</div>
        </div>	
      </div>
    </div>
  </div>
</c:forEach>
</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>