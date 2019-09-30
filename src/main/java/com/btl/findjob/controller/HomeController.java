package com.btl.findjob.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.mail.internet.NewsAddress;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.btl.findjob.mapper.CompanyMapper;
import com.btl.findjob.model.CompanyListVO;
import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.MypageCriteria;
import com.btl.findjob.model.MypagePageDTO;
import com.btl.findjob.service.CompanyReviewService;
import com.btl.findjob.service.CompanyService;
import com.btl.findjob.service.InterviewReviewService;
import lombok.extern.log4j.Log4j;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.btl.findjob.model.MypageCriteria;
import com.btl.findjob.model.MypagePageDTO;
import com.btl.findjob.service.CompanyReviewService;
import com.btl.findjob.service.EnterpriseService;
import com.btl.findjob.service.MypageService;
import com.btl.findjob.utils.CookieUtils;
import com.btl.findjob.utils.NaverSearchAPI;

import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
public class HomeController {
	
	@Autowired
	EnterpriseService enterService;
	@Autowired
	CompanyService companyService;
	
	
	private CompanyReviewService companyReviewService;

	@Autowired
	public void setCompanyReviewService(CompanyReviewService companyReviewService){
	    this.companyReviewService=companyReviewService;
    };

	private InterviewReviewService interviewReviewService;

	@Autowired
	public void setInterviewReviewService(InterviewReviewService interviewReviewService){
		this.interviewReviewService=interviewReviewService;
	};

