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
<script type="text/javascript" >
	$(document).ready(function(){
		var ref = document.referrer;
		if(document.referrer !== 'undefined')
			$('#cancelUrl').attr('href', document.referrer);
		else
			$('#cancelUrl').attr('href', '${domain}');
		
		$('#paymentform').bootstrapValidator({
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
		       firstname: {
		       		validators: {
		            	notEmpty: {
		                	message: 'The Cardhoder\'s first name is required and cannot be empty.'
		                }
		            }
		       },
		       lastname: {
		       		validators: {
		            	notEmpty: {
		                	message: 'The Cardhoder\'s last name is required and cannot be empty.'
		                }
		            }
		       },
		       creditcardnum: {
		       		validators: {
		            	notEmpty: {
		                	message: 'The Credit Card Number is required and cannot be empty.'
		                }
		            }
		       },
		       exprmonth: {
		       		validators: {
		            	notEmpty: {
		                	message: 'The Credit Card Expiration Month is required.'
		                }
		            }
		       },
		       expryear: {
		       		validators: {
		            	notEmpty: {
		                	message: 'The Credit Card Expiration Year is required.'
		                }
		            }
		       },
		       address: {
		       		validators: {
		            	notEmpty: {
		                	message: 'The Billing Address is required and cannot be empty.'
		                }
		            }
		       },
		       city: {
		       		validators: {
		            	notEmpty: {
		                	message: 'The Billing City is required and cannot be empty.'
		                }
		            }
		       },
		       state: {
		       		validators: {
		            	notEmpty: {
		                	message: 'The Billing State is required and cannot be empty.'
		                }
		            }
		       },
		       zipcode: {
		       		validators: {
		            	notEmpty: {
		                	message: 'The Billing Zipcode is required and cannot be empty.'
		                }
		            }
		       }
		  }
	});
	$('#paymentform').bootstrapValidator('resetForm', false).find('[name="firstname"]').focus();
		
		
	});
</script>
</head>

