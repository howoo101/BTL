package com.btl.findjob.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.btl.findjob.model.CompanyListVO;
import com.btl.findjob.model.FollowVO;
import com.btl.findjob.service.CompanyService;


@Controller
public class CompanyController {
	
	private static final Logger logger =
			LoggerFactory.getLogger(CompanyController.class);
	
	@Autowired
	CompanyService service;
	
	@GetMapping(value = "search")
	public String companySearchList(String keyword, Model model,HttpServletRequest req) {
//		System.out.println("================"+keyword);
		String userEmail = (String)req.getSession().getAttribute("user");
		logger.info(userEmail);
		if(userEmail == null)
			model.addAttribute("companyList",service.companyGetListWithCnt(keyword,"0"));
		else {
			model.addAttribute("companyList",service.companyGetListWithCntWithLogin(userEmail,keyword,"0"));
		}
		
		model.addAttribute("keyword",keyword);
		return "companySearchList";
	}
	
	@PostMapping(value="scroll")
	public @ResponseBody List<CompanyListVO> scroll(
			@RequestBody Map<String, Object> params, HttpServletRequest req) {
		logger.info("scoll is called.....");
		String keyword = (String)params.get("keyword");
		String startNum = (String)params.get("startNo");
		
		String userEmail = (String)req.getSession().getAttribute("user");
		logger.info(userEmail);
		
		if(userEmail == null)
			return service.companyGetListWithCnt(keyword,String.valueOf(Integer.parseInt(startNum)));
		
		else {
			return service.companyGetListWithCntWithLogin(userEmail,keyword,String.valueOf(Integer.parseInt(startNum)));
		}
		
	}
	
	
	 @PostMapping("/follow/new")
	 public @ResponseBody int companyInsertFollow(@RequestBody Map<String, Object> params,
			 HttpServletRequest req) {
		 String userEmail = (String)req.getSession().getAttribute("user");
		 String ciId = (String)params.get("id");
		 logger.info("follow  insert " + ciId);
		 service.companyInsertFollow(userEmail,Integer.parseInt(ciId));
		 return Integer.parseInt(ciId);
	 }
	 
	 @DeleteMapping("/follow/{id}")
	 public @ResponseBody void companyDeleteFollow(@PathVariable("id") String followId) {
		 logger.info("follow " + followId+" delete");
		 service.companyDeleteFollow(followId);
	 }
}
