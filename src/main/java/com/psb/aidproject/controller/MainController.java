package com.psb.aidproject.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.xml.ws.ProtocolException;

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
		String result = "";
		try {
			//JSON 데이터 받을 URL 객체 생성
			URL url = new URL("http://192.168.2.7:80/predict");	
			//HttpURLConnection 객체를 생성해 openConnection 메소드로 url 연결
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			System.out.println(conn);
			
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
			
			//전송방식(POST)
			conn.setRequestMethod("POST");
			//application/json 형식으로 전송, Request Body를 JSON으로 던져줌.
			conn.setRequestProperty("Conten-Type","application/json;utf-8");
			//Response data를 JSON으로 받도록 설정
			conn.setRequestProperty("Accept-Language","application/json");
			//Output Stream을 POST 데이터로 전송
			conn.setDoOutput(true);
			//Input Stream으로 서버로부터 응답을 받겠다는 옵션
			conn.setDoInput(true);
			
			//JSON 보내는 Output stream			
			OutputStreamWriter osw = new OutputStreamWriter(conn.getOutputStream());
			try {
				osw.write(jsonData);
				osw.flush();
				
				//응답
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
				String line = null;
				while((line = br.readLine())!=null){
					System.out.println(line);
				}
				
				//닫기
				osw.close();
				br.close();
			}catch(MalformedURLException e){
				e.printStackTrace();
			}catch(ProtocolException e){
				e.printStackTrace();
			}catch(UnsupportedEncodingException e){
				e.printStackTrace();
			}catch(IOException e){
				e.printStackTrace();
			}			
		}catch(Exception e) {
		}
		return "redirect:main";
		
	}
}
		
		
		//JSON 보내는 Output stream
		/*
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

/*
//JSON 보내는 Output stream
OutputStream os = conn.getOutputStream();
os.write(jsonData.getBytes("utf-8"));
os.flush();
// receive response as inputStream
try {
	is = conn.getInputStream();
	// convert inputstream to string
	if (is != null)
		result = is.toString();
	else
		result = "Did not work!";
}
catch (IOException e) {
	e.printStackTrace();
}
finally {
	conn.disconnect();
}
}
catch(IOException e) {
e.printStackTrace();
}
catch(Exception e) {
e.printStackTrace();
}
System.out.println(result);

*/



// GET 방식
/*
@PostMapping("/predict")
public String predict(TestDto test) throws Exception {
	logger.info("실행");
	String dstn = test.getDstn();
	String latitude = test.getLatitude();
	String longitude = test.getLongitude();
	String emd = test.getEmd();
	String tm = test.getTm();
	String occurplc = test.getOccurplc();
	String conscs = test.getConscs();
	System.out.println(dstn+latitude+longitude+emd+tm+occurplc+conscs);
	String urlstr = "http://192.168.2.7:80/predict/";
	System.out.println(urlstr+tm);
	try {
		URL url = new URL(urlstr+tm);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		//전송방식(GET)
		conn.setRequestMethod("GET");
		
		//Input Stream으로 서버로부터 응답을 받겠다는 옵션
		conn.setDoOutput(true);
		
		//Response data 받는 부분
		try(BufferedReader br = new BufferedReader(
				new InputStreamReader(conn.getInputStream(),"utf-8"))){
			StringBuilder response = new StringBuilder();
			String responseLine = null;
			while((responseLine = br.readLine())!=null) {
				response.append(responseLine.trim());
			}
			System.out.println("리턴된값 : " + response.toString());
		} catch(Exception e) {
			e.printStackTrace();
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return "redirect:content";
}
}
*/

