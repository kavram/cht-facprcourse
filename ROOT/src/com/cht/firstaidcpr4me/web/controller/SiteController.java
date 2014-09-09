package com.cht.firstaidcpr4me.web.controller;


import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cht.firstaidcpr4me.core.domain.services.UserService;
import com.cht.firstaidcpr4me.web.domain.User;




@Controller
@RequestMapping("/")
public class SiteController {

	private static final Logger LOG = LoggerFactory.getLogger(SiteController.class);

	@Autowired
	private UserService userService;
	
	@Autowired
	private User user;
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String getCurrentMenu(Model model) {
		
		
		return "home.jsp";
	}
	
	
	
}
