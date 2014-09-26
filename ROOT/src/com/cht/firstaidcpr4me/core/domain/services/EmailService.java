package com.cht.firstaidcpr4me.core.domain.services;

import java.util.Map;

import org.apache.velocity.exception.MethodInvocationException;
import org.apache.velocity.exception.ParseErrorException;
import org.apache.velocity.exception.ResourceNotFoundException;

public interface EmailService {

	
	public void sendEmail(String templateName, String toAddress, Map<String, Object> params);
	
}
