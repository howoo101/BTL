package com.btl.findjob.controller;

import java.util.Collections;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.btl.findjob.model.TempKey;
import com.btl.findjob.service.MailSendService;
import com.btl.findjob.service.UserService;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;



@Controller
public class HeaderController {

	@Inject
	MailSendService mailsender;
	
	@Autowired
	UserService userservice;
	
	
	private static final HttpTransport transport = new NetHttpTransport();
	private static final  JsonFactory jsonFactory = new JacksonFactory();


	
	// 로그인
	@RequestMapping(value = "login", method = {RequestMethod.GET ,  RequestMethod.POST}) 
	public String login() {

		
		return "user/login";
	}
	
	@RequestMapping(value = "login_chk", method = {RequestMethod.POST}) 
	@ResponseBody
	public String login_chk(@Param("user_email") String user_email,@Param("user_password") String user_password,HttpServletRequest request) {
	
		if(userservice.login(user_email, user_password)==1) {
			HttpSession session = request.getSession();
			   session.setAttribute("user", user_email);

		}
		
		return Integer.toString(userservice.login(user_email, user_password));


	}
	
	
	@RequestMapping(value = "tokens", method = {RequestMethod.POST})
	@ResponseBody
	public String tokens(Model model,@RequestParam("idtoken") String idtoken,HttpServletRequest request)throws Exception {
	
	
		
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
	    .setAudience(Collections.singletonList("589581046105-skr2iee57c8j3o02lsl3g284ts0g0ks9.apps.googleusercontent.com"))
	    .build();

		GoogleIdToken idToken = verifier.verify(idtoken);
		if (idToken != null) {
		  Payload payload = idToken.getPayload();
	
		
		  String user_email = payload.getEmail();
	
	
		  //이메일이 중복일경우 로그인
		  if(userservice.emailchk(user_email) >= 1 ) {		
				HttpSession session = request.getSession();
				   session.setAttribute("user", user_email);
				   
				
				   
				   return "1";
			 }
		  //아닐경우 가입후 자동 로그인
			 else {
				 int authorization = 4; // sns 회원은 메일인증이 필요없어서 인증등급부여
		 
				TempKey tempkey = new TempKey();   
				String user_password = tempkey.getKey(20, false);//sns회원이라서 랜덤 비밀번호생성
				
				userservice.snsjoin_insert(user_email,user_password,authorization); 
				
	 
				 return "0";
			
			 }
		
  
		} else {
		  System.out.println("Invalid ID token.");
		  
		}
		return "includes/header";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	 @RequestMapping(value="/logout")
	    public String logout(HttpSession session) {
	        session.invalidate(); // 로그아웃시 세션 전체를 날려버림
	        return "redirect:/"; 

	 }
	
	
	// 가입
	@RequestMapping(value = "signup", method = {RequestMethod.GET ,  RequestMethod.POST}) 
	public String signup() {

		
		return "user/signup";
	}
	
	


	// 비밀번호 찾기
	@RequestMapping(value = "pwfind", method = {RequestMethod.GET ,  RequestMethod.POST}) 
	public String pwfind() {

		
		return "user/pwfind";
	}
	
	
	
	//가입 
	@RequestMapping(value = "signup_go" , method = {RequestMethod.POST}) 
	public String signup_go(@Param("user_email") String user_email,@Param("user_password") String user_password,HttpServletRequest request) {

	TempKey tempkey = new TempKey();             
		String key = tempkey.getKey(30, false); //랜덤으로 이루어진 인증키 30사이즈 생성       
		
		int authorization = 5; //비인증회원  

	
		userservice.join_insert(user_email,user_password,key,authorization); 
			 
		mailsender.mailSendWithUserKey(user_email,key,request); 
		   
		   
		return "user/login";
	}
	
	@RequestMapping(value = "key_alter" , method = {RequestMethod.GET}) 
	public String key_alter(@Param("user_email") String user_email,@Param("user_emailauthkey") String user_emailauthkey,Model model) {
	
		
		 String auth = "";
		
		if(userservice.keychk(user_email,user_emailauthkey)==1) {
			userservice.auth_ok(user_email); //이메일 인증 되었으므로 등급 4로 변경
			auth = "인증되었습니다.";
			model.addAttribute("auth", auth);
			return "user/auth";
		}else{
			auth = "인증이 이미 완료되었거나 불가한 상태입니다.";
			model.addAttribute("auth", auth);
			return "user/auth";
		}
		   

	}
	
	
	@RequestMapping(value = "auth" , method = {RequestMethod.GET ,  RequestMethod.POST}) 
	public String auth(){

		return "user/auth";
	}
	
	
	
	
	
	@RequestMapping(value = "emailchk" , method = {RequestMethod.GET ,  RequestMethod.POST}) 
	@ResponseBody 
	public String emailchk(@Param ("user_email") String user_email){

		return Integer.toString(userservice.emailchk(user_email));
	}
	
	
	//인터셉터
	@RequestMapping(value = "logininterceptor" , method = {RequestMethod.GET ,  RequestMethod.POST}) 
	public String interceptor(){

		return "user/logininterceptor";
	}
	
}
