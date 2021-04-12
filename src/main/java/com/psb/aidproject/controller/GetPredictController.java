package com.psb.aidproject.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.psb.aidproject.dto.TestDto;

@RestController
@RequestMapping("/api")
public class GetPredictController {
	private static final Logger logger=
			LoggerFactory.getLogger(GetPredictController.class);
	
	@PostMapping("/getpredict")
	public String getPredict(@RequestBody String jsonData) {
		logger.info("실행");
		System.out.println("제발" + jsonData);
		return jsonData;
	}
}
