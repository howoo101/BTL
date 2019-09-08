package com.btl.findjob.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.btl.findjob.service.SshService;

@Controller
public class SshController {
	//서송현 테스트 작업공간 시작  (이 메서드를 참고 하고 변경 or 삭제  ㄱㄱ)=============================================
	@Autowired
	SshService service;

		@RequestMapping(value = "companyinfo_content", method = {RequestMethod.GET ,  RequestMethod.POST})
		public String company_content(@Param ("ci_companyName") String ci_companyName,Model model) {
			
	
			model.addAttribute("companyList", service.companyList(ci_companyName)); //기업정보 리스트
			
			model.addAttribute("cptotal", service.cptotal(ci_companyName)); //인원 구하기 쿼리
			
			model.addAttribute("cpsince", service.cpSince(ci_companyName)); //업력 구하기 쿼리
			
			model.addAttribute("tmin",service.tmin(ci_companyName)); //이번달 입사자
			
			model.addAttribute("tmout", service.tmout(ci_companyName));  //이번달 퇴사자
			

			model.addAttribute("sincerank", service.allcprank(ci_companyName) * 100 / service.allcp(ci_companyName)); // 동종업계 업력 % 순위 
		
			model.addAttribute("totalrank", service.alltotalrank(ci_companyName) * 100 / service.latestallcp(ci_companyName)); // 동종업계 인원 % 순위 (최신 달)
			
			model.addAttribute("alltminrank",service.alltminrank(ci_companyName) * 100 / service.latestallcp(ci_companyName)); // 동종업계 이번달 입사자 % 순위 (최신 달) 
			
			model.addAttribute("alltmoutrank", service.alltmoutrank(ci_companyName) * 100 / service.latestallcp(ci_companyName)); // 동종업계 이번달 퇴사자 % 순위 (최신 달)
			
			
			return "companyInfo_contentsshpart";
		}
		
		//서송현 테스트 작업 끝===========================================================
}
