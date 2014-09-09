package com.cht.firstaidcpr4me.web.controller;

import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import net.authorize.sim.Result;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cht.firstaidcpr4me.core.domain.objects.AuthorizeConf;
import com.cht.firstaidcpr4me.core.domain.objects.LoginPayment;
import com.cht.firstaidcpr4me.core.domain.services.LoginPaymentService;
import com.cht.firstaidcpr4me.web.domain.CoursesPayment;
import com.cht.firstaidcpr4me.web.domain.PaymentResponse;
import com.cht.firstaidcpr4me.web.domain.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
@RequestMapping("/payment_result")
public class RelayPaymentController {

	@Autowired
	PaymentResponse paymentResponse;
	
	@Autowired
	private LoginPaymentService lpService;
	
	@Autowired
	private AuthorizeConf authorizeConf;

	
	@RequestMapping(method = RequestMethod.POST)
	public String getRelayPayment(Model model, HttpServletRequest request, HttpServletResponse response) {
		Result res = Result.createResult(authorizeConf.getApiLoginId(), "", request.getParameterMap());
		Map<String, String> map = res.getResponseMap();
		Set<Entry<String, String>> set = map.entrySet();
		for(Entry<String, String> entr : set){
			String key = entr.getKey();
			String value = entr.getValue();
			value.toString();
		}
		paymentResponse.init(res);		
		LoginPayment lp = null;
		try {
			lp = lpService.getLoginPaymentById(new Long(res.getResponseMap().get("x_invoice_num")));
			lp.getLoginId();
			if(res.isApproved()){
				lp.setAuthorizationCode(res.getResponseMap().get("x_auth_code"));
				lp.setTransactionId(res.getResponseMap().get("x_trans_id"));
				lp.setPaymentStatus(LoginPaymentService.TRANSACTION_STATUS_APPROVED);
				lpService.updateLoginPayment(lp);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "relayResponse.jsp";
	}

	
}
