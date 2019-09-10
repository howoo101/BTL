package com.btl.findjob.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.btl.findjob.service.EnterpriseService;
import com.btl.findjob.service.SshService;

@Controller
public class SshController {
	//서송현 테스트 작업공간 시작  =============================================
	@Autowired
	EnterpriseService service;

		@RequestMapping(value = "companyinfo_content", method = {RequestMethod.GET ,  RequestMethod.POST})
		public String company_content(@Param ("ci_companyName") String ci_companyName,Model model) {
			
	
			model.addAttribute("companyList", service.companyList(ci_companyName)); //기업정보 리스트
			
			model.addAttribute("cptotal", service.cptotal(ci_companyName)); //인원 구하기 쿼리
			
			model.addAttribute("cpsince", service.cpSince(ci_companyName)); //업력 구하기 쿼리
			
			model.addAttribute("tmin",service.tmin(ci_companyName)); //이번달 입사자
			
			model.addAttribute("tmout", service.tmout(ci_companyName));  //이번달 퇴사자
			

		
			
			model.addAttribute("sincerank", Math.round((double) service.allcprank(ci_companyName) * 100 / service.allcp(ci_companyName)*100)/100.0); // 동종업계 업력 % 순위 

		
			
			model.addAttribute("latestcptotal", Math.round ((double) service.alltotalrank(ci_companyName)*100 / service.latestallcp(ci_companyName)*100)/100.0);  // 동종업계  인원 순위 (최신 달)
			
			
			model.addAttribute("alltminrank", Math.round((double)service.alltminrank(ci_companyName) * 100 / service.latestallcp(ci_companyName)*100)/100.0); // 동종업계 이번달 입사자 % 순위 (최신 달) 
			
			model.addAttribute("alltmoutrank", Math.round((double)service.alltmoutrank(ci_companyName) * 100 / service.latestallcp(ci_companyName)*100)/100.0); // 동종업계 이번달 퇴사자 % 순위 (최신 달)
			
			
			

			
			
			
			return "companyInfo_contentsshpart";
		}
		

		
		// 모달 테스트
		@RequestMapping(value = "sshmodal", method = {RequestMethod.GET ,  RequestMethod.POST})
		public String sshtest() {

			
			return "sshmodal";
		}
		
	
		// header 모달 테스트
		@RequestMapping(value = "sshheader", method = {RequestMethod.GET ,  RequestMethod.POST}) 
		public String sshheader() {

			
			return "includes/sshheader";
		}

		
		// 로그인 호출
		@RequestMapping(value = "sshlogin", method = {RequestMethod.GET ,  RequestMethod.POST}) 
		public String sshlogin() {

			
			return "sshlogin";
		}
		
		
		// 회원가입 호출
		@RequestMapping(value = "sshregi", method = {RequestMethod.GET ,  RequestMethod.POST}) 
		public String sshregi() {

			
			return "sshregi";
		}
		
		

		// 비밀번호찾기 호출
		@RequestMapping(value = "sshpwfind", method = {RequestMethod.GET ,  RequestMethod.POST}) 
		public String sshpwfind() {

			
			return "sshpwfind";
		}
		
		
		// 로그인 확인
		@RequestMapping(value = "sshlogin_chk", method = {RequestMethod.GET ,  RequestMethod.POST}) 
		public String sshlogin_chk(@Param("user_email")String user_email,@Param("user_password")String user_password ) {
				System.out.println(user_email);
				System.out.println(user_password);
			return "includes/sshheader";
		}
	
		
		
		
		//서송현 테스트 작업 끝===========================================================
		
		
		
		
		
}
