<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<html>
<jsp:include page="header.jsp" >
  <jsp:param name="menu1" value="" />
  <jsp:param name="menu2" value="" />
  <jsp:param name="menu3" value="active" />
  <jsp:param name="menu4" value="" />
  <jsp:param name="menu5" value="" />
  <jsp:param name="menu6" value="" />
  <jsp:param name="menu7" value="" />
</jsp:include>
<script>
$(document).ready( function(){
   	$("a[data-target=#myVideo]").click(function(e) {
       	e.preventDefault();
       	var url = $(this).attr('href');
       	$(".modal-body").html('<iframe width="860px" height="480px" frameborder="0" scrolling="no" allowtransparency="true" src="'+url+'"></iframe><br>This is the new stuff!!');
      });
   });
</script>
<!-- This is the video player -->
	<div class="modal fade" id="myVideo">
		<div class="modal-dialog modal-lg">
		    <div class="modal-content">
		      <div class="modal-header danger">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title"><center>CPR Video - Learning to Tie Your Shoe Lace</center></h4>
		      </div>
		      <div class="modal-body">
		      	this is where the iFrame s/b placed	      
		      </div>
		    </div>
		</div>
	</div>
<!-- End video player -->
<div class="container">
<br>
yada yada ... describe how to access content ... maybe a link to an introductory
video and/or manual and how to info
<br><br>
blah blah blah<br><br>
<div class="panel-group" id="accordion">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
          CPR Basic Certification - Adult Only
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse">
      <div class="panel-body">
      	<div class="row-fluid">
        	<div class="span8">
        	Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
        	</div>
        	<div class="span4" align=left>
        		<a href="#myVideo"  data-toggle="modal" >This is Video Number 1 in a series of 4</a><br>
        		<a href="#">Video Link 2</a><br>
        		<a href="#">Video Link 3</a>
        	</div>
        </div>	
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
          First Aid Certification
        </a>
      </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse in">
      <div class="panel-body">
        <div class="row-fluid">
        	<div class="span9">
        	Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.<br>
        	<span>
        	<a data-target="#myVideo" data-toggle="modal" href="//www.youtube.com/embed/Pe7-zwQiZBc"><img src="images/ipad1.png" border=0></a>
        	<a href="#myVideo" data-toggle="modal" ><img src="images/ipad1.png" border=0></a>
        	</span>
        	</div>
        	<div class="span3" align=left>
        		<a href="index.jsp">
                	<img src="images/startexam.png" height="80px" border=0>
                </a>	  		
        	</div>
        </div>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
          CPR and First Aid Certification
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse">
      <div class="panel-body">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapsethree">
          Healthcare Basic Life Support (BLS)
        </a>
      </h4>
    </div>
    <div id="collapsethree" class="panel-collapse collapse">
      <div class="panel-body">
        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
      </div>
    </div>
  </div>
</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>