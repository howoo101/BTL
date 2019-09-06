package com.btl.findjob.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.btl.findjob.model.CompanyInfoDTO;
import com.btl.findjob.service.CompanyService;

@Controller
public class CompanyController {
	
	private static final Logger logger =
			LoggerFactory.getLogger(CompanyController.class);
	
	@Autowired
	CompanyService service;
	
	@RequestMapping(value = "search")
	public String companySearchList(String keyword, Model model) {
//		System.out.println("================"+keyword);
		model.addAttribute("companyList",service.companyGetList(keyword,"0"));
		model.addAttribute("keyword",keyword);
		return "companySearchList";
	}
	
	@RequestMapping(value="scroll",method = RequestMethod.POST)
	public @ResponseBody List<CompanyInfoDTO> scroll(
			@RequestBody Map<String, Object> params) {
		logger.info("scoll is called.....");
		String keyword = (String)params.get("keyword");
		String startNum = (String)params.get("startNo");
		
		logger.info("keyword: " + keyword);
		logger.info("startNum: " + startNum);
		
		return service.companyGetList(keyword,String.valueOf(Integer.parseInt(startNum)+1));
		
	}
}
