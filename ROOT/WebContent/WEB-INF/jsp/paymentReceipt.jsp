<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<!-- saved from url=(0033)http://www.firstaidcprcourse.com/ -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta http-equiv="Content-Style-Type" content="text/css">

<title>Register</title>
<!-- bootstrap 2.3.0 -->
    <!-- style sheets bootstrap 2.3.0 -->
    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/bootstrap-responsive.css" rel="stylesheet">
	<link href="/css/site.css" rel="stylesheet">
    <!-- style sheets End -->
    <!----======================== Java scripts =============================----->
    <!-- jQuery (latest version) -->
    <script src="/js/jquery-1.8.2.js"></script>
	<script src="/js/jquery-ui-1.8.24.js"></script>
	<script src="/js/jquery.bxslider.min.js"></script>
    <!-- bootstrap 2.3.0 -->
    <script type="text/javascript" src="/js/bootstrap.js"></script>
    <script type="text/javascript" src="/js/script.js"></script>
    <!----======================== End =====================================----->
</head>
<body>
<noscript><meta http-equiv="refresh" content="0;url=http://localhost/receipt"></noscript>
<!-- Header -->
    <div class="container">
        <div class="row-fluid">
            <div class="span4">
                <a href="/home">
                        <img src="/images/logo-cross-fa4.png" border="0">
                </a>
            </div>

        </div> 
    </div>   
	<div style="background-image: url(/images/header_bg.jpg)">
	<div class="container">
<body>
   <h1>Your Receipt Page</h1></br>
   <c:if test="${paymentResponse.responseCode != null}">
   	${paymentResponse.responseCode}
   </c:if>
   
     <h2>Success!</h2>
     <h3>Your transaction ID:</h3>
     <div>${paymentResponse.transactionId}</div>
     <h2>Error!</h2>
     <h3>${paymentResponse.responseReasonText}</h3>
       <table>
         <tr>
           <td>response code</td>
           <td>${paymentResponse.responseCode}</td>
         </tr>
             <tr>
           <td>response reason code</td>
           <td>${paymentResponse.responseReasonCode}</td>
         </tr>
     </table>
  </body>	
  </div>
</div>
<!-- Header End -->


<!-- Footer Start -->
<div class="container">
	<br>
</div>
<!-- Footer End --> 

</body></html>