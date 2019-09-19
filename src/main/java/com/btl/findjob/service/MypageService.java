package com.btl.findjob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


import com.btl.findjob.model.CompanyListVO;

public interface MypageService {
	
	public List<CompanyListVO> followCompanyGetList(String userEmail);
		
	
}
