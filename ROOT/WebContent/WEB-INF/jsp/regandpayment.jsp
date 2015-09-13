<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="resources.jsp" />
<script src="${domain}/js/inputmask.js" type="text/javascript"></script>
<script src="${domain}/js/jquery.inputmask.js" type="text/javascript"></script>
<script type="text/javascript" >
	$(document).ready(function(e){
		$('#phoneNum').inputmask("mask", {"mask": "(999) 999-9999"});
		$("#errorMsg").hide();
		$("#amount").val("$0.00");
		var updateTotalAmount = function(){
			var totalPrice = 0;
			$.each($("input:checked"), function(i, v){
				totalPrice = parseFloat(totalPrice) + parseFloat($(v).attr("price"));
			});
			$("#amount").val("$" + totalPrice.toFixed(2));
		};
		$("input[type=checkbox]").on( "click", updateTotalAmount);
		$('#regSubmit').click(function(e){
			var pass = true;
			if($('#firstName').val().trim() == ''){
				$('#firstName').parent().parent().addClass('form-group has-error');
				pass = false;
			}
			if($('#lastName').val().trim() == ''){
				$('#lastName').parent().parent().addClass('form-group has-error');
				pass = false;
			}
			if($('#email').val().trim() == ''){
				$('#email').parent().parent().addClass('form-group has-error');
				pass = false;
			}
			if($('#phoneNum').val().trim() == ''){
				$('#phoneNum').parent().parent().addClass('form-group has-error');
				pass = false;
			}
			if(pass == false)
				e.preventDefault();
		});
		$('#regandpaySubmit').click(function(e){
			var pass = true;
			if($('#firstName').val().trim() == ''){
				$('#firstName').parent().parent().addClass('form-group has-error');
				pass = false;
			}
			if($('#lastName').val().trim() == ''){
				$('#lastName').parent().parent().addClass('form-group has-error');
				pass = false;
			}
			if($('#email').val().trim() == ''){
				$('#email').parent().parent().addClass('form-group has-error');
				pass = false;
			}
			if($('#phoneNum').val().trim() == ''){
				$('#phoneNum').parent().parent().addClass('form-group has-error');
				pass = false;
			}
			if($("input:checked").length == 0){
				$("#errorMsg").show();
				$("#errorMsg").append("At least one course should be selected.");
				pass = false;
			}
			if($('#ccFirstName').val().trim() == ''){
				$('#ccFirstName').parent().parent().addClass('form-group has-error');
				pass = false;
			}
			if($('#ccLastName').val().trim() == ''){
				$('#ccLastName').parent().parent().addClass('form-group has-error');
				pass = false;
			}
			if($('#ccEmail').val().trim() == ''){
				$('#ccEmail').parent().parent().addClass('form-group has-error');
				pass = false;
			}
			if($('#creditcardnum').val().trim() == ''){
				$('#creditcardnum').parent().parent().addClass('form-group has-error');
				pass = false;
			}
			if($('#exprmonth').val().trim() == ''){
				$('#exprmonth').parent().parent().addClass('form-group has-error');
				pass = false;
			}
			if($('#expryear').val().trim() == ''){
				$('#expryear').parent().parent().addClass('form-group has-error');
				pass = false;
			}
			if($('#address').val().trim() == ''){
				$('#address').parent().parent().addClass('form-group has-error');
				pass = false;
			}
			if($('#city').val().trim() == ''){
				$('#city').parent().parent().addClass('form-group has-error');
				pass = false;
			}
			if($('#state').val().trim() == ''){
				$('#state').parent().parent().addClass('form-group has-error');
				pass = false;
			}
			if($('#zipcode').val().trim() == ''){
				$('#zipcode').parent().parent().addClass('form-group has-error');
				pass = false;
			}

			if(pass == false)
				e.preventDefault();
		});
	
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
	      <div class="form-group">
	      	<label class="col-md-3 control-label">Phone Number</label>
	        <div class="col-md-6">
	       		<input type="text" class="form-control" name="phoneNum" id="phoneNum" value="${regandpay.phoneNum}" maxlength="15"/>
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
				<td><input type="checkbox" name="selectedCourses" value="4" price="17.95"></td>
			</tr>
			<tr>
				<td><h4>First Aid Basic</h4></td>
				<td><h4>$22.95</h4></td>
				<td><input type="checkbox" name="selectedCourses" value="1" price="22.95"></td>
			</tr>
			<tr>
				<td><h4>CPR and First Aid</h4></td>
				<td><h4>$31.95</h4></td>
				<td><input type="checkbox" name="selectedCourses" value="2" price="31.95"></td>
			</tr>
			<tr>
				<td><h4>Healthcare Basic Life Support (BLS) </h4></td>
				<td><h4>$51.95</h4></td>
				<td><input type="checkbox" name="selectedCourses" value="3" price="51.95"></td>
			</tr>
  		  </table>
		</div>    

          <div id="legend">
            <legend class="">Payment Information</legend>
          </div>   
          <div class="form-group">
	          <label class="col-sm-2 control-label">Amount</label>
      		 <div class="col-sm-10">
      			<input type="cardholder" class="form-control" id="amount" name="amount" value="$${regandpay.amount}" disabled >
    		 </div>
  		  </div>
          <div class="form-group">
	          <label class="col-sm-2 control-label">Cardholder's First Name</label>
      		 <div class="col-sm-10">
      			<input type="cardholder" class="form-control" name="ccFirstName" id="ccFirstName" maxlength="15" value="${regandpay.ccFirstName}">
    		 </div>
  		  </div>
          <div class="form-group">
	          <label class="col-sm-2 control-label">Cardholder's Last Name</label>
      		 <div class="col-sm-10">
      			<input type="cardholder" class="form-control" name="ccLastName" id="ccLastName" maxlength="15" value="${regandpay.ccLastName}">
    		 </div>
  		  </div>
		  <c:if test="${user == null}">
          	<div class="form-group">
	          	<label class="col-sm-2 control-label">Email Address</label>
      		 	<div class="col-sm-10">
      				<input type="cardholder" class="form-control" name="ccEmail" id="ccEmail" maxlength="65" value="${regandpay.ccEmail}">
    		 	</div>
  		  	</div>
		  </c:if>
		  <!-- Card Number -->
		  <div class="form-group">
     	  	<label class="col-sm-2 control-label">Card Number</label>
    		<div class="col-sm-10">
      			<input type="cardname" class="form-control" name="creditcardnum" id="creditcardnum" maxlength="16" value="${regandpay.creditcardnum}">
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

  		  <!-- Billing Address -->
		  <div class="form-group">
		    <label class="control-label"  for="billing">Billing Address</label>
		  </div>
		  <div class="form-group">
		    <label for="billing" class="col-sm-2 control-label">Address</label>
     	  	<div class="col-sm-10">      			
              	<input type="text" id="address" name="address" class="form-control" value="${regandpay.address}" class="input-xlarge">
    		</div>
  		  </div> 
		  <div class="form-group">
		    <label for="billing" class="col-sm-2 control-label">City</label>
     	  	<div class="col-sm-10">      			
              	<input type="text" id="city" name="city" class="form-control" value="${regandpay.city}" class="input-xlarge">
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
              		<input type="text" id="zipcode" name="zipcode" class="form-control" value="${regandpay.zipcode}" class="input-xlarge">
    			</div>
  		  	</div>
	    	<div class="form-group">
        		<div class="col-md-6">
            		<div id="errorMsg" class="alert alert-danger" ></div>
            	</div>	
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
              <button type="submit" id="regSubmit" class="btn btn-primary" name="reg">Register User</button>
              <button type="submit" id="regandpaySubmit" class="btn btn-primary" name="regandpay">Register And Pay</button>
            </div>
        </div>
  </form>  
 </div>
</div>
</body>
</html>