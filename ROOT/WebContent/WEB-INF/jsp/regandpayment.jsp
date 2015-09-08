<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="resources.jsp" />
<script type="text/javascript" >
	$(document).ready(function(){
		$('#regandpayform').bootstrapValidator({
			container: '#messages',
		    feedbackIcons: {
		    	//valid: 'glyphicon glyphicon-ok',
		        //invalid: 'glyphicon glyphicon-remove',
		        //validating: 'glyphicon glyphicon-refresh'
		    },
		    submitButtons: 'button[type="submit"]',
		    fields: {
	            email: {
	                validators: {
	                    notEmpty: {
	                        message: 'The email address is required and cannot be empty'
	                    },
	                    emailAddress: {
	                        message: 'The email address is not valid'
	                    }
	                }
	            },
		       firstName: {
		       		validators: {
		            	notEmpty: {
		                	message: 'The first name is required and cannot be empty.'
		                }
		            }
		       },
		       lastName: {
		       		validators: {
		            	notEmpty: {
		                	message: 'The last name is required and cannot be empty.'
		                }
		            }
		       }
		  }
	});
	$('#regandpayform').bootstrapValidator('resetForm', false).find('[name="firstName"]').focus();
	});
	
	<c:if test="${status != null}">
	 	$(document).ready(function(){
	 		$('#successModal').modal({show:true});
	 	});
	 </c:if>
		
		
	
</script>
</head>
<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
 		<div class="modal-content">
			<div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title"><center>User Registration Successful!</center></h4>
		   </div>
		   <div class="modal-body">
		   	<form id="f" method="post" class="form-horizontal">
	        	<div class="form-group">
	            	<div class="col-md-5 col-md-offset-3">
	                	<button class="btn btn-default" id="ok" data-dismiss="modal" type="button">OK</button>
	                </div>
	           	</div>
	       </form>
	     </div>  
		</div>
	  </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->

<body>
<div class="container">
	<div class="row-fluid">
      <form role="form" id="regandpayform" modelAttribute="regandpay" class="form-horizontal" action="" method="post">
        <br>
          <div id="legend">
            <legend class="">User Information</legend>
          </div>   
	      <div class="form-group">
	      	<label class="col-md-3 control-label">First Name</label>
	        	<div class="col-md-6">
	            	<input type="text" class="form-control" name="firstName" id="firstName" value="${regandpay.firstName}" maxlength="15"/>
	            </div>
	      </div>
	      <div class="form-group">
	      	<label class="col-md-3 control-label">Last Name</label>
	      	<div class="col-md-6">
	        	<input type="text" class="form-control" name="lastName" id="lastName" value="${regandpay.lastName}" maxlength="15"/>
	       	</div>
	      </div>
	      <div class="form-group">
	      	<label class="col-md-3 control-label">Email Address</label>
	        <div class="col-md-6">
	       		<input type="text" class="form-control" name="email" id="email" value="${regandpay.email}" maxlength="50"/>
	        </div>
	      </div>
          <div id="legend">
            <legend class="">User Courses</legend>
          </div>   
		  <div class="table-responsive">
  			<table class="table table-bordered">
				<tr>
  				<th class="danger"><h4><b>Course</b></h4></th>
  				<th class="danger"><h4><b>Price</b></h4></th>
  				<th class="danger"><h4></h4></th>
			</tr>
			<tr>
				<td><h4>CPR Basic</h4></td>
				<td><h4>$17.95</h4></td>
				<td><input type="checkbox" name="selectedCourses" value="4"></td>
			</tr>
			<tr>
				<td><h4>First Aid Basic</h4></td>
				<td><h4>$22.95</h4></td>
				<td><input type="checkbox" name="selectedCourses" value="1"></td>
			</tr>
			<tr>
				<td><h4>CPR and First Aid</h4></td>
				<td><h4>$31.95</h4></td>
				<td><input type="checkbox" name="selectedCourses" value="2"></td>
			</tr>
			<tr>
				<td><h4>Healthcare Basic Life Support (BLS) </h4></td>
				<td><h4>$51.95</h4></td>
				<td><input type="checkbox" name="selectedCourses" value="3"></td>
			</tr>
  		  </table>
		</div>    
		<c:if test="${error != null}">
	    	<div class="form-group">
        		<div class="col-md-6">
            		<div class="alert alert-danger" role="alert">${error}</div>
            	</div>	
        	</div>
        </c:if>
		      
		<div class="form-group">
        	<div class="controls">
              <button type="submit" class="btn btn-primary">Register User</button>
            </div>
        </div>
  </form>  
 </div>
</div>
</body>
</html>