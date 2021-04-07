package com.psb.aidproject.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.psb.aidproject.dto.HomeDto;

@Controller
public class HomeController {
	private static final Logger logger=LoggerFactory.getLogger(HomeController.class);
	
	// http://.../aidproject 생략됨
	@RequestMapping("/")
	public String home() {
		logger.info("실행");
		return "redirect:main/content";
	}
	
	@RequestMapping("/method")
	public String method(
		@RequestParam("param1")String arg1,
		@RequestParam("param2")float arg2,
		@RequestParam("param3")float arg3,
		@RequestParam("param4")int arg4,
		@RequestParam("param5")String arg5,
		@RequestParam("param6")String arg6,
		Model model)
	{
	HomeDto dto = new HomeDto();
	dto.setAdd(arg1);
	dto.setLongi(arg2);
	dto.setLat(arg3);
	dto.setTime(arg4);
	dto.setJuri(arg5);
	dto.setCons(arg6);
	logger.info("param1: " + arg1);
	logger.info("param2: " + arg2);
	logger.info("param3: " + arg3);
	logger.info("param4: " + arg4);
	logger.info("param5: " + arg5);
	logger.info("param6: " + arg6);

	model.addAttribute("info", dto);
	return "home2";
	}
}



