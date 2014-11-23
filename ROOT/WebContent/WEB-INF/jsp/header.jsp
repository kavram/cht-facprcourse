<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>First Aid Prototype</title>
	<script type="text/javascript" >
	<c:if test="${user.email == null}">
		$(document).ready(function() {
	    	$('#openBtn').click(function(){
	    		$('#myLogin').modal({show:true});
	    	});
	    	$('#openBtn').click(function(){
	    		$('#myRegister').modal({show:true});
	    	});
	    	$('#forgotPassButton').click(function(){
	    		$('#loginModal').modal('hide');
	    		$('#forgotPassModal').modal({show:true});
	    	});
	    	$('#loginButton').click(function(){
	    		$('#forgotPassModal').modal('hide');
	    		$('#loginModal').modal({show:true});
	    	});
	    	$('#regLogin').click(function(){
	    		$('#loginModal').modal('hide');
	    		$('#registerModal').modal({show:true});
	    	});
	    	
		});
	 </c:if>   
	 <c:if test="${user.email != null}">
	 	$(document).ready(function(){
	 		$('#logouta').click(function(e){
	 			e.preventDefault();	
	 			processLogout();
	 		});
	 	});
	 </c:if>
	 	$(document).ready(function(){
	 		$('#myDemo').on('hidden.bs.modal', function(e){
	 			flowplayer().stop();
	 		});
	 	});
	 
    </script>

<!-- Header -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-sm-8">
                <a href="/">
                        <img src="${domain}/images/logo-cross-fa3.png" border=0>
                </a>
            </div>
            <div class="col-lg-4 col-sm-4" align=right style="background-image:url(${domain}/images/header-bg.png); background-repeat: no-repeat; background-position: right; color:#ffffff;">
					<c:if test="${user.email == null}">
						<a href="#registerModal"  data-toggle="modal" data-target="#registerModal" style="color:#ffffff;"> Not a Member? Join Now For FREE </a> | 
						<a href="#loginModal"  data-toggle="modal" data-target="#loginModal" style="color:#ffffff;">Login</a>
					</c:if>
					<c:if test="${user.email != null}">
	 					Welcome, ${user.firstName} ${user.lastName} | <a id="logouta" href="" >Log out</a>
	 				</c:if>
				<br>
				<span class="glyphicon glyphicon-phone" style="margin-right: 5px;"></span>1-877-295-0933 <br>          
				Mon - Fri, 9am - 8pm EST <br>  
            </div>
        </div> 
    </div>   
