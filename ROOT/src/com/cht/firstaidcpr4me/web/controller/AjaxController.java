package com.cht.firstaidcpr4me.web.controller;


import javax.servlet.http.HttpServletRequest;

import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cht.firstaidcpr4me.core.domain.services.UserService;
import com.cht.firstaidcpr4me.web.domain.User;



@Controller
public class AjaxController {
	private static final Logger log = LoggerFactory.getLogger(AjaxController.class);
	
	@Autowired
	private UserService userService;
	
	
	
	@RequestMapping("ajax/register")
	public String processRegistrationSubmission(@RequestParam(value="params", required=true) String params, HttpServletRequest request){
		try {
			JSONObject data = new JSONObject(params);
			User user = null;
			
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