	@Autowired
	MypageService mypageService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home (Model model) {
		// 코드 더러움 개선이 필요해
		Map<String,List<CompanyListVO>> map1 = new HashMap<>();
		Map<String,Map<String,List<CompanyListVO>>> map2 = new HashMap<>();
		Map<String,List<CompanyListVO>> tmpMap1 = new HashMap<>();
		Map<String,List<CompanyListVO>> tmpMap2 = new HashMap<>();
		map1.put("follow 많은 기업", companyService.getManyFollowOrdersList());
		map1.put("면접리뷰 많은 기업", companyService.getManyInterviewReviewOrdersList());
		
		tmpMap1.put("승진 기회 및 가능성", companyService.getMostCt0OrdersList());
		tmpMap1.put("복지 및 급여", companyService.getMostCt1OrdersList());
		map2.put("1",tmpMap1);
		tmpMap2.put("워라벨", companyService.getMostCt2OrdersList());
		tmpMap2.put("사내문화", companyService.getMostCt3OrdersList());
		map2.put("2",tmpMap2);
		
		model.addAttribute("map1", map1);
		model.addAttribute("map2", map2);
		return "index";
	}

	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info(@Param ("ci_companyName") String ci_companyName,
			@Param ("ci_id") String ci_id,HttpServletResponse res,
			Model model,HttpServletRequest req) {
		logger.info("기업 상세 페이지");
		System.out.println(ci_id);
		Cookie[] cookies = req.getCookies();
		Cookie cookie = CookieUtils.getCookie(cookies, "ciId");
		if(cookie != null) {
			if(!cookie.getValue().contains(ci_id)) {
				String tmp = cookie.getValue();
			//최근본기업 5개까지
			if (tmp.split("/").length > 4) {
				tmp = tmp.substring(0,tmp.lastIndexOf("/"));
			}
			cookie = new Cookie("ciId",ci_id+"/"+tmp);
			cookie.setMaxAge(60*60);
			res.addCookie(cookie);
			}
		}else {
			cookie = new Cookie("ciId",ci_id);
			cookie.setMaxAge(60*60);
			res.addCookie(cookie);
		}
		
		
		String userEmail = (String)req.getSession().getAttribute("user");
		if(userEmail == null) userEmail = "";
		//Enterpise 영역 (송현)
		model.addAttribute("companyList", enterService.companyList(userEmail,ci_companyName)); //기업정보 리스트
		model.addAttribute("cptotal", enterService.cptotal(ci_companyName)); //인원 구하기 쿼리
		model.addAttribute("cpsince", enterService.cpSince(ci_companyName)); //업력 구하기 쿼리
		model.addAttribute("tmin",enterService.tmin(ci_companyName)); //이번달 입사자
		model.addAttribute("tmout", enterService.tmout(ci_companyName));  //이번달 퇴사자
		model.addAttribute("sincerank", Math.round((double) enterService.allcprank(ci_companyName) * 100 / enterService.allcp(ci_companyName)*100)/100.0); // 동종업계 업력 % 순위 
		model.addAttribute("latestcptotal", Math.round ((double) enterService.alltotalrank(ci_companyName)*100 / enterService.latestallcp(ci_companyName)*100)/100.0);  // 동종업계  인원 순위 (최신 달)
		model.addAttribute("alltminrank", Math.round((double)enterService.alltminrank(ci_companyName) * 100 / enterService.latestallcp(ci_companyName)*100)/100.0); // 동종업계 이번달 입사자 % 순위 (최신 달) 
		model.addAttribute("alltmoutrank", Math.round((double)enterService.alltmoutrank(ci_companyName) * 100 / enterService.latestallcp(ci_companyName)*100)/100.0); // 동종업계 이번달 퇴사자 % 순위 (최신 달)
		//Enterprise End
		
		//info model
		model.addAttribute("ci_companyName", ci_companyName);

		//ave
		model.addAttribute("totalStarRt", companyReviewService.totalStarRtAve(ci_companyName));

		//model에 넘기기 위해서
		List<Map<String,Object>> data = new ArrayList<>();

		Map<String, Object> map = new HashMap<>();

		List<Double> categoryAve = new ArrayList<>();
		List<String> categoryName = new ArrayList<>();
		List<Integer> categoryCtn = new ArrayList<>();
		List<Integer> getStarCtn = new ArrayList<>();

		for (int i = 0; i < 4; i++) {

			categoryAve.add(companyReviewService.categoryStarRtAve(ci_companyName, i));
			categoryName.add(companyReviewService.categoryName(i));
			categoryCtn.add(companyReviewService.getCountByCategory(ci_companyName, i));
			map.put("categoryCtn",categoryCtn);
			map.put("categoryName",categoryName);
			map.put("categoryAve", categoryAve);

			data.add(map);
		}

		//기업 리뷰 차트정보
		for (int i = 1; i < 6; i++) {
			getStarCtn.add(companyReviewService.getStarCtn(ci_companyName,i));
			model.addAttribute("starCtn", getStarCtn);
		}
		model.addAttribute("map", data);

		// news
		NaverSearchAPI api = new NaverSearchAPI();
		List<String[]> list = api.result(ci_companyName);
		
		model.addAttribute("news", list);
		
		



		//면접 차트 정보
		String[] difficultyArr = {"쉬움","약간 쉬움","보통","약간 어려움", "어려움"};
		List<Integer> difficultyList = new ArrayList<>();

		for (String s : difficultyArr) {
			difficultyList.add(interviewReviewService.difficultyCnt(ci_companyName, s));
			model.addAttribute("difficultyList", difficultyList);
		}

		String[] expArr = {"부정적","보통","긍정적"};
		List<Integer> expList = new ArrayList<>();

		for (String s : expArr) {
			expList.add(interviewReviewService.expCnt(ci_companyName, s));
			model.addAttribute("expList", expList);
		}

		String[] resultArr = {"합격", "불합격", "대기중"};
		List<Integer> resultList = new ArrayList<>();
		for(String s: resultArr){
			resultList.add(interviewReviewService.resultCnt(ci_companyName,s));
			model.addAttribute("resultList",resultList);
		}
    return "info";
	}

	@RequestMapping(value = "/myPage_Following", method = RequestMethod.GET)
	public String myPage_Following(MypageCriteria criteria,Model model,HttpServletRequest req) {
		logger.info("mypage following");
		String userEmail = (String)req.getSession().getAttribute("user");
		model.addAttribute("companyList",mypageService.followCompanyGetList(userEmail,criteria));
		int total = mypageService.getTotalFollowCount(userEmail);
		model.addAttribute("pageMaker", new MypagePageDTO(criteria,total));
		return "myPage_Following";
	}

	@RequestMapping(value = "/myPage_InterviewReview", method = RequestMethod.GET)
	public String myPage_InterviewReview(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "myPage_InterviewReview";
	}

	@RequestMapping(value = "/myPage_Last", method = RequestMethod.GET)
	public String myPage_Last(HttpServletRequest req, Model model) {
		String userEmail = (String)req.getSession().getAttribute("user");
		String[] arr = null; 
		arr = CookieUtils.getValues(req.getCookies(), "ciId");
		
		model.addAttribute("companyList",
				mypageService.getRecentCompanyList(userEmail, arr));
		return "myPage_Last";
	}

	@RequestMapping(value = "/myPage_ReviewComment", method = RequestMethod.GET)
	public String myPage_ReviewComment(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "myPage_ReviewComment";
	}
	
	@RequestMapping(value="/faq")
	public String FAQ() {
		return "/faq";
	}


}
