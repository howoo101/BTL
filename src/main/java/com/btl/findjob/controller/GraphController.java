package com.btl.findjob.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.btl.findjob.model.PersonInfoGraphDTO;
import com.btl.findjob.service.PersonGraphService;

@Controller
public class GraphController {

	@Inject
	PersonGraphService personGraphService;
	
	@RequestMapping(value = "/graphajax")
	public @ResponseBody List AjaxView(PersonInfoGraphDTO pigdto) {
		List tmp = personGraphService.personGetGraph(pigdto.getCi_companyName());
		System.out.println("ResponseBody :" + tmp);
		return tmp;
	}
}
