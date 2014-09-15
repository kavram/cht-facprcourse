<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<html>
<jsp:include page="header.jsp" >
  <jsp:param name="menu1" value="" />
  <jsp:param name="menu2" value="" />
  <jsp:param name="menu3" value="" />
  <jsp:param name="menu4" value="" />
  <jsp:param name="menu5" value="active" />
  <jsp:param name="menu6" value="" />
  <jsp:param name="menu7" value="" />
</jsp:include>
<script>
$(document).ready( function(){
	$('#alert1').hide();
	$('#alert2').hide();
	$('#alert3').hide();
});
</script>
        <div class="container">
            <div class="row-fluid">
                <div class="span4">
                    <div class="left">
                        <h1>Contact Info</h1>
                        <div class="right_box">
                            <p>
                                <strong>Corporate Information </strong>
                            </p>
                            <p>Companion Medical Supply is an organization with offices in California and Hawaii. </p>
                            <p><strong>Companion Medical Supplies </strong><br>
                            2059 Camden Ave. #323<br>
                            San Jose, CA 95124   USA</p>
                            <p>Toll Free: (877) 295-0933</p>
                            <p>Telephone: <br />
                            Northern California (415) 503-9779 <br />
                            Southern California (858) 356-5092 <br />
                            New York (917) 521-5275  <br />
                            Vancouver Canada (604) 330-0099
                            </p>
                            <p>FAX: (415) 924-9165</p>
                            <p><a href="mailto:info@firstaidcprcourse.com">E-mail:info@firstaidcprcourse.com</a></p>
                            <br />
                            <div class="clearfix"></div>
                        </div>
                        <center><img src="images/shadow.png" /></center>
                    </div>
                    <!-----/.left end ----->
                </div>
                <!-----/.right end ----->

                <div class="span7 pull-right">
                	<h1>Message Us</h1>
					<div id="alert1" class="alert alert-success"><strong><span class="glyphicon glyphicon-send"></span> Success! Message sent. (If form ok!)</strong></div>	  
    				<div id="alert2" class="alert alert-danger"><span class="glyphicon glyphicon-alert"></span><strong> Error! Please check the inputs. (If form error!)</strong></div>
    				<div id="alert3" class="alert alert-warning"><strong><span class="glyphicon glyphicon-ok form-control-feedback"></span> Required Field</strong></div>
                	<div>
					  <form role="form" action="" method="post" >
					    <div class="col-lg-8">
					      <div class="form-group">
					        <label for="InputName">Your Name</label>
					        <div class="input-group">
					          <input type="text" class="form-control" name="InputName" id="InputName" placeholder="Enter Name" required>
					          <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span>
					        </div>
					      </div>
					      <div class="form-group">
					        <label for="InputEmail">Your Email</label>
					        <div class="input-group">
					          <input type="email" class="form-control" id="InputEmail" name="InputEmail" placeholder="Enter Email" required  >
					          <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span>
					        </div>
					      </div>
					      <div class="form-group">
					        <label for="InputMessage">Message</label>
					        <div class="input-group">
					          <textarea name="InputMessage" id="InputMessage" class="form-control" rows="5" required></textarea>
					          <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span>
					        </div>
					      </div>
					      <div class="form-group">
					        <label for="InputReal">What is 4+3? (Simple Spam Checker)</label>
					        <div class="input-group">
					          <input type="text" class="form-control" name="InputReal" id="InputReal" required>
					          <span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span></div>
					      </div>
					      <input type="submit" name="submit" id="submit" value="Submit" class="btn btn-info pull-right">
					    </div>
					  </form>
                    <!------/.right_box_mar-------->
					</div>
                </div>
                <!------------------------/. left side------------>
                <div class="clearfix"></div>
            </div>
            <!------row-f------->
            <br />

            <div class="clearfix"></div>
        </div>
        <!-------/.container---------->

<%@ include file="footer.jsp" %>
</body>
</html>