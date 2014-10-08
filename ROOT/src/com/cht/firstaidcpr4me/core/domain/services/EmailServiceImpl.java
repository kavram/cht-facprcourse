package com.cht.firstaidcpr4me.core.domain.services;

import java.io.StringWriter;
import java.io.Writer;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.mail.internet.MimeMessage;

import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.exception.MethodInvocationException;
import org.apache.velocity.exception.ParseErrorException;
import org.apache.velocity.exception.ResourceNotFoundException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

public class EmailServiceImpl implements EmailService {
	private static final Logger log = LoggerFactory.getLogger(EmailServiceImpl.class);
	
	@Autowired
	private VelocityEngine velocityEngine; 
	
	@Autowired
	private JavaMailSender mailSender;
	
	private String siteDomain;

	private String fromAddress;
	
	
	@Override
	public void sendEmail(final String templateName, final String toAddress, final Map<String, Object> model)  {
		MimeMessage message = mailSender.createMimeMessage();
		
    	VelocityContext vc = new VelocityContext();
    	vc.put("siteDomain", siteDomain);
    	Set<Entry<String, Object>> set = model.entrySet();
    	for(Entry<String, Object> entr : set){
    		vc.put(entr.getKey(), entr.getValue());
    	}
    	Writer writer = new StringWriter();
    	try {
    		MimeMessageHelper helper = new MimeMessageHelper(message, true);
			velocityEngine.mergeTemplate(templateName, "UTF-8", vc, writer);
	        helper.setTo(toAddress);
	        helper.setFrom(fromAddress); 
	        helper.setSubject((String)vc.get("subject"));
	        helper.setText(writer.toString(), true);
	        mailSender.send(message);		
		}catch (MailException e) {
			log.error(e.getMessage(), e);
		} catch (ResourceNotFoundException e) {
			log.error(e.getMessage(), e);
		} catch (ParseErrorException e) {
			log.error(e.getMessage(), e);
		} catch (MethodInvocationException e) {
			log.error(e.getMessage(), e);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}


	public String getSiteDomain() {
		return siteDomain;
	}


	public void setSiteDomain(String siteDomain) {
		this.siteDomain = siteDomain;
	}


	public String getFromAddress() {
		return fromAddress;
	}


	public void setFromAddress(String fromAddress) {
		this.fromAddress = fromAddress;
	}

}
