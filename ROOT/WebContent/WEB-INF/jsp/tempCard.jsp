<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Print Wallet Temp Card</title>
	<style type="text/css">
		BODY {color: black; background: white;}
		A:link, A:visited {background: white; color: black; text-decoration: underline;
   		font-weight: bold;}
		H1, H2, H3 {background: white; color: black; padding-bottom: 1px;
   		border-bottom: 1px solid gray;}
		DIV.adbanner {display: none;}
	</style>
</head>
<body>
<div id="myPrint">
<c:if test="${userCourse.courseId == 4}">
	<img src="images/CPRWalletCard.jpg" align=left>
	<div>
		<p style='position: absolute; left: 140px; top: 105px; font-size: 16px; font-weight: bold;' >${user.firstName} ${user.lastName}</p>
		<p style='position: absolute; left: 40px; top: 215px; font-size: 16px; font-weight: bold;'>${issueDate}</p><p style='position: absolute; left: 270px; top: 215px; font-size: 16px; font-weight: bold;'>${renewDate}</p>
	</div>
	<div>
		<img src="images/bgwalker_signature.gif" height=60px style="position: absolute; left: 425px; top: 150px;">
	<br>
	<br>
	</div>
	<br>
	<button onclick="divPrint()" type="button" style="position: absolute; left: 70px; top: 290px;font-size: 16px; font-weight: bold;">Print Temporary Certificate</button>
</c:if>
<c:if test="${userCourse.courseId == 1}">
	<img src="images/FirstAidWallet.jpg" align=left>
	<div>
		<p style='position: absolute; left: 140px; top: 105px; font-size: 16px; font-weight: bold;' >${user.firstName} ${user.lastName}</p>
		<p style='position: absolute; left: 40px; top: 215px; font-size: 16px; font-weight: bold;'>${issueDate}</p><p style='position: absolute; left: 270px; top: 215px; font-size: 16px; font-weight: bold;'>${renewDate}</p>
	</div>
	<div>
		<img src="images/bgwalker_signature.gif" height=60px style="position: absolute; left: 425px; top: 150px;">
	<br>
	<br>
	</div>
	<br>
	<button onclick="divPrint()" type="button" style="position: absolute; left: 70px; top: 290px;font-size: 16px; font-weight: bold;">Print Temporary Certificate</button>
</c:if>
<c:if test="${userCourse.courseId == 3}">
	<img src="images/CPRWalletCard.jpg" align=left>
	<div>
		<p style='position: absolute; left: 140px; top: 105px; font-size: 16px; font-weight: bold;' >${user.firstName} ${user.lastName}</p>
		<p style='position: absolute; left: 40px; top: 215px; font-size: 16px; font-weight: bold;'>${issueDate}</p><p style='position: absolute; left: 270px; top: 215px; font-size: 16px; font-weight: bold;'>${renewDate}</p>
	</div>
	<div>
		<img src="images/bgwalker_signature.gif" height=60px style="position: absolute; left: 425px; top: 150px;">
	<br>
	<br>
	</div>
	<br>
	<button onclick="divPrint()" type="button" style="position: absolute; left: 70px; top: 290px;font-size: 16px; font-weight: bold;">Print Temporary Certificate</button>
</c:if>
<c:if test="${userCourse.courseId == 2}">
	<img src="images/CPRWalletCard.jpg" align=left>
	<div>
		<p style='position: absolute; left: 140px; top: 105px; font-size: 16px; font-weight: bold;' >${user.firstName} ${user.lastName}</p>
		<p style='position: absolute; left: 40px; top: 215px; font-size: 16px; font-weight: bold;'>${issueDate}</p><p style='position: absolute; left: 270px; top: 215px; font-size: 16px; font-weight: bold;'>${renewDate}</p>
	</div>
	<div>
		<img src="images/bgwalker_signature.gif" height=60px style="position: absolute; left: 425px; top: 150px;">
	<br>
	<br>
	</div>
	<img src="images/FirstAidWallet.jpg" align=left>
	<div>
		<p style='position: absolute; left: 140px; top: 375px; font-size: 16px; font-weight: bold;' >${user.firstName} ${user.lastName}</p>
		<p style='position: absolute; left: 40px; top: 484px; font-size: 16px; font-weight: bold;'>${issueDate}</p><p style='position: absolute; left: 270px; top: 484px; font-size: 16px; font-weight: bold;'>${renewDate}</p>
	</div>
	<div>
		<img src="images/bgwalker_signature.gif" height=60px style="position: absolute; left: 425px; top: 419px;">
	<br>
	<br>
	</div>
	<br>
	<button onclick="divPrint()" type="button" style="position: absolute; left: 70px; top: 550px;font-size: 16px; font-weight: bold;">Print Temporary Certificate</button>
</c:if>


</div>
<script type="text/javascript">
      function divPrint() {
        window.print();
        window.location.href = "/";
      }
</script>
</body>
</html>