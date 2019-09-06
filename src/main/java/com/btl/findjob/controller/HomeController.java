package com.btl.findjob.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
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
	public void info(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

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
