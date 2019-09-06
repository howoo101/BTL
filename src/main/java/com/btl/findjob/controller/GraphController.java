package com.btl.findjob.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.btl.findjob.model.PersonInfoGraphDTO;
import com.btl.findjob.service.PersonGraphService;

@Controller
public class GraphController {
	
	@Inject
	PersonGraphService personGraphService;
	
	@RequestMapping(value="/info")
	public String infoController(Model model, PersonInfoGraphDTO pigdto) {
		
		model.addAttribute("graph", personGraphService.personGetGraph(pigdto.getCi_companyName()));
		
		return "/info";
	}
}
