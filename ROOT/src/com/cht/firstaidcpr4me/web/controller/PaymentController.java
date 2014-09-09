package com.cht.firstaidcpr4me.web.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cht.firstaidcpr4me.core.domain.objects.AuthorizeConf;
import com.cht.firstaidcpr4me.core.domain.objects.LoginPayment;
import com.cht.firstaidcpr4me.core.domain.services.LoginPaymentService;
import com.cht.firstaidcpr4me.web.domain.InitPayment;
import com.cht.firstaidcpr4me.web.domain.User;



@Controller
@RequestMapping("/payment")
public class PaymentController {

	
	@Autowired
	private LoginPaymentService loginPaymentService;

	@Autowired
	private User user;

	@Autowired
	private AuthorizeConf authorizeConf;
	
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getPaymentForm(@RequestParam(value="courses", required=true) String courses) {
		ModelAndView mv = new ModelAndView("paymentForm.jsp");
		Map<Long, Double> mapCrs = new HashMap<Long, Double>();
		Double totalAmount = new Double(0.0);
		String[] cs = courses.split(";");
		for(int i = 0; i < cs.length; i++){
			String[] cr = cs[i].split(":");
			Long crId = new Long(cr[0]);
			Double crPrice = new Double(cr[1]);
			totalAmount += crPrice;
			mapCrs.put(crId, crPrice);
		}

		user = new User();
		user.setId(new Long(5));
		LoginPayment loginPayment = loginPaymentService.saveLoginPayment(user, mapCrs);
		mv.addObject("invoiceNum", loginPayment.getId().toString());
		mv.addObject("amount", totalAmount.toString());
		mv.addObject("authorizeConf", authorizeConf);
		InitPayment ip = new InitPayment(authorizeConf.getApiLoginId(), authorizeConf.getTransactionKey(), totalAmount.toString());
		mv.addObject("initPayment", ip);
		return mv;
	}
	
	
	
}
