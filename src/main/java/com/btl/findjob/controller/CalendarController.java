package com.btl.findjob.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.btl.findjob.model.CalendarDTO;
import com.btl.findjob.service.CalendarService;

@Controller
public class CalendarController {

	@Autowired
	CalendarService cs;
	
	@RequestMapping(value="/calendar")
	public String calendar(String ci_companyName, Model model) {
		List<CalendarDTO> cList = new ArrayList<>();
		cList = cs.JData(ci_companyName);
		// 이름가지고 사람인 데이터 불러오기
		model.addAttribute("jdata", cList);
		
		return "calendar";
	}
}
