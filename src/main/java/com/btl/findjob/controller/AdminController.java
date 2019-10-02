package com.btl.findjob.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.btl.findjob.model.BoardCriteria;
import com.btl.findjob.model.BoardPageDTO;
import com.btl.findjob.service.AdminService;
import com.btl.findjob.service.MypageService;
import com.btl.findjob.service.UserService;

@Controller
public class AdminController {

	@Autowired
	AdminService adminservice;
	@Inject
	UserService userservice;

	
	@RequestMapping(value = "admin_page" , method = {RequestMethod.GET ,  RequestMethod.POST}) 
	public String admin_page(Model model){
		
		model.addAttribute("user_list", adminservice.get_userlist());
		
		return "admin/admin_page";
	}
	
	@RequestMapping(value = "user_status" , method = {RequestMethod.GET ,  RequestMethod.POST}) 
	public String user_status(Model model,@Param("user_email") String user_email){


		model.addAttribute("Uinfo_list", userservice.user_info(user_email));
		
		return "admin/user_status";
	}
	
	@RequestMapping(value = "/user_InterviewReview", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_InterviewReview(@Param("user_id") int user_id, Model model) {
		
	
	model.addAttribute("user_id", user_id);
	model.addAttribute("myInterviewList", adminservice.myInterviewReview(user_id));

		return "admin/user_InterviewReview";

	}
	
	@RequestMapping(value = "/user_ReviewComment", method = {RequestMethod.GET,RequestMethod.POST})
	public String user_ReviewComment(@Param("user_id") int user_id, Model model) {


		model.addAttribute("myReviewCommentList", adminservice.myReviewComment(user_id));

		return "admin/user_ReviewComment";

	}
	
 
	
}
