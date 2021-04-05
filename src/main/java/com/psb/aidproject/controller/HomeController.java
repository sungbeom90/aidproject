package com.psb.aidproject.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	private static final Logger logger=LoggerFactory.getLogger(HomeController.class);
	
	// http://.../aidproject 생략됨
	@RequestMapping("/")
	public String home() {
		logger.info("실행");
		return "home";
	}
}
