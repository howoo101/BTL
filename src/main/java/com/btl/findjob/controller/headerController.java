package com.btl.findjob.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.btl.findjob.service.UserService;

@Controller
public class headerController {

	@Autowired
	UserService userservice;
	
	@RequestMapping(value = "emailchk" , method = {RequestMethod.GET ,  RequestMethod.POST}) 
	@ResponseBody 
	public String emailchk(@Param ("user_email") String user_email){


		return Integer.toString(userservice.emailchk(user_email));
	}
	
}
