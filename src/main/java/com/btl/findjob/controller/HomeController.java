package com.btl.findjob.controller;

import java.util.Locale;
import java.util.Map;

import com.btl.findjob.service.CompanyReviewService;
import com.sun.istack.internal.NotNull;
import lombok.NonNull;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.btl.findjob.service.EnterpriseService;

import javax.annotation.Nullable;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	EnterpriseService enterService;

	@Autowired
	CompanyReviewService companyReviewService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "index";
	}

	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void info(@Param ("ci_companyName") String ci_companyName, Model model) throws Exception {
		logger.info("기업 상세 페이지");
		//Enterpise 영역 (송현)
		model.addAttribute("companyList", enterService.companyList(ci_companyName)); //기업정보 리스트
		model.addAttribute("cptotal", enterService.cptotal(ci_companyName)); //인원 구하기 쿼리
		model.addAttribute("cpsince", enterService.cpSince(ci_companyName)); //업력 구하기 쿼리
		model.addAttribute("tmin",enterService.tmin(ci_companyName)); //이번달 입사자
		model.addAttribute("tmout", enterService.tmout(ci_companyName));  //이번달 퇴사자
		model.addAttribute("sincerank", Math.round((double) enterService.allcprank(ci_companyName) * 100 / enterService.allcp(ci_companyName)*100)/100.0); // 동종업계 업력 % 순위 
		model.addAttribute("latestcptotal", Math.round ((double) enterService.alltotalrank(ci_companyName)*100 / enterService.latestallcp(ci_companyName)*100)/100.0);  // 동종업계  인원 순위 (최신 달)
		model.addAttribute("alltminrank", Math.round((double)enterService.alltminrank(ci_companyName) * 100 / enterService.latestallcp(ci_companyName)*100)/100.0); // 동종업계 이번달 입사자 % 순위 (최신 달) 
		model.addAttribute("alltmoutrank", Math.round((double)enterService.alltmoutrank(ci_companyName) * 100 / enterService.latestallcp(ci_companyName)*100)/100.0); // 동종업계 이번달 퇴사자 % 순위 (최신 달)
		//Enterprise End
		
		//Graph model
		model.addAttribute("ci_companyName", ci_companyName);		

		//CompanyReviewAvg
				model.addAttribute("getStarRtOne", companyReviewService.getStarRtAvg(0, ci_companyName));
				model.addAttribute("getStarRtTwo", companyReviewService.getStarRtAvg(1, ci_companyName));
				model.addAttribute("getStarRtThr", companyReviewService.getStarRtAvg(2, ci_companyName));
				model.addAttribute("getStarRtFour", companyReviewService.getStarRtAvg(3, ci_companyName));

	}

	@RequestMapping(value = "/myPage_Following", method = RequestMethod.GET)
	public String myPage_Following(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "myPage_Following";
	}

	@RequestMapping(value = "/myPage_InterviewReview", method = RequestMethod.GET)
	public String myPage_InterviewReview(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "myPage_InterviewReview";
	}

	@RequestMapping(value = "/myPage_Last", method = RequestMethod.GET)
	public String myPage_Last(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "myPage_Last";
	}

	@RequestMapping(value = "/myPage_ReviewComment", method = RequestMethod.GET)
	public String myPage_ReviewComment(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "myPage_ReviewComment";
	}


}
