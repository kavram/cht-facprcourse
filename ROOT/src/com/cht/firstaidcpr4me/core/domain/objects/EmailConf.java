package com.cht.firstaidcpr4me.core.domain.objects;

public class EmailConf {

	private String smtpHost;
	private String siteDomain;
	private String fromAddress;
	private String contactMessageRecepient;
	
	
	public EmailConf(){
		
	}
	
	public String getSiteDomain() {
		return siteDomain;
	}
	public void setSiteDomain(String siteDomain) {
		this.siteDomain = siteDomain;
	}
	public String getSmtpHost() {
		return smtpHost;
	}
	public void setSmtpHost(String smtpHost) {
		this.smtpHost = smtpHost;
	}

	public String getFromAddress() {
		return fromAddress;
	}

	public void setFromAddress(String fromAddress) {
		this.fromAddress = fromAddress;
	}

	public String getContactMessageRecepient() {
		return contactMessageRecepient;
	}

	public void setContactMessageRecepient(String contactMessageRecepient) {
		this.contactMessageRecepient = contactMessageRecepient;
	}
	
}
