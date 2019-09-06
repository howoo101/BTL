package com.btl.findjob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.btl.findjob.mapper.CompanyMapper;
import com.btl.findjob.model.CompanyInfoDTO;

public class CompanyServiceImpl implements CompanyService {

	
	@Autowired
	CompanyMapper mapper;
	
	@Override
	public List<CompanyInfoDTO> companyGetList(String keyword,String startNum) {
		
		return mapper.companyGetList(keyword,startNum);
	}

	
}
