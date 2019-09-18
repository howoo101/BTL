package com.btl.findjob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btl.findjob.mapper.CompanyMapper;
import com.btl.findjob.model.CompanyInfoDTO;
import com.btl.findjob.model.CompanyListVO;
import com.btl.findjob.model.FollowVO;

@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Autowired
	CompanyMapper mapper;
	
	@Override
	public List<CompanyInfoDTO> companyGetList(String keyword,String startNum) {
		
		return mapper.companyGetList(keyword,startNum);
	}

	@Override
	public List<CompanyListVO> companyGetListWithCnt(String keyword, String startNum) {
		// TODO Auto-generated method stub
		return mapper.companyGetListWithCnt(keyword, startNum);
	}

	
	@Override
	public List<CompanyListVO> companyGetListWithCntWithLogin(String userEmail,String keyword, String startNum) {
		// TODO Auto-generated method stub
		return mapper.companyGetListWithCntWithLogin(userEmail,keyword, startNum);
	}
	
	@Override
	public void companyInsertFollow(String userEmail, int ciId) {
		// TODO Auto-generated method stub
		
		 mapper.companyInsertFollow(userEmail,ciId);
	}

	@Override
	public void companyDeleteFollow(String followId) {
		// TODO Auto-generated method stub
		mapper.companyDeleteFollow(followId);
	}
	
	

	
}