<body>
<!-- Header End -->
<!-- Payment Form -->
<div class="container">
	<div class="row-fluid">
      <form role="form" id="paymentform" modelAttribute="payment" class="form-horizontal" action="" method="post">
      <input type="hidden" name="amount" value="${payment.amount}" />
      <input type="hidden" name="course" value="${payment.course}" />
        <br>
          <div id="legend">
            <legend class="">Payment Information</legend>
          </div>   
          <div class="form-group">
	          <label class="col-sm-2 control-label">Course</label>
      		 <div class="col-sm-10">
      			<input type="cardholder" class="form-control" id="courseName"  value="${payment.course}" disabled >
    		 </div>
  		  </div>

          <div class="form-group">
	          <label class="col-sm-2 control-label">Amount</label>
      		 <div class="col-sm-10">
      			<input type="cardholder" class="form-control" id="amt" name="amt" value="$${payment.amount}" disabled >
    		 </div>
  		  </div>
          <div class="form-group">
	          <label class="col-sm-2 control-label">Cardholder's First Name</label>
      		 <div class="col-sm-10">
      			<input type="cardholder" class="form-control" name="firstname" id="firstname" maxlength="15" value="${payment.firstname}">
    		 </div>
  		  </div>
          <div class="form-group">
	          <label class="col-sm-2 control-label">Cardholder's Last Name</label>
      		 <div class="col-sm-10">
      			<input type="cardholder" class="form-control" name="lastname" id="lastname" maxlength="15" value="${payment.lastname}">
    		 </div>
  		  </div>
		  <c:if test="${user == null}">
          	<div class="form-group">
	          	<label class="col-sm-2 control-label">Email Address</label>
      		 	<div class="col-sm-10">
      				<input type="cardholder" class="form-control" name="email" id="email" maxlength="65" value="${payment.email}">
    		 	</div>
  		  	</div>
		  </c:if>
		  <!-- Card Number -->
		  <div class="form-group">
     	  	<label class="col-sm-2 control-label">Card Number</label>
    		<div class="col-sm-10">
      			<input type="cardname" class="form-control" name="creditcardnum" id="creditcardnum" maxlength="16" value="${payment.creditcardnum}">
    		</div>
  		  </div>  
          <!-- Expiry-->
          <div class="form-group">
          	<label class="col-sm-2 control-label">Card Expiry</label>
          		<div class="control-group">
                    <div style="position:relative; left:17px;" class="controls">
		    			<select class="span3" name="exprmonth" id="exprmonth">
			                <option value="01">Jan (01)</option>
			                <option value="02">Feb (02)</option>
			                <option value="03">Mar (03)</option>
			                <option value="04">Apr (04)</option>
			                <option value="05">May (05)</option>
			                <option value="06">June (06)</option>
			                <option value="07">July (07)</option>
			                <option value="08">Aug (08)</option>
			                <option value="09">Sep (09)</option>
			                <option value="10">Oct (10)</option>
			                <option value="11">Nov (11)</option>
			                <option value="12">Dec (12)</option>
	              		</select>
	    				<select class="span2" name="expryear" id="expryear">
	                		<option value="14">2014</option>
	                		<option value="15">2015</option>
	                		<option value="16">2016</option>
	                		<option value="17">2017</option>
	                		<option value="18">2018</option>
	                		<option value="19">2019</option>
	                		<option value="20">2020</option>
	                		<option value="21">2021</option>
	                		<option value="22">2022</option>
	                		<option value="23">2023</option>
	              		</select>
	              	</div>
  		    	</div>
		  	</div>

          <!-- CVV 
          <div class="form-group">
     	  	<label class="col-sm-2 control-label">Card CVV</label>
    		<div class="col-sm-10">
      			<input type="text" class="form-control" id="cvv_confirm" placeholder="card ccv">
    		</div>
  		  </div> 
 --> 		  
  		  <!-- Billing Address -->
		  <div class="form-group">
		    <label class="control-label"  for="billing">Billing Address</label>
		  </div>
		  <div class="form-group">
		    <label for="billing" class="col-sm-2 control-label">Address</label>
     	  	<div class="col-sm-10">      			
              	<input type="text" id="address" name="address" class="form-control" value="${payment.address}" class="input-xlarge">
    		</div>
  		  </div> 
		  <div class="form-group">
		    <label for="billing" class="col-sm-2 control-label">City</label>
     	  	<div class="col-sm-10">      			
              	<input type="text" id="city" name="city" class="form-control" value="${payment.city}" class="input-xlarge">
    		</div>
  		  </div> 
          <div class="form-group">
          	<label class="col-sm-2 control-label">State</label>
          		<div class="control-group">
                    <div style="position:relative; left:17px;" class="controls">
		    			<select class="span3" name="state" id="state">
			                <option value="AL">Alabama</option>
							<option value="AK">Alaska</option>
							<option value="AZ">Arizona</option>
							<option value="AR">Arkansas</option>
							<option value="CA">California</option>
							<option value="CO">Colorado</option>
							<option value="CT">Connecticut</option>
							<option value="DE">Delaware</option>
							<option value="DC">District Of Columbia</option>
							<option value="FL">Florida</option>
							<option value="GA">Georgia</option>
							<option value="HI">Hawaii</option>
							<option value="ID">Idaho</option>
							<option value="IL">Illinois</option>
							<option value="IN">Indiana</option>
							<option value="IA">Iowa</option>
							<option value="KS">Kansas</option>
							<option value="KY">Kentucky</option>
							<option value="LA">Louisiana</option>
							<option value="ME">Maine</option>
							<option value="MD">Maryland</option>
							<option value="MA">Massachusetts</option>
							<option value="MI">Michigan</option>
							<option value="MN">Minnesota</option>
							<option value="MS">Mississippi</option>
							<option value="MO">Missouri</option>
							<option value="MT">Montana</option>
							<option value="NE">Nebraska</option>
							<option value="NV">Nevada</option>
							<option value="NH">New Hampshire</option>
							<option value="NJ">New Jersey</option>
							<option value="NM">New Mexico</option>
							<option value="NY">New York</option>
							<option value="NC">North Carolina</option>
							<option value="ND">North Dakota</option>
							<option value="OH">Ohio</option>
							<option value="OK">Oklahoma</option>
							<option value="OR">Oregon</option>
							<option value="PA">Pennsylvania</option>
							<option value="RI">Rhode Island</option>
							<option value="SC">South Carolina</option>
							<option value="SD">South Dakota</option>
							<option value="TN">Tennessee</option>
							<option value="TX">Texas</option>
							<option value="UT">Utah</option>
							<option value="VT">Vermont</option>
							<option value="VA">Virginia</option>
							<option value="WA">Washington</option>
							<option value="WV">West Virginia</option>
							<option value="WI">Wisconsin</option>
							<option value="WY">Wyoming</option>
	              		</select>
	              	</div>
  		    	</div>
		  	</div>
          	<div class="form-group">
		    	<label for="zip" class="col-sm-2 control-label">Zip Code</label>
     	  		<div class="col-sm-10">      			
              		<input type="text" id="zipcode" name="zipcode" class="form-control" value="${payment.zipcode}" class="input-xlarge">
    			</div>
  		  	</div>
  		  	<c:if test="${error != null}">
	        	<div class="form-group">
        			<div class="col-md-9 col-md-offset-3">
            			<div class="alert alert-danger" role="alert">${error}</div>
            		</div>	
        		</div>
           </c:if>
          <!-- Submit -->
          <div class="form-group">
            <div class="controls">
              <button type="submit" class="btn btn-primary" >Pay Now</button>
              <a id="cancelUrl" href="#"> <button type="button" class="btn btn-default">Cancel</button></a>
            </div>
          </div>
      </form>
      <!-- (c) 2005, 2014. Authorize.Net is a registered trademark of CyberSource Corporation --> 
    <div class="AuthorizeNetSeal"> 
    	<script type="text/javascript" language="javascript">var ANS_customer_id="7c7bfc97-097a-4385-8375-521f4f2e79a4";
    	</script> 
    	<script type="text/javascript" language="javascript" src="//verify.authorize.net/anetseal/seal.js" >
    	</script> 
    	<a href="http://www.authorize.net/" id="AuthorizeNetText" target="_blank">Accept Credit Cards</a> 
    </div>
    </div>
    <br>
</div>

<!-- Footer -->
<%@ include file="footer.jsp" %>
<!-- Footer End --> 
</body>
</html>