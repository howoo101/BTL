package com.btl.findjob.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.btl.findjob.model.SessionListener;
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
import com.mysql.cj.Session;



@Controller
public class UserController {

	@Inject
	MailSendService mailsender;
	
	@Autowired
	UserService userservice;
	
	
	private static final HttpTransport transport = new NetHttpTransport();
	private static final  JsonFactory jsonFactory = new JacksonFactory();


	
	// 로그인 창
	@RequestMapping(value = "login", method = {RequestMethod.GET ,  RequestMethod.POST}) 
	public String login() {

		
		return "user/login";
	}
	
	//로그인 체크 로직
	@RequestMapping(value = "login_chk", method = {RequestMethod.POST}) 
	@ResponseBody
	public String login_chk(@Param("user_email") String user_email,@Param("user_password") String user_password,HttpServletRequest request,Model model) {
		
		if(userservice.snschk(user_email)>=1) { //sns회원인지  판별 (아닐경우)
			return userservice.snstype(user_email);  //snstype이 무엇인지 확인함 sns회원이므로 일반 로그인 실패 처리
		} else {
			 String memberSalt = userservice.getsalt(user_email); // 멤버의 salt 가져오기
			 String inputpassword = user_password;  //입력된 암호 가져오기
			 String newpassword = SHA256Util.getEncrypt(inputpassword, memberSalt); // 가져온 salt을 이용하여 sha 암호 get
						  
			  if(userservice.login(user_email, newpassword)==1)  {  //로그인 검증 
				
				HttpSession session = request.getSession(true);     //로그인 세션 추가
		
				     if(SessionListener.getInstance().isUsing(user_email)) {  // 중복로그인 검사
				        	return "3";
				        }
				     else {
					session.setAttribute("user", user_email); // 세션추가
					session.setAttribute("name", userservice.getname(user_email)); //닉네임 겟 
					SessionListener.getInstance().setSession(session, user_email);//로그인을 완료한 사용자의 아이디를 세션에 저장
					return "1"; //인증회원 로그인
				     }
				  }  
				 else if(userservice.login(user_email, newpassword)==0){
					return "2"; // 로그인 실패 
				  }
			}
		return "4";
	}
	
