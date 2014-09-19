	<div style="background-image: url(images/header_bg.jpg)">
	<div class="container">
		<ul class="nav nav-pills">
    		<li class='<%= request.getParameter("menu1")%>'><a href=/>Home</a></li>
    		<li class='<%= request.getParameter("menu2")%>'><a href=/certify>Pricing</a></li>
    		<li class='<%= request.getParameter("menu3")%>'><a href=/courses>Training Courses</a></li>
    		<li class='<%= request.getParameter("menu4")%>'><a href=/faq>FAQ's</a></li>
    		<li><a href="#myRegister" data-toggle="modal" >Register</a></li>
    		<li><a href="#myLogin" data-toggle="modal" >Log In</a></li>
    		<li class='<%= request.getParameter("menu5")%>'><a href=/contact>Contact Us</a></li>
		</ul>
	</div>
	</div>
