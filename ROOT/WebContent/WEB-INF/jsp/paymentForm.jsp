<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<div>Registration Page</div>
<form name='secure_redirect_form' id='secure_redirect_form_id' 
action='${authorizeConf.postUrl}' method='post'>
     <label>CreditCardNumber</label>
     <input type='text' class='text' name='x_card_num' size='15' />
     <label>Exp.</label>
     <input type='text' class='text' name='x_exp_date' size='4' />
     <label>Amount</label>
     <input type='text' class='text' name='x_amount' size='9' readonly value='${amount}' />
     <input type='hidden' name='x_invoice_num' value='${invoiceNum}' />
     <input type='hidden' name='x_relay_url' value='${authorizeConf.relayResponseUrl}' />
     <input type='hidden' name='x_login' value='${authorizeConf.apiLoginId}' />
     <input type='hidden' name='x_fp_sequence' value='${initPayment.fpSequence}' />
     <input type='hidden' name='x_fp_timestamp' value='${initPayment.fpTimestamp}' />
     <input type='hidden' name='x_fp_hash' value='${initPayment.fpHash}' />
     <input type='hidden' name='x_version' value='${authorizeConf.version}' />
     <input type='hidden' name='x_method' value='${authorizeConf.method}' />
     <input type='hidden' name='x_type' value='${authorizeConf.type}' />
     <input type='hidden' name='x_amount' value='${amount}' />
     <input type='hidden' name='x_test_request' value='${authorizeConf.testRequest}' />
     <input type='hidden' name='notes' value='${authorizeConf.notes}' />
     <input type='submit' name='buy_button' value='BUY' />
</form>	</div>
	</div>
<!-- Header End -->


<!-- Footer Start -->
<div class="container">
	<br>
</div>
<!-- Footer End --> 

</body></html>