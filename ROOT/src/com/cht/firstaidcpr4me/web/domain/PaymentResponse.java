package com.cht.firstaidcpr4me.web.domain;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import net.authorize.ResponseField;
import net.authorize.sim.Result;
import net.authorize.util.StringUtils;

@Component
@Scope(value="session", proxyMode=ScopedProxyMode.TARGET_CLASS)
public class PaymentResponse {
	private Integer responseCode;
	private Integer responseReasonCode;
	private String responseReasonText;
	private Boolean isApproved;
	private String transactionId;
	
	public PaymentResponse(){
	}

	public void init(final Result result){
		responseCode = result.getResponseCode().getCode();
		responseReasonCode = result.getReasonResponseCode().getResponseReasonCode();
		responseReasonText = StringUtils.sanitizeString(result.getResponseMap().get(ResponseField.RESPONSE_REASON_TEXT.getFieldName()));
		isApproved = result.isApproved();
		transactionId = result.getResponseMap().get(ResponseField.TRANSACTION_ID.getFieldName());
	}
	
	public Integer getResponseCode(){
		return responseCode;
	}
	
	public Integer getResponseReasonCode(){
		return responseReasonCode;
	}
	
	public String getResponseReasonText(){
		return responseReasonText;
	}
	
	public Boolean getIsApproved(){
		return isApproved;
	}

	public String getTransactionId(){
		return transactionId;
	}
}
