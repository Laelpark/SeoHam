package com.lael.infra;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class HomeController {
		
		private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		
		/**
		 * Simply selects the home view to render by returning its name.
		 */
		/*
		 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
		 * home(Locale locale, Model model) {
		 * logger.info("Welcome home! The client locale is {}.", locale);
		 * 
		 * Date date = new Date(); DateFormat dateFormat =
		 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		 * 
		 * String formattedDate = dateFormat.format(date);
		 * 
		 * model.addAttribute("serverTime", formattedDate );
		 * 
		 * return "home"; }
		 */
	
		@RequestMapping(value = "/a", method = RequestMethod.GET)
		public String a(Locale locale, Model model) {
			
			return "a";
		}
		
		@RequestMapping(value = "/b", method = RequestMethod.GET)
		public String b(Locale locale, Model model) {
			
			return "b";
		}
		
		@RequestMapping(value = "/c", method = RequestMethod.GET)
		public String c(Locale locale, Model model) {
			
			return "c";
		}
		
		@RequestMapping(value = "/d", method = RequestMethod.GET)
		public String d(Locale locale, Model model) {
			
			return "d";
		}
		
		@RequestMapping(value = "/e", method = RequestMethod.GET)
		public String e(Locale locale, Model model) {
			
			return "e";
		}
		
		@RequestMapping(value = "/codeGroupList", method = RequestMethod.GET)
		public String codeGroupList(Locale locale, Model model) {
			
			return "codeGroupList";
		}
		
		@RequestMapping(value = "/test")
		public String publicCorona1List(Model model) throws Exception {
			
			System.out.println("asdfasdfasdf");
			
			String apiUrl = "http://apis.data.go.kr/1471000/CovidDagnsRgntProdExprtStusService/getCovidDagnsRgntProdExprtStusInq?serviceKey=dNLcjyriV9IBD5djvIMsq16GYwW%2F8N%2FCtnCNvRj66yaLV9jXKhipDNCJFDcDzorgqnVsJsz5gmYoibNbAG0sdw%3D%3D&numOfRows=3&pageNo=1&type=json";
			
			URL url = new URL(apiUrl);
			HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
			httpURLConnection.setRequestMethod("GET");
			
			BufferedReader bufferedReader;
			if (httpURLConnection.getResponseCode() >= 200 && httpURLConnection.getResponseCode() <= 300) {
				bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getInputStream()));
			} else {
				bufferedReader = new BufferedReader(new InputStreamReader(httpURLConnection.getErrorStream()));
			}
			
			StringBuilder stringBuilder = new StringBuilder();
			String line;
			while ((line = bufferedReader.readLine()) != null) {
				System.out.println("line: " + line);
				stringBuilder.append(line);
			}

			bufferedReader.close();
			httpURLConnection.disconnect();

			System.out.println("stringBuilder.toString(): " + stringBuilder.toString());
			
//			json object + array string -> java map
			
	        ObjectMapper objectMapper = new ObjectMapper();
	        Map<String, Object> map = objectMapper.readValue(stringBuilder.toString(), Map.class);
	        
	        System.out.println("######## Map");
			for (String key : map.keySet()) {
				String value = String.valueOf(map.get(key));	// ok
				System.out.println("[key]:" + key + ", [value]:" + value);
			}
			
			Map<String, Object> header = new HashMap<String, Object>();
			header = (Map<String, Object>) map.get("header");
			
			System.out.println("######## Header");
			for (String key : header.keySet()) {
				String value = String.valueOf(header.get(key));	// ok
				System.out.println("[key]:" + key + ", [value]:" + value);
			}
			
//			String aaa = (String) header.get("resultCode");
			
//			System.out.println("header.get(\"resultCode\"): " + header.get("resultCode"));
//			System.out.println("header.get(\"resultMsg\"): " + header.get("resultMsg"));
			
			Map<String, Object> body = new HashMap<String, Object>();
			body = (Map<String, Object>) map.get("body");
			
			List<Home> items = new ArrayList<Home>();
			items = (List<Home>) body.get("items");
			
			
			System.out.println("items.size(): " + items.size());
			
//			for(Home item : items) {
//				System.out.println(item.getMM());
//			}
			
			model.addAllAttributes(header);
			model.addAllAttributes(body);
			
			return "test";
		}
		
		@RequestMapping(value = "/test2")
		public String regularRestaurant(Model model) throws Exception {
			
			System.out.println("asdfasdfasdf");
			
			String apiUrl = "http://apis.data.go.kr/5690000/sjRegularRestaurant/sj_00000760?pageIndex=1&pageUnit=20&dataTy=xml&serviceKey=3IUV6qPsCWc5LjNqSWjW482T4vWgcHKrFK5Y2xI%2Bfkgm69mwJhsdtJDr48y1M94iAn2rHMdbLDwQs9%2FeFphaTw%3D%3D";
			
			URL url2 = new URL(apiUrl);
			HttpURLConnection httpURLConnection2 = (HttpURLConnection) url2.openConnection();
			httpURLConnection2.setRequestMethod("GET");
			
			BufferedReader bufferedReader2;
			if (httpURLConnection2.getResponseCode() >= 200 && httpURLConnection2.getResponseCode() <= 300) {
				bufferedReader2 = new BufferedReader(new InputStreamReader(httpURLConnection2.getInputStream()));
			} else {
				bufferedReader2 = new BufferedReader(new InputStreamReader(httpURLConnection2.getErrorStream()));
			}
			
			StringBuilder stringBuilder2 = new StringBuilder();
			String line2;
			while ((line2 = bufferedReader2.readLine()) != null) {
				System.out.println("line: " + line2);
				stringBuilder2.append(line2);
			}
			
			bufferedReader2.close();
			httpURLConnection2.disconnect();
			
			System.out.println("stringBuilder.toString(): " + stringBuilder2.toString());
			
//			json object + array string -> java map
			
			ObjectMapper objectMapper2 = new ObjectMapper();
			Map<String, Object> map = objectMapper2.readValue(stringBuilder2.toString(), Map.class);
			
			System.out.println("######## Map");
			for (String key : map.keySet()) {
				String value = String.valueOf(map.get(key));	// ok
				System.out.println("[key]:" + key + ", [value]:" + value);
			}
			
			Map<String, Object> header2 = new HashMap<String, Object>();
			header2 = (Map<String, Object>) map.get("header2");
			
			System.out.println("######## Header2");
			for (String key : header2.keySet()) {
				String value = String.valueOf(header2.get(key));	// ok
				System.out.println("[key]:" + key + ", [value]:" + value);
			}
			
//			String aaa = (String) header.get("resultCode");
			
//			System.out.println("header.get(\"resultCode\"): " + header.get("resultCode"));
//			System.out.println("header.get(\"resultMsg\"): " + header.get("resultMsg"));
			
			Map<String, Object> body2 = new HashMap<String, Object>();
			body2 = (Map<String, Object>) map.get("body2");
			
			List<Home2> items2 = new ArrayList<Home2>();
			items2 = (List<Home2>) body2.get("items2");
			
			
			System.out.println("items2.size(): " + items2.size());
			
//			for(Home item : items) {
//				System.out.println(item.getMM());
//			}
			
			model.addAllAttributes(header2);
			model.addAllAttributes(body2);
			
			return "test2";
		}
		
}
