package com.btl.findjob.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class NaverSearchAPI {

    public ArrayList<String[]> result(String query) {
        String clientId = "AbMD7xQTQfGv8ZbT3FbP";
        String clientSecret = "eP8Ob8G_qK";
        ArrayList<String[]> list = new ArrayList<>();

        try {

            String text = URLEncoder.encode(query, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/news.json?query=" + text + "&start=1&display=20";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            // response 수신
            int responseCode = con.getResponseCode();
            if (responseCode == 200) {
                BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
                String inputLine;
                StringBuffer response = new StringBuffer();
                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                in.close();
                JSONParser parser = new JSONParser();
                Object obj = parser.parse(response.toString());
                JSONObject jsonObj = (JSONObject) obj;
                JSONArray jsonArr = (JSONArray) jsonObj.get("items");
                text = URLDecoder.decode(text).trim();
                //회사명 뽑아내기
                if (text.contains("주식회사"))
                    text = text.substring(4);
                else if (text.indexOf(")") < 4)
                    text = text.substring(text.indexOf(")") + 1);
                else
                    text = text.substring(0, text.indexOf("("));
                text = text.trim();
                System.out.println("회사이름 : " + text);
				
                for (Object o : jsonArr) {
					String[] arr = new String[3];
					String title = ((JSONObject) o).get("title").toString();
					String discription = ((JSONObject) o).get("description").toString();
					if (title.contains("주가") || discription.contains("주가")) continue;
					String link = ((JSONObject) o).get("link").toString();
			
					//date format
					String date = ((JSONObject) o).get("pubDate").toString();
					SimpleDateFormat transFormat = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss Z", Locale.ENGLISH);
					Date to = transFormat.parse(date);
					SimpleDateFormat transFormat2 = new SimpleDateFormat("yyyy-MM-dd");
					date = transFormat2.format(to);
					//
					
					arr[0] = title;
					arr[1] = link;
					arr[2] = date;
					//기업명포함된 기사만 추가
					if (title.contains(text) || discription.contains(text))
						list.add(arr);
				}

            } else {
                System.out.println("API 호출 에러 발생 : 에러코드=" + responseCode);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

}