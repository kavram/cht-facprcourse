package com.cht.firstaidcpr4me.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cht.firstaidcpr4me.web.domain.CoursesPayment;
import com.cht.firstaidcpr4me.web.domain.PaymentResponse;


@Controller
@RequestMapping("/receipt")
@Scope("request")
public class ReceiptController {

	
	@Autowired
	PaymentResponse paymentResponse;

	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getReceipt(){
		ModelAndView mv = new ModelAndView("paymentReceipt.jsp");
		mv.addObject("paymentResponse", paymentResponse);
		String txt = paymentResponse.getResponseReasonText();
		Integer respCode = paymentResponse.getResponseCode();
		return mv;
	}

}
