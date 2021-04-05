package com.psb.aidproject.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	private static final Logger logger=LoggerFactory.getLogger(HomeController.class);
	
	// http://.../aidproject 생략됨
	@RequestMapping("/")
	public String home() {
		logger.info("실행");
		return "home1";
	}

@RequestMapping(value = "/test.do", method=RequestMethod.GET)
public ModelAndView Test() {
	ModelAndView mav = new ModelAndView();
	
	String url = "http://127.0.0.1/tospring";
	String sb = "";
	try {
		HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
		String line = null;
		while ((line = br.readLine()) != null) {
			sb = sb + line + "\n";
		}
		System.out.println("========br======" + sb.toString());
		if(sb.toString().contains("ok")) {
			System.out.println("test");
		}
		br.close();
		
		System.out.println(""+ sb.toString());
	} catch(MalformedURLException e) {
		e.printStackTrace();
	} catch(IOException e) {
		e.printStackTrace();
	}
	mav.addObject("test1", sb.toString()); //"test1"은 jsp파일에서 받을 때 이름,
	//sb.toSring은 value값(여기에선 test)
	mav.addObject("fail",false);
	mav.setViewName("test"); //jsp파일 이름
	return mav;
	}
}



