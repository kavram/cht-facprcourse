package com.cht.firstaidcpr4me.web.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cht.firstaidcpr4me.core.domain.exceptions.EmailExistException;
import com.cht.firstaidcpr4me.core.domain.exceptions.UserNotFoundException;
import com.cht.firstaidcpr4me.core.domain.objects.EmailConf;
import com.cht.firstaidcpr4me.core.domain.services.EmailService;
import com.cht.firstaidcpr4me.core.domain.services.UserForgotPasswordService;
import com.cht.firstaidcpr4me.core.domain.services.UserService;
import com.cht.firstaidcpr4me.web.domain.AjaxResponse;
import com.cht.firstaidcpr4me.web.domain.User;



@Controller
public class AjaxController extends BaseController {
	private static final Logger log = LoggerFactory.getLogger(AjaxController.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserForgotPasswordService userForgotPasswordService; 
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private EmailConf emailConf;
	
	@RequestMapping("ajax/login")
	public @ResponseBody AjaxResponse processLoginSubmission(@RequestParam(value="params", required=true) String params, HttpServletRequest request, HttpServletResponse response){
		AjaxResponse resp = null;
		try {
			JSONObject data = new JSONObject(params);
			User user = userService.getUserByEmailAndPassword(data.getString("email"), data.getString("password"));
			setUser(user, request, response);
			resp = new AjaxResponse("success");
			resp.setFirstName(user.getFirstName());
			resp.setLastName(user.getLastName());
		} catch (JSONException e) {
			log.error(e.getMessage(), e);
			resp = new AjaxResponse("error");
		} catch (UserNotFoundException e) {
			resp = new AjaxResponse("error");
			resp.setError("Wrong email or password.");
		}
		return resp;
	}

	@RequestMapping("ajax/forgot-password")
	public @ResponseBody AjaxResponse processForgotPassword(@RequestParam(value="params", required=true) String params, HttpServletRequest request, HttpServletResponse response){
		AjaxResponse resp = null;
		try {
			JSONObject data = new JSONObject(params);
			userForgotPasswordService.generateLoginForgotPassword(data.getString("email"));
			resp = new AjaxResponse("success");
		} catch (JSONException e) {
			log.error(e.getMessage(), e);
			resp = new AjaxResponse("error");
		} catch (UserNotFoundException e) {
			resp = new AjaxResponse("error");
			resp.setError("Email address not found.");
		}
		return resp;
	}
	
	
	@RequestMapping("ajax/logout")
	public @ResponseBody AjaxResponse processLogout(HttpServletRequest request, HttpServletResponse response){
		request.getSession().removeAttribute(SiteController.SESSION_ATTRIBUTE_USER);
		removeCookie(request, response);
		AjaxResponse resp = new AjaxResponse("success");
		return resp;
	}
	
	private void removeCookie(HttpServletRequest request, HttpServletResponse response) {
		Cookie cookie = new Cookie(SiteController.UID_COOKIE, null);  //getCookie(SiteController.UID_COOKIE, request);
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
	}

	@RequestMapping("ajax/register")
	public @ResponseBody AjaxResponse processRegistrationSubmission(@RequestParam(value="params", required=true) String params, HttpServletRequest request, HttpServletResponse response) {
		AjaxResponse resp = null;
		try {
			JSONObject data = new JSONObject(params);
			User user = new User();
			user.setEmail(data.getString("email"));
			user.setFirstName(data.getString("firstname"));
			user.setLastName(data.getString("lastname"));
			user.setPassword(data.getString("password"));
			user = userService.registerUser(user);
			setUser(user, request, response);
			resp = new AjaxResponse("success");
			resp.setFirstName(user.getFirstName());
			resp.setLastName(user.getLastName());
		} catch (JSONException e) {
			log.error(e.getMessage(), e);
			resp = new AjaxResponse("error");
		} catch (EmailExistException e) {
			resp = new AjaxResponse("error");
			resp.setError("The email address already exists.");
		}
		return resp;
	}
	
	@RequestMapping("ajax/contact")
	public @ResponseBody AjaxResponse processContactUsSubmission(@RequestParam(value="params", required=true) String params, HttpServletRequest request, HttpServletResponse response) {
		AjaxResponse resp = null;
		try {
			JSONObject data = new JSONObject(params);
			Map<String, Object> model = new HashMap<String, Object>();
			model.put("name", data.get("name"));
			model.put("email", data.get("email"));
			model.put("message", data.get("message"));
			emailService.sendEmail("contactUs.vm", emailConf.getContactMessageRecepient(), model);
		} catch (JSONException e) {
			log.error(e.getMessage(), e);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return new AjaxResponse("success");
	}
	
}
