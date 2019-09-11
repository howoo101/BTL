package com.btl.findjob.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.btl.findjob.service.EnterpriseService;
import com.btl.findjob.service.UserService;

@Controller
public class SshController {
	//�꽌�넚�쁽 �뀒�뒪�듃 �옉�뾽怨듦컙 �떆�옉  =============================================
	@Autowired
	private EnterpriseService service;

	


		@RequestMapping(value = "companyinfo_content", method = {RequestMethod.GET ,  RequestMethod.POST})
		public String company_content(@Param ("ci_companyName") String ci_companyName,Model model) {
			
	
			model.addAttribute("companyList", service.companyList(ci_companyName)); //湲곗뾽�젙蹂� 由ъ뒪�듃
			
			model.addAttribute("cptotal", service.cptotal(ci_companyName)); //�씤�썝 援ы븯湲� 荑쇰━
			
			model.addAttribute("cpsince", service.cpSince(ci_companyName)); //�뾽�젰 援ы븯湲� 荑쇰━
			
			model.addAttribute("tmin",service.tmin(ci_companyName)); //�씠踰덈떖 �엯�궗�옄
			
			model.addAttribute("tmout", service.tmout(ci_companyName));  //�씠踰덈떖 �눜�궗�옄
			

		
			
			model.addAttribute("sincerank", Math.round((double) service.allcprank(ci_companyName) * 100 / service.allcp(ci_companyName)*100)/100.0); // �룞醫낆뾽怨� �뾽�젰 % �닚�쐞 

		
			
			model.addAttribute("latestcptotal", Math.round ((double) service.alltotalrank(ci_companyName)*100 / service.latestallcp(ci_companyName)*100)/100.0);  // �룞醫낆뾽怨�  �씤�썝 �닚�쐞 (理쒖떊 �떖)
			
			
			model.addAttribute("alltminrank", Math.round((double)service.alltminrank(ci_companyName) * 100 / service.latestallcp(ci_companyName)*100)/100.0); // �룞醫낆뾽怨� �씠踰덈떖 �엯�궗�옄 % �닚�쐞 (理쒖떊 �떖) 
			
			model.addAttribute("alltmoutrank", Math.round((double)service.alltmoutrank(ci_companyName) * 100 / service.latestallcp(ci_companyName)*100)/100.0); // �룞醫낆뾽怨� �씠踰덈떖 �눜�궗�옄 % �닚�쐞 (理쒖떊 �떖)
			
		
			
			
			return "companyInfo_contentsshpart";
		}
		

		
		// 紐⑤떖 �뀒�뒪�듃
		@RequestMapping(value = "sshmodal", method = {RequestMethod.GET ,  RequestMethod.POST})
		public String sshtest() {

			
			return "sshmodal";
		}
		
	
		// header 紐⑤떖 �뀒�뒪�듃
		@RequestMapping(value = "sshheader", method = {RequestMethod.GET ,  RequestMethod.POST}) 
		public String sshheader() {

			
			return "includes/sshheader";
		}

		
		// 濡쒓렇�씤 �샇異�
		@RequestMapping(value = "sshlogin", method = {RequestMethod.GET ,  RequestMethod.POST}) 
		public String sshlogin() {

			
			return "sshlogin";
		}
		
		
		// �쉶�썝媛��엯 �샇異�
		@RequestMapping(value = "sshsignup", method = {RequestMethod.GET ,  RequestMethod.POST}) 
		public String sshregi() {

			
			return "sshsignup";
		}
		
		

	
		// 鍮꾨�踰덊샇李얘린 �샇異�
		@RequestMapping(value = "sshpwfind", method = {RequestMethod.GET ,  RequestMethod.POST}) 
		public String sshpwfind() {

			
			return "sshpwfind";
		}
		
		
		
		//가입 테스트
		@RequestMapping(value = "sshsignup_go" , method = {RequestMethod.GET ,  RequestMethod.POST}) 
		public String sshsignup_go() {

			
			return "/";
		}
		

		
		

		
		
		
		//�꽌�넚�쁽 �뀒�뒪�듃 �옉�뾽 �걹===========================================================
		
		
		
		
		
}

