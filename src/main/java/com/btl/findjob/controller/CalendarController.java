package com.btl.findjob.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

//@Controller
public class CalendarController {
	
//	@RequestMapping(value="/calendar")
//	public String calendar(String ci_companyName, Model model) {
//		
//		// 이름가지고 사람인 데이터 불러오기
//		GraphController saraminData = new GraphController();
//		String json = saraminData.saraminData(ci_companyName);
//		
//		model.addAttribute("saraminData",json);
//		return "calendar";
//	}
	
	public static void main(String[] args) {
		
		GraphController saraminData = new GraphController();
		String json = saraminData.saraminData("(주)비트컴퓨터");
		
		System.out.println(json);
		
		try {
			JSONParser jsonParse = new JSONParser(); //JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다. 
			JSONObject jsonObj = (JSONObject) jsonParse.parse(json);//JSONObject에서 PersonsArray를 get하여 JSONArray에 저장한다. 
			JSONObject jobdata = (JSONObject) jsonObj.get("jobs");
			JSONArray jobarr = (JSONArray) jobdata.get("job");
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	
	}
}
