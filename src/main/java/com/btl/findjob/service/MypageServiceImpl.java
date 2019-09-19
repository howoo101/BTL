package com.btl.findjob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btl.findjob.mapper.MypageMapper;
import com.btl.findjob.model.CompanyListVO;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageMapper mapper;
	
	@Override
	public List<CompanyListVO> followCompanyGetList(String userEmail) {
		// TODO Auto-generated method stub
		return mapper.followCompanyGetList(userEmail);
	}

}
