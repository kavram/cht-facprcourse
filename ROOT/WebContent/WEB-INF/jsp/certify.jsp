<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<html>
<head>
<jsp:include page="resources.jsp" />
<jsp:include page="header.jsp" />
<script type="text/javascript">
	 <c:if test="${user.email == null}">
	 	$(document).ready(function(){
	 		$('#crsPmt1').click(function(e){
	 			e.preventDefault();
	 			$('#loginModal').modal({show:true});
	 		});
	 		$('#crsPmt2').click(function(e){
	 			e.preventDefault();
	 			$('#loginModal').modal({show:true});
	 		});
	 		$('#crsPmt3').click(function(e){
	 			e.preventDefault();
	 			$('#loginModal').modal({show:true});
	 		});
	 		$('#crsPmt4').click(function(e){
	 			e.preventDefault();
	 			$('#loginModal').modal({show:true});
	 		});
	 	});
	 </c:if>
	
	
</script>

</head>
<body>
<jsp:include page="topNav.jsp" >
  <jsp:param name="menu1" value="" />
  <jsp:param name="menu2" value="active" />
  <jsp:param name="menu3" value="" />
  <jsp:param name="menu4" value="" />
  <jsp:param name="menu5" value="" />
  <jsp:param name="menu6" value="" />
  <jsp:param name="menu7" value="" />
</jsp:include>

<!---=========== Start Content ==============----->

<br><br>

<div class="container">
	<div class="row-fluid">
	<h3> CPR Basic</h3>
    	<div class="span9">
    		Adult CPR set to OSHA standards. Also includes training in Hands only CPR.
			If in the past you have become certified with any of the following companies; American Safety Council, ASHI or Medic First Aid, Red Cross, AHA, you are encouraged to renew your training and certification with this course. This course follows the latest American Heart Association, ECC/ILCOR guidelines. 
			Medical Emergency, Stroke, Heart Attack, Shock,
			Cardiac Arrest Training, Adult CPR,
			AED. Hands-Only CPR Choking Adult Choking- Conscious and Unconscious.

    		<h3>Price - $17.95 &nbsp;&nbsp;&nbsp;<a id="crsPmt1" href="payment?courses=4"><img src="images/starthere.jpg" height=40px border=0></a></h3>
    	</div>
    	<div class="span2">
    		<img src="images/cpr.jpg" height="120px" border=0>
    	</div>
    </div>
    <div class="clearfix"></div>
    <hr>
    <h3> First Aid Basic</h3>
    <div class="row-fluid">
    	<div class="span2">
    	<center>
    		<img src="images/fa.jpg" height="120px" border=0>
    	</center>
    	</div>
    	<div class="span9">
    		First Aid training at its finest in both First Aid and CPR. Designed for people that want to master the science of First Aid and CPR at their own pace. Certification meets all of the necessary AHA or OSHA regulations. Learn what to do in the event of an emergency.  . This course follows the latest American Heart Association, ECC/ILCOR guidelines. 
			Topics include: Heimlich maneuver, conscious choking adult, and stroke, Cardiac Arrest, Heart Attack
			Bite Wounds, puncture wounds, nose bleed, head injury, treatments, fractures, I.C.E., Electrocution, cleaning wounds, stop bleeding, cuts and Scrapes, choking, and burns

    		<h3>Price - $22.95 &nbsp;&nbsp;&nbsp;<a id="crsPmt2" href="payment?courses=1"><img src="images/starthere.jpg" height=40px border=0></a></h3>
    	</div>
    	<div class="clearfix"></div>
    </div>
    <hr>
    <div class="row-fluid">
	<h3> CPR and First Aid</h3>
    	<div class="span9">
    		CPR Basic is training in both First Aid and CPR certification that meets all of the necessary AHA or OSHA regulations. Designed for people that want to master the science of First Aid and CPR at their own pace. This course follows the latest American Heart Association, ECC/ILCOR guidelines.
    		<h3>Price - $31.95 &nbsp;&nbsp;&nbsp;<a id="crsPmt3" href="payment?courses=2"><img src="images/starthere.jpg" height=40px border=0></a></h3>
    	</div>
    	<div class="span2">
    		<img src="images/facpr.jpg" height="120px" border=0>
    	</div>
    </div>
    <div class="clearfix"></div>
    <hr>
    <h3> Basic Life Support (BLS)</h3>
    <div class="row-fluid">
    	<div class="span2">
    	<center>
    		<img src="images/bls.jpg" height="120px" border=0>
    	</center>
    	</div>
    	<div class="span9">
    		Learn how to perform CPR on Children, Adults, and Infants. 
    		In addition you will learn how to respond to a scene with  Adults ( 1 or 2 rescuers) 
    		as how to use an Automated External Defibrillator (AED). 
    		You'll also learn about First-Aid and how to  care for wounds, cuts and scrapes, strokes, and seizures.
    		<h3>Price - $51.95 &nbsp;&nbsp;&nbsp;<a id="crsPmt4" href="payment?courses=3"><img src="images/starthere.jpg" height=40px border=0></a></h3>
    	</div>
    	<div class="clearfix"></div>
    </div>
</div>
<!---============ End Content ===============----->
<%@ include file="footer.jsp" %>
</body>
</html>