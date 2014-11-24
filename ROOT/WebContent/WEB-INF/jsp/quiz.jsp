<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- bootstrap 2.3.0 -->
<!-- style sheets bootstrap 2.3.0 -->
<link href="content/bootstrap.css" rel="stylesheet" />
<link href="content/bootstrap-responsive.css" rel="stylesheet" />
<link href="content/site.css" rel="stylesheet" />
<script src="js/jquery-1.8.2.js"></script>
<script src="js/jquery-ui-1.8.24.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#popup').modal({show:false});
	$("form" ).submit(function( event ) {
		event.preventDefault();
		var ret = checkAns();
	  	if(!ret)
	  		return;
	  	processQuizSubmit(ret);
	  	
	});
});
	
	function processQuizSubmit(data){
		$.ajax({
			type: "GET",
			url: "/quiz/submit",
			processData: false,
			data: "params=" + data,
			success: function(data, status, jqXHR){
				if(data.status == "pass"){
					$('#popup').find('h4').html('<center>Success! You passed the quiz!</center>');
					$('#bDiv').html(
					    				'Congratulations, you have passed the course quiz and you can now print your certification. You have two choices for the certificate,' + 
					    				'a wallet sized certificate or a wall certificate suitable for framing. <br><br>' +
					    				'After you select a certificate size, we will open a PDF on your desktop that contains a high resolution print image' +
					    				'of your certificate and start the printing process. Simply select the printer that you wish to use and start the print' +
					    				'request.<br><br>' +
					    				'When you have completed the printing process, save the certificate PDF on your computer for future reference.' +
					    		 		'<br><br>' +
					  				'<center>' +
					  				'<p>' +
					  					'<a href="printtempcard"><button type="button" class="btn btn-primary btn-lg">Print Wallet Certificate</button></a>' +
									'</p>' +
									'</center>');
				}else if(data.status == "fail"){
					$('#popup').find('h4').html('<center>Sorry, You didn\'t pass the quiz.</center>');
					$('#bDiv').html('<button type="button" data-dismiss="modal" id="tryAgain" class="btn btn-default">Try Again</button>' +
							'<a href="/courses"><button type="button" id="watchVideos" class="btn btn-default">Watch Videos</button></a>');
				}
				$('#popup').modal({show:true});
			},
			dataType: "json"
		});
		
	}
	
	function checkAns(){
		var ret = true;
		var str ='[';
		$("[id|='q']").each(function(){
			var id = this.id;
			var inp = $('#' + id).find('input:checked');
			if(inp.length == 0){
				$('#messageDiv').html('<label style="color:red;">All quiz questions need to be answered.</label>');
				ret = false;
				return;
			}else{
				if(str.length > 1)	
					str += ',';
				var r = inp[0];	
				str += '{"q":' + id.substring(2, id.length) + ',"a":' + r.id + '}';
			}
		});
		if(ret == false)
			return ret;
		str += ']';
		return str;
	}
</script>
<title>Take The Course Quiz</title>
	<div class="modal fade" id="popup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title"></h4>
		      </div>
		      <div id="bDiv" class="modal-body">
		     </div>
		   </div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div>
</head>
<body>
	<div class="container">
		<h2>${courseName} - Course Quiz</h2>
		<div>
		<form id="quizForm" method="post" class="form-horizontal">
		<c:forEach var="question" items="${quiz}" >
			<div class="panel panel-default">
			<div class="panel-heading" style="font-size:15px; font-weight:bold;">${question.question}</div>
  				<div class="panel-body" id="q-${question.id}">   
					<c:forEach var="answer" items="${question.answers}" >
		    			<div>
		        			<input type="radio" name="${question.id}" value="${answer.id}" id="${answer.id}" />
		        			<label for="${question.id}">${answer.answer}</label>
		    			</div>
		    		</c:forEach>
		    	</div>
			</div>
		</c:forEach>
		<center>
			<div id="messageDiv">
			</div>
		</center>
		<div class="form-group">
			<button type="submit" class="btn btn-primary btn-lg">Submit Quiz For Results</button>
			<a href="/courses"><button type="button" class="btn btn-primary btn-lg">Cancel</button></a>
		</div>
		</form>
		</div>
	</div>
</body>
</html>