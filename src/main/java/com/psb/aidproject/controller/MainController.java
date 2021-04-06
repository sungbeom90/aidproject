package com.psb.aidproject.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.psb.aidproject.dto.TestDto;

@Controller
@RequestMapping("/main")
public class MainController {
	private static final Logger logger=
			LoggerFactory.getLogger(MainController.class);
	
	@GetMapping("/content")
	public String content() {
		logger.info("실행");
		return "main";
	}
	
	@GetMapping("/predict")
	public String predictForm() {
		logger.info("실행");
		return "predict";
	}
	
	
	@PostMapping("/predict")
	public String predict(TestDto test) throws Exception {
		logger.info("실행");
		//JSON 데이터 받을 URL 객체 생성
		URL url = new URL("https://webhook.site/565f699f-b021-4d56-a7ca-88ed1e2fe0e8");	
		//HttpURLConnection 객체를 생성해 openConnection 메소드로 url 연결
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		System.out.println(conn);
		//전송방식(POST)
		conn.setRequestMethod("POST");
		//application/json 형식으로 전송, Request Body를 JSON으로 던져줌.
		conn.setRequestProperty("Conten-Type","application/json;utf-8");
		//Response data를 JSON으로 받도록 설정
		conn.setRequestProperty("Accept","application/json");
		//Output Stream을 POST 데이터로 전송
		conn.setDoOutput(true);
		//JSON data
		JSONObject root = new JSONObject();
		root.put("dstn", test.getDstn());
		root.put("latitude", test.getLatitude());
		root.put("longitude", test.getLongitude());
		root.put("tm", test.getTm());
		root.put("conscs", test.getConscs());
		root.put("emd", test.getEmd());
		root.put("occurplc", test.getOccurplc());
		String jsonData = root.toString();	
		System.out.println(jsonData.getClass());
		System.out.println(jsonData);
		
		
		//JSON 보내는 Output stream
		try(OutputStream os = conn.getOutputStream()){
			byte[] input = jsonData.getBytes("utf-8");
			os.write(input, 0, input.length);
		} catch(Exception e) {
			e.printStackTrace();
		}
		//Response data 받는 부분
		try(BufferedReader br = new BufferedReader(
				new InputStreamReader(conn.getInputStream(),"utf-8"))){
			StringBuilder response = new StringBuilder();
			String responseLine = null;
			while((responseLine = br.readLine())!=null) {
				response.append(responseLine.trim());
			}
			System.out.println(response.toString());
		} catch(Exception e) {
			e.printStackTrace();
		}		
		return "redirect:content";
	}

}
