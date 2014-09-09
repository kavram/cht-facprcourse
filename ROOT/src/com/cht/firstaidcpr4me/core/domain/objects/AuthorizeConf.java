package com.cht.firstaidcpr4me.core.domain.objects;

public class AuthorizeConf {

	private String apiLoginId;
    private String transactionKey;
    private String relayResponseUrl;
    private String postUrl;
    private String version;
    private String type;
    private String method;
    private String testRequest;
    private String notes;
    
    public AuthorizeConf(){
    	
    }
    
    public String getApiLoginId() {
		return apiLoginId;
	}
	public void setApiLoginId(String apiLoginId) {
		this.apiLoginId = apiLoginId;
	}
	public String getTransactionKey() {
		return transactionKey;
	}
	public void setTransactionKey(String transactionKey) {
		this.transactionKey = transactionKey;
	}
	public String getRelayResponseUrl() {
		return relayResponseUrl;
	}
	public void setRelayResponseUrl(String relayResponseUrl) {
		this.relayResponseUrl = relayResponseUrl;
	}
	public String getPostUrl() {
		return postUrl;
	}
	public void setPostUrl(String postUrl) {
		this.postUrl = postUrl;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getTestRequest() {
		return testRequest;
	}
	public void setTestRequest(String testRequest) {
		this.testRequest = testRequest;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	
	
}
