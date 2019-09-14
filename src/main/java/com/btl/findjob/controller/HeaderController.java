package com.btl.findjob.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.btl.findjob.model.TempKey;
import com.btl.findjob.service.MailSendService;
import com.btl.findjob.service.UserService;



@Controller
public class HeaderController {

	@Inject
	MailSendService mailsender;
	
	@Autowired
	UserService userservice;
	
	



	// header 
	@RequestMapping(value = "sshheader", method = {RequestMethod.GET ,  RequestMethod.POST}) 
	public String sshheader() {


		
		return "includes/sshheader";
	}

	
	// 로그인
	@RequestMapping(value = "sshlogin", method = {RequestMethod.GET ,  RequestMethod.POST}) 
	public String sshlogin() {

		
		return "sshlogin";
	}
	
	@RequestMapping(value = "sshlogin_chk", method = {RequestMethod.POST}) 
	@ResponseBody
	public String sshlogin_chk(@Param("user_email") String user_email,@Param("user_password") String user_password,HttpServletRequest request) {
	
		if(userservice.login(user_email, user_password)==1) {
			HttpSession session = request.getSession();
			   session.setAttribute("user", user_email);

		}
		
		return Integer.toString(userservice.login(user_email, user_password));


	}
	
	
	
	
	
	
	// 가입
	@RequestMapping(value = "sshsignup", method = {RequestMethod.GET ,  RequestMethod.POST}) 
	public String sshregi() {

		
		return "sshsignup";
	}
	
	


	// 비밀번호 찾기
	@RequestMapping(value = "sshpwfind", method = {RequestMethod.GET ,  RequestMethod.POST}) 
	public String sshpwfind() {

		
		return "sshpwfind";
	}
	
	
	
	//가입 테스트
	@RequestMapping(value = "sshsignup_go" , method = {RequestMethod.POST}) 
	public String sshsignup_go(@Param("user_email") String user_email,@Param("user_password") String user_password,HttpServletRequest request) {

	TempKey tempkey = new TempKey();             
		String key = tempkey.getKey(30, false); //랜덤으로 이루어진 인증키 30사이즈 생성       
		
		int authorization = 5; //비인증회원  

	
		userservice.join_insert(user_email,user_password,key,authorization); 
			 
		mailsender.mailSendWithUserKey(user_email,key,request); 
		   
		   
		return "sshlogin";
	}
	
	@RequestMapping(value = "key_alter" , method = {RequestMethod.GET}) 
	public String sshsignup_go(@Param("user_email") String user_email,@Param("user_emailauthkey") String user_emailauthkey,Model model) {
	
		System.out.println(user_email);
		System.out.println(user_emailauthkey);
		
		 String auth = "";
		
		if(userservice.keychk(user_email,user_emailauthkey)==1) {
			userservice.auth_ok(user_email);
			auth = "ok";
			model.addAttribute("auth", auth);
			return "forward:sshauth";
		}else{
			System.out.println("인증불가 ");
			auth = "fail";
			model.addAttribute("auth", auth);
			return "forward:sshauth";
		}
		   

	}
	
	
	@RequestMapping(value = "sshauth" , method = {RequestMethod.GET ,  RequestMethod.POST}) 
	public String sshauth(){

		return "sshauth";
	}
	
	
	
	
	
	@RequestMapping(value = "emailchk" , method = {RequestMethod.GET ,  RequestMethod.POST}) 
	@ResponseBody 
	public String emailchk(@Param ("user_email") String user_email){

		return Integer.toString(userservice.emailchk(user_email));
	}
	
}
