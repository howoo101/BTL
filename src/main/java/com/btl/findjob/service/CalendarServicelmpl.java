package com.btl.findjob.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

import com.btl.findjob.controller.GraphController;
import com.btl.findjob.model.CalendarDTO;

@Service
public class CalendarServicelmpl implements CalendarService {

    @Override
    public List<CalendarDTO> JData(String ci_companyName) {

        GraphController saraminData = new GraphController();
        String json = saraminData.saraminData(ci_companyName);


        List<CalendarDTO> cList = new ArrayList<>();

        try {
            JSONParser jsonParse = new JSONParser();
            //JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다.
            JSONObject jsonObj = (JSONObject) jsonParse.parse(json);
            //JSONObject에서 PersonsArray를 get하여 JSONArray에 저장한다.
            JSONObject jobdata = (JSONObject) jsonObj.get("jobs");
            JSONArray jobarr = (JSONArray) jobdata.get("job");


            for (Object o : jobarr) {

                CalendarDTO cDto = new CalendarDTO();
                //0번째 요소를 하나 선택해서
                JSONObject indexObj = (JSONObject) o;
                // url
                // 회사 이름
                JSONObject jsonObjCompany = (JSONObject) indexObj.get("company");
                JSONObject jsonObjDetail = (JSONObject) jsonObjCompany.get("detail");
                // 직무
                JSONObject jsonObjPosition = (JSONObject) indexObj.get("position");
                cDto.setTitle(jsonObjDetail.get("name") + " / " + jsonObjPosition.get("title"));
                // 채용 오픈
                SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
                Long hireStamp = Long.parseLong((String) indexObj.get("opening-timestamp")) * 1000;
                Date hDate = new Date(hireStamp);
                // 채용 종료
                Long expireStamp = Long.parseLong((String) indexObj.get("expiration-timestamp")) * 1000;
                Date eDate = new Date(expireStamp);

                String tt = sf.format(eDate);
                //채용시 까지일때
                if (tt.equals("2033-01-01")) {
                    cDto.setStart(sf.format(new Date()));
                    Calendar c = Calendar.getInstance();
                    c.add(Calendar.DATE, 1);
                    cDto.setEnd(sf.format(c.getTime()));
                } else {
                    cDto.setStart(sf.format(hDate));
                    cDto.setEnd(sf.format(eDate));
                }
                if (jsonObjDetail.get("name").equals(ci_companyName)) {
                    cList.add(cDto);
                }
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return cList;
    }// end of JData

    public void insertCalendar(List<CalendarDTO> calArr) {

    }
}
