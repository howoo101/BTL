package com.btl.findjob.controller;

import java.util.Collections;

import javax.inject.Inject;
import javax.servlet.http.HttpServlet;
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
import org.springframework.web.servlet.ModelAndView;

import com.btl.findjob.model.SHA256Util;
import com.btl.findjob.model.TempKey;
import com.btl.findjob.service.MailSendService;
import com.btl.findjob.service.UserService;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
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
	public String login_chk(@Param("user_email") String user_email,@Param("user_password") String user_password,HttpServletRequest request,Model model) {
		
		if(userservice.snschk(user_email)>=1) { //sns회원인지 먼저 판별 (아닐경우)
			return userservice.snstype(user_email);  //로그인실패 sns회원이므로 sns 로그인을 해야 된다.
		} else {
			 String memberSalt = userservice.getsalt(user_email); // 멤버의 salt 가져오기
			 String inputpassword = user_password;  //입력된 암호 가져오기
			 String newpassword = SHA256Util.getEncrypt(inputpassword, memberSalt); // 가져온 salt을 이용하여 sha 암호 get
						  
			  if(userservice.login(user_email, newpassword)==1)  { 
					HttpSession session = request.getSession();  //로그인 세션 추가
					session.setAttribute("user", user_email); 
					
					if(userservice.gradechk(user_email)==5) { //비인증회원로그인
						session.setAttribute("non_auth", user_email);  // 비인증회원 세션 추가
						return "2"; 
					}
					return "1"; //인증회원 로그인
				  }  
		
			  
				 else if(userservice.login(user_email, newpassword)==0){
					return "3"; // 로그인 실패 
				  }

			}
		return "4";
	}
	
	//구글 sns
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
				   
		
				   // sns 정보는 항상 변화할수있으니까 로그인할때마다 sns info 테이블 업데이트
	
				   
				   return "1";
			 }
		  //아닐경우 가입후 자동 로그인
			 else {
				 int authorization = 4; // sns 회원은 메일인증이 필요없어서 인증등급부여
		 
				TempKey tempkey = new TempKey();   
				String user_password = tempkey.getKey(20, false);//sns회원이라서 랜덤 비밀번호생성
				
				String sns_key = "test";
				String sns_type = "google";
				
				//sns 회원가입 (인증키가 없고 비밀번호는 랜덤비밀번호를 사용 (사실상 일반회원로그인이 안되게 막은것))
				userservice.snsjoin_insert(user_email,user_password,authorization,sns_key,sns_type); 
	
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
	public String signup_go(@Param("user_email") String user_email,@Param("user_password") String user_password,@Param("user_name") String user_name,HttpServletRequest request) {

		
	String salt = SHA256Util.generateSalt();
	String newPassword = SHA256Util.getEncrypt(user_password, salt);
	
	TempKey tempkey = new TempKey();             
		String key = tempkey.getKey(30, false); //랜덤으로 이루어진 인증키 30사이즈 생성       
		
		int authorization = 5; //비인증회원  

	
		userservice.join_insert(user_email,newPassword,user_name,key,authorization,salt); 
			 
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
	
	
	//로그인 인터셉터
	@RequestMapping(value = "logininterceptor" , method = {RequestMethod.GET ,  RequestMethod.POST}) 
	public ModelAndView interceptor(){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");

		String ltr = "";	
		ltr += "<script langueage='JavaScript'>";
		ltr += "$(window).on('load',function(){";
		ltr += "var result = confirm('로그인이 필요한 영역입니다. 로그인 하시겠습니까?');";
		ltr += "if(result) {$('#myModal').modal('show');";
		ltr += "}else {";
		ltr += "history.back();";
		ltr += "}";
		ltr += "});";
		ltr += "</script>";
		
		mv.addObject("ltr", ltr);
		
		return  mv;
		
		
	}
	
	//등급 인터셉터
		@RequestMapping(value = "gradeceptor" , method = {RequestMethod.GET ,  RequestMethod.POST}) 
		public ModelAndView gradeceptor(){
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("index");
			
			String gtr = "";	
			gtr += "<script langueage='JavaScript'>";
			gtr += "alert('인증이 되지않은 회원 입니다 메일 인증을 해주세요')";
			gtr += "</script>";
			
			mv.addObject("gtr", gtr);
	
			return mv;
		}
		
		//인증 이메일 다시보내기
		@RequestMapping(value = "re_auth" , method = {RequestMethod.GET ,  RequestMethod.POST}) 
		@ResponseBody 
		public String reauth(@Param ("user_email") String user_email,HttpServletRequest request){
			
				TempKey tempkey = new TempKey();             
				String key = tempkey.getKey(30, false); //랜덤으로 이루어진 인증키 30사이즈 생성       
				
				userservice.upkey(user_email, key);
				mailsender.mailSendWithUserKey(user_email,key,request);
	
	
			return "1";
		}

	
		
}
