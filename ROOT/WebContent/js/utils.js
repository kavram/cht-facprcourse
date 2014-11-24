function processLogout(){
	$.ajax({
		type: "GET",
		url: "/ajax/logout",
		processData: false,
		success: function(data, status, jqXHR){
			if(data.status == "success"){
				//$('#userHead').html('<a href="#registerModal"  data-toggle="modal" data-target="#registerModal"> Not a Member? Join Now For FREE </a> |' + 
				//		'<a href="#loginModal"  data-toggle="modal" data-target="#loginModal" >Login</a>');
				location.reload(true);
			}
		},
		dataType: "json"
	});
};

function checkUserRegStatus(){
	$.ajax({
		type: "GET",
		url: "/ajax/user-reg-status",
		processData: false,
		success: function(data, status, jqXHR){
			if(data.status != "confirmed"){
				$('#regConfModal').modal({show:true});
			}
		},
		dataType: "json"
	});
};


function processLoginSubmit(){
	var data = {"email": $("#email").val(), "password": $("#password").val()};
	var str = JSON.stringify(data);
	$.ajax({
		type: "GET",
		url: "/ajax/login",
		processData: false,
		data: "params=" + str,
		success: function(data, status, jqXHR){
			if(data.status == "error"){
				$('#loginAjaxMessages').html('<div class="alert alert-danger" role="alert">' + data.error + '</div>');
			} 
			if(data.status == "success"){
				//$('#loginModal').modal('hide');
				//$('#userHead').html('Welcome,' + data.firstName + ' ' + data.lastName + ' | <a id="logouta" href="" >Log out</a>');
				//$('#logouta').click(function(e){
		 		//	e.preventDefault();	
		 		//	processLogout();
		 		//});
				location.reload(true);
			}
		},
		dataType: "json"
	});
};

function processContactUsSubmit(){
	var data = {"email": $('#InputEmail').val(), "name": $('#InputName').val(), "message": $("#InputMessage").val()};
	var str = JSON.stringify(data);
	$.ajax({
		type: "GET",
		url: "/ajax/contact",
		processData: false,
		data: "params=" + str,
		success: function(data, status, jqXHR){
			if(data.status == "success"){
				$('#alert1').show();
			}
		},
		dataType: "json"
	});
};


function processForgotPassSubmit(){
	var data = {"email": $('#forgotPassForm').find("#email").val()};
	var str = JSON.stringify(data);
	$.ajax({
		type: "GET",
		url: "/ajax/forgot-password",
		processData: false,
		data: "params=" + str,
		success: function(data, status, jqXHR){
			if(data.status == "error"){
				$('#forgotPassAjaxMessages').html('<div class="alert alert-danger" role="alert">' + data.error + '</div>');
			} 
			if(data.status == "success"){
				$('#forgotPassMessages').html('<div class="alert alert-success" role="alert">We sent you an email with a link to reset your password.</div>');
			}
		},
		dataType: "json"
	});
};


function processRegistrationSubmit(){
	var data = {"email": $('#registerForm').find("#email").val(), "firstname": $("#firstname").val(), "lastname": $("#lastname").val(), "password": $('#registerForm').find("#password").val()};
	var str = JSON.stringify(data);
	$.ajax({
		type: "GET",
		url: "/ajax/register",
		processData: false,
		data: "params=" + str,
		success: function(data, status, jqXHR){
			if(data.status == "error"){
				$('#registerAjaxMessages').html('<div class="alert alert-danger" role="alert">' + data.error + '</div>');
			} 
			if(data.status == "success"){
				//$('#myRegister').modal('hide');
				$('#userHead').html('Welcome,' + data.firstName + ' ' + data.lastName + ' | <a href="/logout" >Log out</a>');
				$('#registerMessages').html('<div class="alert alert-success" role="alert">Thank you. We sent you an email to confirm your registration.</div>');
		 		$('#crsPmt1').unbind('click');
		 		$('#crsPmt2').unbind('click');
		 		$('#crsPmt3').unbind('click');
		 		$('#crsPmt4').unbind('click');
		 		
		 		$('#registerModal').on('hidden.bs.modal', function () {
		 			location.reload(true);
		 		});

			}
		},
		dataType: "json"
	});
};

