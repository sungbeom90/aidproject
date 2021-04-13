package com.psb.aidproject.service;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

import com.psb.aidproject.dto.TestDto;

@Service("predictService")
public class PredictService {
	private static final Logger logger=
			LoggerFactory.getLogger(PredictService.class);
	
	private WebClient webClient = WebClient.builder()
			.baseUrl("http://192.168.2.147:80")
			.build();
	
	public String getPredict(TestDto test) {
		logger.info("실행");
		
	
		
		//JSON data
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("emr", "안양동");
		jsonObject.put("jur", test.getJur());
		jsonObject.put("x", test.getLatitude());
		jsonObject.put("y", test.getLongitude());
		jsonObject.put("stat", test.getTm());
		jsonObject.put("conscs", test.getConscs());
		jsonObject.put("rel", test.getOccurplc());
		
		// json객체를 string으로 변경
		String jsonData = jsonObject.toString();
		System.out.println(jsonData.getClass());
		System.out.println(jsonData);
	
		return webClient.post()
				.uri("/predict")
				.contentType(MediaType.APPLICATION_JSON_UTF8)
				.accept(MediaType.APPLICATION_JSON_UTF8)
				.bodyValue(jsonData)
				.retrieve()
				.bodyToMono(String.class)
				.block();
	}
}
