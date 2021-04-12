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
			.baseUrl("http://192.168.2.7:80")
			.build();
	
	public String getPredict(TestDto test) {
		logger.info("실행");
		
		//JSON data
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("dstn", test.getDstn());
		jsonObject.put("latitude", test.getLatitude());
		jsonObject.put("longitude", test.getLongitude());
		jsonObject.put("tm", test.getTm());
		jsonObject.put("conscs", test.getConscs());
		jsonObject.put("emd", test.getEmd());
		jsonObject.put("occurplc", test.getOccurplc());
		
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
