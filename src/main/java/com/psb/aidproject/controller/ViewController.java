package com.psb.aidproject.controller;

import java.io.BufferedWriter;
import java.io.OutputStreamWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/view")
public class ViewController {
	private static final Logger logger=
			LoggerFactory.getLogger(ViewController.class);
	
	
	@PostMapping("/movetm")
	public void moveTm(HttpServletRequest request, HttpServletResponse response) {
		//JSON data
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("predict", 5.0);
		String jsonData = jsonObject.toString();
		
		//Response data
		Map<String, String[]> data = request.getParameterMap();
		System.out.println(data);
		System.out.println(data.get("predict"));
		
		
		try(BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(response.getOutputStream()))){
			bw.write(jsonData);
			
		}catch(Exception e) {
			e.getStackTrace();
		}	
		
	}



}