	//구글 sns
	@RequestMapping(value = "google", method = {RequestMethod.POST})
	@ResponseBody
	public String google(@RequestParam("idtoken") String idtoken,HttpServletRequest request)throws Exception {

		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
	    .setAudience(Collections.singletonList("589581046105-skr2iee57c8j3o02lsl3g284ts0g0ks9.apps.googleusercontent.com"))
	    .build();

		GoogleIdToken idToken = verifier.verify(idtoken);
		if (idToken != null) {
		  Payload payload = idToken.getPayload();
	
		  
		  String user_email = payload.getEmail();
		  String user_name = (String) payload.get("name");
		  
			HttpSession session = request.getSession();
			
		  //이메일이 중복일경우 로그인
			 
			  
			  if(userservice.snstype(user_email).equals("google")) {
				   session.setAttribute("user", user_email);
				   session.setAttribute("name", userservice.getname(user_email));
				   SessionListener.getInstance().setSession(session, user_email);
				   return "1";
			  		}
			  //아닐경우 가입 후 자동 로그인
			 else if(userservice.snstype(user_email) == null || userservice.snstype(user_email) == "") {
				 int authorization = 4; // sns 회원은 메일인증이 필요없어서 인증등급부여
		 
				TempKey tempkey = new TempKey();   
				String key = tempkey.getKey(20, false);//sns회원이라서 랜덤 비밀번호생성
				
				String salt = SHA256Util.generateSalt();
				String user_password = SHA256Util.getEncrypt(key, salt);
				
				String sns_key = "test";
				String sns_type = "google";
				
				//sns 회원가입 (인증키가 없고 비밀번호는 랜덤비밀번호를 사용 (사실상 일반회원로그인이 안되게 막은것))
				userservice.snsjoin_insert(user_email,user_name,user_password,authorization,sns_key,sns_type);
				session.setAttribute("user", user_email);
				session.setAttribute("name", userservice.getname(user_email));
				SessionListener.getInstance().setSession(session, user_email);
			 return "3";
			 }
		 else {
			 return "2";
			}
		} 
		else {
		  System.out.println("토큰이없음");
		}
		return "4";
	}
	
	

//카카오
@RequestMapping(value = "kakao", method = {RequestMethod.POST})
@ResponseBody
public String kakao(@RequestParam("user_email") String user_email,@RequestParam("user_name") String user_name,HttpServletRequest request)throws Exception {

HttpSession session = request.getSession();

//이메일이 중복일경우 로그인
  if(userservice.snstype(user_email).equals("kakao")) {
   session.setAttribute("user", user_email);
   session.setAttribute("name", userservice.getname(user_email));
   SessionListener.getInstance().setSession(session, user_email);
   return "1";
  }
	
  //아닐경우 가입 후 자동 로그인
 else if(userservice.snstype(user_email) == null || userservice.snstype(user_email) == ""){
	int authorization = 4; // sns 회원은 메일인증이 필요없어서 인증등급부여
 
	TempKey tempkey = new TempKey();   
	String key = tempkey.getKey(20, false);//sns회원이라서 랜덤 비밀번호생성
	
	String salt = SHA256Util.generateSalt();
	String user_password = SHA256Util.getEncrypt(key, salt);
	
	
	String sns_key = "test";
	String sns_type = "kakao";
	
	//sns 회원가입 (인증키가 없고 비밀번호는 랜덤비밀번호를 사용 (사실상 일반회원로그인이 안되게 막은것))
	userservice.snsjoin_insert(user_email,user_name,user_password,authorization,sns_key,sns_type); 
	session.setAttribute("user", user_email);
	session.setAttribute("name", userservice.getname(user_email));
	SessionListener.getInstance().setSession(session, user_email);

 return "3";
 	}
 else {
	  return "2";
	  }
  
} 
	
//네이버
	@RequestMapping(value = "naver", method = {RequestMethod.POST})
	@ResponseBody
	public String naver(@RequestParam("user_email") String user_email,@RequestParam("user_name") String user_name,HttpServletRequest request)throws Exception {
	
	HttpSession session = request.getSession();
	
	//이메일이 중복일경우 로그인
  if(userservice.snstype(user_email).equals("naver")) {
   session.setAttribute("user", user_email);
   session.setAttribute("name", userservice.getname(user_email));
   SessionListener.getInstance().setSession(session, user_email);
   return "1";
  }
	  //아닐경우 가입 후 자동 로그인
 else if(userservice.snstype(user_email) == null || userservice.snstype(user_email) == ""){
	 int authorization = 4; // sns 회원은 메일인증이 필요없어서 인증등급부여
	TempKey tempkey = new TempKey();   
	String key = tempkey.getKey(20, false);//sns회원이라서 랜덤 비밀번호생성
		
	String salt = SHA256Util.generateSalt();
	String user_password = SHA256Util.getEncrypt(key, salt);
		
	String sns_key = "test";
	String sns_type = "naver";
	
	//sns 회원가입 (인증키가 없고 비밀번호는 랜덤비밀번호를 사용 (사실상 일반회원로그인이 안되게 막은것))
	userservice.snsjoin_insert(user_email,user_name,user_password,authorization,sns_key,sns_type); 
	session.setAttribute("user", user_email);
	session.setAttribute("name", userservice.getname(user_email));
	SessionListener.getInstance().setSession(session, user_email);
	 return "3";		
	 }
  else {
	  return "2";
  	}

} 
	
@RequestMapping(value = "callback", method = {RequestMethod.GET ,  RequestMethod.POST})
public String callback()throws Exception {

	return "user/callback";
	} 

	
	
	
 @RequestMapping(value="/logout")
    public String logout(HttpSession session) {
	   SessionListener.getInstance().removeSession(SessionListener.getInstance().getUserID(session));
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

	
	// 비밀번호 찾기 
	@RequestMapping(value = "pwfind_go", method = {RequestMethod.GET ,  RequestMethod.POST}) 
	@ResponseBody 
	public String pwfind_go(@Param("user_email") String user_email,HttpServletRequest request) {

		
		TempKey tempkey = new TempKey();             
		String key  = tempkey.getKey(10, false); //임시비밀번호 10사이즈 생성       
		
		String salt = SHA256Util.generateSalt();
		String newpassword = SHA256Util.getEncrypt(key, salt); //임시비밀번호 암호화 처리
		
		if(userservice.snstype(user_email)== "" || userservice.snstype(user_email)==null) {
   	    userservice.pw_modify(newpassword, salt, user_email);  //비밀번호 업데이트
		mailsender.tempkey_submit(user_email, key, request);  // 수정된 비밀번호를 전송
		return "1";
		}
	
		return "2";
	}
	
	
	//이메일 인증코드 발송
	@RequestMapping(value = "auth_submit" , method = {RequestMethod.POST}) 
	@ResponseBody
	public String auth_submit(@Param("user_email") String user_email,HttpServletRequest request) throws IOException {

		TempKey tempkey = new TempKey();             
		String key = tempkey.getKey(15, false); //랜덤으로 이루어진 인증키 15사이즈 생성       
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("authkey");
		
		//세션에 인증키 임시등록
		if(obj==null) {
		session.setAttribute("authkey", key);
		mailsender.mailSendWithUserKey(user_email, key, request);
		return "1";
		}
		else{
		session.removeAttribute("authkey");
		session.setAttribute("authkey", key);
		mailsender.mailSendWithUserKey(user_email, key, request);
		return "1";
		}
		

	}
	
	//이메일 인증코드 확인
	
	@RequestMapping(value = "auth_check" , method = {RequestMethod.POST}) 
	@ResponseBody
	public String auth_check(@Param("auth_key") String auth_key,HttpServletRequest request) {

		HttpSession session = request.getSession();
		String emauth_key = (String)session.getAttribute("authkey");
		
		if(auth_key.equals(emauth_key)) {
		   session.invalidate();
		return "1";
		}
		return "2";
		   
	}
	
	//가입 
	@RequestMapping(value = "signup_go" , method = {RequestMethod.POST}) 
	@ResponseBody
	public String signup_go(@Param("user_email") String user_email,@Param("user_password") String user_password,@Param("user_name") String user_name,HttpServletRequest request) {

	String salt = SHA256Util.generateSalt();
	String newPassword = SHA256Util.getEncrypt(user_password, salt);
	

		int authorization = 4; //인증회원  

	
		userservice.join_insert(user_email,newPassword,user_name,authorization,salt); 
		
		return "1";
		   
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
		ltr += "if(result) {$('#loginModal').modal('show');";
		ltr += "}else {";
		ltr += "history.back();";
		ltr += "}";
		ltr += "});";
		ltr += "</script>";
		
		mv.addObject("ltr", ltr);
		
		return  mv;
		
		
	}
	
	
		
	@RequestMapping(value = "user_info" , method = {RequestMethod.GET,RequestMethod.POST}) 
	public String user_info(HttpSession session,Model model){
		
		String user_email = (String) session.getAttribute("user");
	
		model.addAttribute("Uinfo_list", userservice.user_info(user_email));
		 
		
		return "mypage/user_info";
	}
		
	
	@RequestMapping(value = "user_info_modify" , method = {RequestMethod.POST}) 
	@ResponseBody
	public String user_info_modify(@Param("user_email") String user_email,@Param("user_password") String user_password,@Param("user_name") String user_name){
		
		String salt = SHA256Util.generateSalt();
		String newPassword = SHA256Util.getEncrypt(user_password, salt);
		
		userservice.user_info_modify(user_email, newPassword, user_name, salt);

		
		return "1";
	}
	
	
		
}
