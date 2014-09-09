package com.cht.firstaidcpr4me.web.domain;

import java.util.Calendar;
import java.util.Random;

import oracle.sql.DATE;

import net.authorize.sim.Fingerprint;

public class InitPayment {
    private long fpSequence;
    private long fpTimestamp;
    private String fpHash;
    
    public InitPayment(final String apiLoginId, final String transactionKey, final String amt){
    	Fingerprint fingerprint = Fingerprint.createFingerprint(
    	          apiLoginId,
    	          transactionKey,
    	          Calendar.getInstance().getTimeInMillis(),
    	          amt);
    	fpSequence = fingerprint.getSequence();
    	fpTimestamp = fingerprint.getTimeStamp();
    	fpHash = fingerprint.getFingerprintHash();
    }

    public long getFpSequence(){
    	return fpSequence;
    }
    
    public long getFpTimestamp(){
    	return fpTimestamp;
    }
    
    public String getFpHash(){
    	return fpHash;
    }
    
	
}
