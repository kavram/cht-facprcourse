function processSubmitPayment(){
	var data = {"amount": $("#amount").val(), "firstname": $("#firstname").val(), "lastname": $("#lastname").val(), "email": $("#email").val(),
			"cardnumber": $("#cardnumber").val(), "exp_month": $("#expiry_month").val(),
			"exp_year": $("#expiry_year").val(), "cvv": $("#cvv_confirm").val(), 
			"address": $("#address").val(), "city": $("#city").val(),
			"state": $("#state").val(), "zip": $("#zip").val()};
	var str = JSON.stringify(data);
	$.ajax({
		type: "GET",
		url: "/ajax/payment/submit",
		processData: false,
		data: "params=" + str,
		success: function(data, status, jqXHR){
			log("submit callback");
		},
		dataType: "json"
	});
			
};
