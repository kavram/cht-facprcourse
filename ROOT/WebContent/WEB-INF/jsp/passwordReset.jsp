<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<html>
<jsp:include page="resources.jsp" />
<script type="text/javascript">
$(document).ready(function() {
	$('#passwordResetForm').bootstrapValidator({
    container: '#messages',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	newPassword: {
            validators: {
                notEmpty: {
                    message: 'The password is required and cannot be empty'
                },
                stringLength: {
                    min: 6,
                    max: 10,
                    message: 'The password must be from 6 to 10 characters long'
                }
            }
        },
        confirmPassword: {
            validators: {
                notEmpty: {
                    message: 'The confirm password field is required'
                },
                stringLength: {
                    mix: 6,
                    max: 10,
                    message: 'The password must be from 6 to 10 characters long'
                },
                callback: {
                	callback : function clearRegFormServerErrorsDiv(validator, $field, options){
                		var passVal = $('#passwordResetForm').find('#newPassword').val();
                		var confPassVal = $('#passwordResetForm').find('#confirmPassword').val();
                		if(passVal != confPassVal){
                			return {
                	            valid: false,    // or false
                	            message: 'The password fields need to match'
                	        }
                		}
                        return true;
                    }
                }
            }
        }
    }
})
//.on('success.form.bv', function(e) {
        // Prevent form submission
        //e.preventDefault();
        //var validator = $(e.target).data('bootstrapValidator');
        //$('#passwordResetForm').submit();
  //      document.getElementById("passwordResetForm").submit();
        //processRegistrationSubmit();
  //  });

$('#passwordResetForm').bootstrapValidator('resetForm', true)
                   .find('[name="password"]').focus();
});

</script>
<body>
<h1>
  <center>
  	Please reset your password<br>
  </center>
</h1>
<form role="form" id="passwordResetForm" method="POST" action="${domain}/password-reset" class="form-horizontal">
	<input type="hidden" name="token" value="${token}" />
	<div class="form-group">
		<label class="col-md-3 control-label">Password</label>
	     <div class="col-md-6">
	     	<input type="password" class="form-control" name="newPassword" id="newPassword" required />
	     </div>
	</div>
	<div class="form-group">
	    <label class="col-md-3 control-label">Confirm Password</label>
	        <div class="col-md-6">
	             <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" />
	        </div>
	</div>
	<div class="form-group">
    	<div class="col-md-9 col-md-offset-3">
    		<div id="messages"></div>
     	</div>
    </div>
	<div class="form-group">
		<div class="col-md-5 col-md-offset-3">
	    	<button type="submit" id="submitButton" class="btn btn-default">OK</button>
	        <button class="btn btn-default" id="cancelButton" type="button">Cancel</button>
	    </div>
	 </div>
</form>



<!-- Footer -->
<%@ include file="footer.jsp" %>
<!-- Footer End --> 
</body>
</html>