<!-- Header End -->
<!-- Popups -->
	<div class="modal fade" id="regConfModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title"><center>Site Login</center></h4>
		      </div>
		      <div class="modal-body">
					<center>
						Please confirm your registration by clicking on the &quot;Activate Account&quot; link in
						the "Please Verify Your FirstaidCPRCourse.com Account Email Address" email.
		        	</center>		      
		          <form id="f" method="post" class="form-horizontal">
	                  <div class="form-group">
	                        <div class="col-md-5 col-md-offset-3">
	                            <button type="submit" id="loginSubmit" class="btn btn-default">Login </button>
	                            <button class="btn btn-default" id="forgotPassButton" data-dismiss="modal" type="button">Forgot Password</button>
	                        </div>
	                 </div>
	              </form>
	            </div>  
		     </div>
		   </div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->


	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title"><center>Site Login</center></h4>
		      </div>
		      <div class="modal-body">
					<center>
		      			Thank you for your important decision to get trained in the potentially life-saving 
		      			skills of CPR, First Aid, or Basic Life Support with FirstAidCPRCourse.com.<br><br>
						Please use your email address and designated password to login below. 
						If you forgot your password, please select the button below labeled &quot;Forgot Password&quot; to get started.
		        		<br><br>
		        	<a id="regLogin"  href="#myRegister"  data-toggle="modal" style="color:#000000;"> Not a Member? Click Here To Join Now For FREE </a> 
		        	<br><br><br>
		        	</center>		      
		          <form id="loginForm" method="post" class="form-horizontal">
  					  <div class="form-group">
	                        <label class="col-md-3 control-label">Email Address</label>
	                        <div class="col-md-6">
	                            <input type="text" class="form-control" name="email" id="email" required />
	                        </div>
	                  </div>
	                  <div class="form-group">
	                        <label class="col-md-3 control-label">Password</label>
	                        <div class="col-md-6">
	                            <input type="password" class="form-control" name="password" id="password" />
	                        </div>
	                  </div>
	                  <div class="form-group">
        					<div class="col-md-9 col-md-offset-3">
            					<div id="loginMessages"></div>
            					<div id="loginAjaxMessages"> </div>
        					</div>
    				  </div>
	                  <div class="form-group">
	                        <div class="col-md-5 col-md-offset-3">
	                            <button type="submit" id="loginSubmit" class="btn btn-default">Login </button>
	                            <button class="btn btn-default" id="forgotPassButton" data-dismiss="modal" type="button">Forgot Password</button>
	                        </div>
	                 </div>
	              </form>
	            </div>  
	              <center>By clicking <b>Login</b>, you agree to our <a href="#">Terms </a>
	            	and <br>that you have read our <a href="#">Privacy Policy </a>
				  </center>
		     </div>
		   </div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	
	<div class="modal fade" id="forgotPassModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title"><center>Forgot Password</center></h4>
		      </div>
		      <div class="modal-body">
		          <form id="forgotPassForm" method="post" class="form-horizontal">
  					  <div class="form-group">
	                        <label class="col-md-3 control-label">Email Address</label>
	                        <div class="col-md-6">
	                            <input type="text" class="form-control" name="email" id="email" required />
	                        </div>
	                  </div>
	                  <div class="form-group">
        					<div class="col-md-9 col-md-offset-3">
            					<div id="forgotPassMessages"></div>
            					<div id="forgotPassAjaxMessages"> </div>
        					</div>
    				  </div>
	                  <div class="form-group">
	                        <div class="col-md-5 col-md-offset-3">
	                            <button type="submit" id="forgotPassSubmit" class="btn btn-default">Submit Email</button>
	                            <button class="btn btn-default" id="loginButton" data-dismiss="modal" type="button">Login</button>
	                        </div>
	                 </div>
	              </form>
	            </div>  
		     </div>
		   </div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->


	
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		    <div id="registerModalContent" class="modal-content">
		    	<div class="modal-header">
		        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        	<h4 class="modal-title"><center>Site Registration</center></h4>
		      	</div>
		    	<div class="modal-body">
		    		<center>
		    			Welcome to FirstAidCPRCourse.com registration.<br><br>
						Complete the registeration information below and click &quot;Register&quot;. You will then be sent
						an email to confirm your email address. Once that is complete, you can
						begin reviewing your training courses available and select one or more to entroll in.<br><br>
						<b>Note:  Your information is never shared with third parties.<br><br></b>
		    		</center>
		    	
		    		<form id="registerForm" method="post" class="form-horizontal">
	              	  	<div class="form-group">
	                        <label class="col-md-3 control-label">First Name</label>
	                        <div class="col-md-6">
	                            <input type="text" class="form-control" name="firstname" id="firstname" maxlength="15"/>
	                        </div>
	                  	</div>
	                  	<div class="form-group">
	                        <label class="col-md-3 control-label">Last Name</label>
	                        <div class="col-md-6">
	                            <input type="text" class="form-control" name="lastname" id="lastname" maxlength="15"/>
	                        </div>
	                 	 </div>
	                 	 <div class="form-group">
	                        <label class="col-md-3 control-label">Email Address</label>
	                        <div class="col-md-6">
	                            <input type="text" class="form-control" name="email" id="email" maxlength="50"/>
	                        </div>
	                 	 </div>
	                  	 <div class="form-group">
	                        <label class="col-md-3 control-label">Password</label>
	                        <div class="col-md-6">
	                            <input type="password" class="form-control" name="password" id="password" maxlength="10"/>
	                        </div>
	                  	 </div>
	                  	 <div class="form-group">
	                        <label class="col-md-3 control-label">Confirm Password</label>
	                        <div class="col-md-6">
	                            <input type="password" class="form-control" name="confirmpassword" id="confirmpassword" maxlength="10"/>
	                        </div>
	                  	 </div>

	                  	 <div class="form-group">
        					<div class="col-md-9 col-md-offset-3">
            					<div id="registerMessages"></div>
            					<div id="registerAjaxMessages"> </div>
        					</div>
    				    </div>
	                  	<div class="form-group">
	                  		<div class="col-md-5 col-md-offset-3">
								<button class="btn btn-default" id="registerSubmit" type="submit">Register</button>
								<button class="btn btn-default" data-dismiss="modal" type="button">Close</button>
							</div>
				  		</div> 
					</form>	
				</div>	
					<center>By clicking <b>Register</b>, you agree to our <a href="#">Terms </a>
	            	and <br>that you have read our <a href="#">Privacy Policy </a></center>	
	 			</div><!--  </form>-->
	 		</div>
	</div>
	
	<!-- These are the modals for the footer links -->
	<div class="modal fade" id="myTerms">
		<div class="modal-dialog">
		    <div class="modal-content">
		    	<div class="modal-header">
		        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        	<h4 class="modal-title"><center>Web Site Terms Of Use</center></h4>
		      	</div>
		    	<div class="modal-body">
					<h4>FirstAidCPRCourse.com Disclaimer/Policy</h4>
					<p>FirstAidCprCourse.Com's official registered domain name is "www.FirstAidCprCourse.com", and the organizations official United States web domain address is "http://www.FirstAidCPRCourse.com"
						While the information and recommendations contained in FirstAidCprCourse.Com's website have been compiled from sources believed to be reliable, FirstAidCprCourse.Com makes no guarantee as to, and assumes no responsibility for, the correctness, sufficiency, or completeness of such information or recommendations or additional safety measures may be required under particular circumstances.
						The FirstAidCprCourse.Com logo is a registered trademark. Permission to use FirstAidCprCourse.Com's logo for World Wide Web display must be obtained, in writing from FirstAidCPRCourse.com prior to use. Contact FirstAidCprCourse.Com by sending us an e-mail using the web email address: info@FirstAidCprCourse.com</p> 

					<p>Links made from the FirstAidCprCourse.Com website to another domain on the Web shall not represent an endorsement by FirstAidCprCourse.Com, its members directors, management, divisions, or staff.</p>
					<p>Information contained within the FirstAidCprCourse.Com website is the property of FirstAidCprCourse.Com. Permission for re-publication in any form must be obtained in writing from: FirstAidCprCourse.Com. See exceptions below.</p>
					<p>Exceptions to being granted  copyright permission shall include information re-distributed for educational purposes (and must display the credit line: Permission to reprint granted by FirstAidCprCourse.Com, a membership organization dedicated to protecting life and promoting health.) or as expressly authorized along with the information presented.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="mySecurity">
		<div class="modal-dialog">
		    <div class="modal-content">
		    	<div class="modal-header">
		        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        	<h4 class="modal-title"><center>FirstAidCPRCourse.com IT Security Framework</center></h4>
		      	</div>
		    	<div class="modal-body">
					<p>
						This framework has several tools to help protect public information and information technology systems, including:</p>
						<ul>
							<li>Information security management directives to help determine objective for protecting information and information technology systems;</li>
							<li>Policy advisory guides on important information security issues;</li>
							<li>Guidelines and processes to help prepare for and recover from information technology disaster recovery situations;</li>
							<li>Technical security standards;</li>
							<li>Guidelines covering basic information about policies, important processes and tips for ensuring the security of information technology systems;</li>
							<li>A process to identify information technology security risks and develop corporate strategies to manage those risks.</li>
						</ul>
					<p>For more detail about the Information Security Management framework and its directives, please contact security@firstaidcourse.com.
					</p>
				</div>
			</div>
		</div>
	</div>		
	<div class="modal fade" id="myPrivacy">
		<div class="modal-dialog">
		    <div class="modal-content">
		    	<div class="modal-header">
		        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        	<h4 class="modal-title"><center>Privacy Policy</center></h4>
		      	</div>
		    	<div class="modal-body">
					<h4>Technological & Privacy</h4>
					<p>"Cookies" are small pieces of information that are stored by your browser on your computer's hard drive. They allow us to better analyze our site traffic patterns and to provide improved content, advertisements, products and services. They also allow us to refine and enhance visitor registration and to add personalization. Most Web browsers automatically accept cookies, but you can usually change your browser to prevent that if you would rather not store the information for future use. If you decide not to accept cookies, you may encounter a number of difficulties using FirstAidCprCourse.Com.
					   Third party vendors, including Google, will be displaying our ads to you on other sites across the internet because you have visited www.FirstAidCprCourse.Com. These third party vendors, including Google, use cookies to serve ads based on your prior visits to www.FirstAidCprCourse.Com. 
					</p>
					<h4>Personal Information Privacy</h4>
					<p>Your personal information is used solely by FirstAidCprCourse.Com to allow us to better serve you. We will not sell, rent, or violate  your personal information to any third parties. You may unsubscribe from our weekly e-mail refresher videos at any time by clicking the unsubscribe link at the bottom of the e-mail.</p>
					<h4>Medical & Instructional Source Authority</h4>	
					<p>FirstAidCprCourse.Com Programs adhere to the most up-to-date medical and educational guidelines published by nationally recognized authorities. FirstAidCprCourse.Com utilizes the following source authorities:</p>
					<uL>
						<li>National Highway Traffic Safety Administration, U.S. Department of Transportation.</li> 
						<li>JAMA</li>
						<li>2010 American Heart Association Guidelines for CPR and Emergency Cardiovascular Care; 2010; Circulation; 112 (supplement IV).</li>
						<li>2010 International Consensus on Cardiopulmonary Resuscitation and Emergency Cardiovascular Care Science with Treatment Recommendations, International Liaison Committee on Resuscitation, Resuscitation, Nov./Dec. 2010, Vol. 67, Nos. 2-3.</li>
					</uL>
					<h4>Development of Medical Knowledge</h4>
					<p>The process of medical knowledge is gained through research and the practice of medicine by licensed physicians, surgeons, paramedics, nurses and other health care professionals. Knowledge gained through medical practice and research is evaluated and debated in formal and informal education settings, peer-reviewed medical journals, consensus conferences, seminars, and through other similar processes. Knowledge is investigated both privately and publicly, with regard to effectiveness, safety, ethical character and cost-effectiveness. Knowledge and medical practices that survive the rigors of debate and consensus-building and meet with widespread agreement among experts eventually become generally accepted within the medical community. Those concepts achieving general medical acceptance are typically published in texts and journals to be relied upon by practicing health care professionals. Academic universities, vocational schools, and other teaming organizations like FirstAidCprCourse.Com develop program content based upon published medical literature and tailor training materials to meet the needs of the target audience.</p>
					<h4>Instructional Program Acceptance</h4>
					<p>ILCOR and the ECC publish national consensus guidelines for CPR and First Aid that reputable educators like FirstAidCprCourse.com to follow. It is important to understand that there is no medical authority nor a single organization whom regulates or authorizes CPR and First Aid training programs. Citing any company or corporation in statute or regulation often has the unintended consequence of discouraging enterprising approaches to first aid and CPR training, reducing the number of qualified first aid and CPR training programs available to serve the public. This practice also places government in the position of sanctioning particular programs thus discouraging or eliminating competition. Governments acting in this capacity are put at risk without any supporting public policy rationale.</p>
					<h4>FirstAidCprCourse.Com Distinctives</h4>
					<p>FirstAidCprCourse.Com is committed to providing instructional programs, which are participant-centered rather than instructor specific. Using an instructional approach which differs from routine academic education, FirstAidCprCourse.Com's overall strategy for skill development is simplification: regular review, repetition in a relaxed positive environment, self-discovery, cooperative learning, and joint assessment of knowledge and skills are emphasized. Successful completion of FirstAidCprCourse.Com training is based upon reasonable performance of emergency care skills rather than perfection. Flexibility is founded upon the fact that real life emergencies are unexpected and dynamic. Requiring rigidity and 100 percent accuracy in skill performance may contribute unnecessary barriers to taking action. FirstAidCprCourse.Com believes the instructional model provides participants with the tools necessary to act without fear of imperfection. NOTE: FirstAidCprCourse.Com online recertification in CPR for Healthcare Providers does not require hands on performance to prove proficiency for continued education and recertification.
						FirstAidCprCourse.Com believes initial first aid training must include manikin practice and skill evaluation. FirstAidCprCourse.Com trains facilitators that allow participants to perform manikin practice and have their skills evaluated. Trained facilitators are entered into the registry and issued a revocable certificate authorizing these individuals to conduct skill evaluations for the FirstAidCprCourse.Com programs. FirstAidCprCourse.Com is committed to delivering exemplary first aid and CPR training. In furtherance of this goal, the company promotes a standardized instructional system designed in concert with professionals. The program development process draws upon the talent and experience of recognized experts In the field, outside consultants, and diligent medical research to ensure that program content and medical treatment guidelines used in FirstAidCprCourse.Com programs are safe and meet or exceed current standards and guidelines.</p>
					
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myRefund">
		<div class="modal-dialog">
		    <div class="modal-content">
		    	<div class="modal-header">
		        	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        	<h4 class="modal-title"><center>Refund Policy</center></h4>
		      	</div>
		    	<div class="modal-body">
					<p>If you are not 100% satisfied with your purchase, within 30 days from the purchase date, we will fully refund the cost of your order to your Credit Card. Please all 6 to 10 days to complete the refund process.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myDemo">
		<div class="modal-dialog modal-lg">
		    <div class="modal-content">
		    	<div class="modal-header">
		    		<h4 class="modal-title"><center>CPR Demo Video</center></h4>
		    	</div>
		    	<div class="modal-body">
		    		<br>
					<div class="flowplayer" data-rtmp="rtmp://rtmp.flowplayer.org/cfx/st/" data-ratio="0.5625" data-qualities="216p,360p,720p,1080p" data-default-quality="360p">
  						<video>
    						<source type="application/x-mpegurl" src="http://drive.flowplayer.org/196963/32547-CPRIntro.m3u8">
    						<source type="video/webm" src="http://drive.flowplayer.org/196963/32547-CPRIntro.webm">
    						<source type="video/mp4" src="http://drive.flowplayer.org/196963/32547-CPRIntro.mp4">
    						<source type="video/flash" src="mp4:196963/32547-CPRIntro.mp4">
  						</video>
					</div>
					<br>
					<br>
					<button type="button" class="close" data-dismiss="modal">Close Video</button>
					<br>
					<br>
				</div>
		    </div>
		</div>
	</div>
	
	