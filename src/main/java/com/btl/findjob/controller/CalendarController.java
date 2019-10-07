package com.btl.findjob.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.btl.findjob.mapper.CalendarMapper;
import com.btl.findjob.model.CalendarDTO;
import com.btl.findjob.service.CalendarService;
import com.google.gson.Gson;

@Controller
public class CalendarController {

    @Autowired
    CalendarService cs;

    @RequestMapping(value = "/calendar")
    public String calendar(String ci_companyName, Model model) {
        List<CalendarDTO> cList = new ArrayList<>();
        cList = cs.JData(ci_companyName);
        // 이름가지고 사람인 데이터 불러오기
        model.addAttribute("jdata", cList);
        model.addAttribute("ci_companyName", ci_companyName);
        return "calendar";
    }

    @Autowired
    CalendarMapper calMaper;

    @RequestMapping(value = "/calendar/json", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public @ResponseBody
    ResponseEntity<String> calendar(@RequestBody List<CalendarDTO> userData) {

        // 유효성 검사 해야됨.
        calMaper.deleteTable(userData.get(0).getUseremail(), userData.get(0).getCompanyname());
        calMaper.insertCalendar(userData);
        return new ResponseEntity<>("success", HttpStatus.OK);
    }

    @RequestMapping(value = "calendar/jsonLoad", consumes = "application/json", produces = "application/text; charset=utf8")
    public @ResponseBody
    String calendarLoad(@RequestBody String userEmail) {

        Gson gson = new Gson();
        String json = gson.toJson(calMaper.selectTable(userEmail));
        return json;
    }
}