function clearRegFormServerErrorsDiv(validator, $field, options){
	$('#registerAjaxMessages').html('');
    return true;
}



$(document).ready(function() {
    $('#loginForm').bootstrapValidator({
        container: '#loginMessages',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            email: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required and cannot be empty'
                    },
                    emailAddress: {
                        message: 'The email address is not valid'
                    },
                    callback: {
                    	callback : function(validator, $field, options) {
                    		$('#loginAjaxMessages').html('');
                            return true;
                    	}
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and cannot be empty'
                    },
                    stringLength: {
                        mix: 6,
                        max: 10,
                        message: 'The password must be from 6 to 10 characters long'
                    },
                    callback: {
                    	callback : function(validator, $field, options) {
                    		$('#loginAjaxMessages').html('');
                            return true;
                    	}
                    }
                }
            }
        }
    })
    .on('success.form.bv', function(e) {
            // Prevent form submission
            e.preventDefault();
            var validator = $(e.target).data('bootstrapValidator');
            processLoginSubmit();
        });

    $('#loginModal').on('shown.bs.modal', function() {
        $('#loginForm').bootstrapValidator('resetForm', true)
                       .find('[name="email"]').focus();
    });

    
    $('#forgotPassForm').bootstrapValidator({
        container: '#forgotPassMessages',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            email: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required and cannot be empty'
                    },
                    emailAddress: {
                        message: 'The email address is not valid'
                    },
                    callback: {
                    	callback : function(validator, $field, options) {
                    		$('#forgotPassAjaxMessages').html('');
                            return true;
                    	}
                    }
                }
            }
        }
    })
    .on('success.form.bv', function(e) {
            // Prevent form submission
            e.preventDefault();
            var validator = $(e.target).data('bootstrapValidator');
            processForgotPassSubmit();
        });

    $('#forgotPassModal').on('shown.bs.modal', function() {
    	$('#forgotPassForm').find('#forgotPassAjaxMessages').html('');
        $('#forgotPassForm').bootstrapValidator('resetForm', true)
                       .find('[name="email"]').focus();
    });
    
    
    $('#registerForm').bootstrapValidator({
        container: '#registerMessages',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	firstname: {
        		validators: {
        			notEmpty: {
        				message: 'The first name is required and cannot be empty'
        			},
                    callback: {
                    	callback : clearRegFormServerErrorsDiv
                    }
        		}
        	},
        	lastname: {
        		validators: {
        			notEmpty: {
        				message: 'The last name is required and cannot be empty'
        			},
                    callback: {
                    	callback : clearRegFormServerErrorsDiv
                    }
        		}
        	},
        	email: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required and cannot be empty'
                    },
                    emailAddress: {
                        message: 'The email address is not valid'
                    },
                    callback: {
                    	callback : clearRegFormServerErrorsDiv
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: 'The password is required and cannot be empty'
                    },
                    stringLength: {
                        min: 6,
                        max: 10,
                        message: 'The password must be from 6 to 10 characters long'
                    },
                    callback: {
                    	callback : clearRegFormServerErrorsDiv
                    }
                }
            },
            confirmpassword: {
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
                    		$('#registerForm').find('#serverErrors').text('');
                    		var passVal = $('#registerForm').find('#password').val();
                    		var confPassVal = $('#registerForm').find('#confirmpassword').val();
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
    .on('success.form.bv', function(e) {
            // Prevent form submission
            e.preventDefault();
            var validator = $(e.target).data('bootstrapValidator');
            processRegistrationSubmit();
        });

    $('#registerModal').on('shown.bs.modal', function() {
        $('#registerForm').bootstrapValidator('resetForm', true)
                       .find('[name="fname"]').focus();
    });
});
