package com.btl.findjob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btl.findjob.mapper.MypageMapper;
import com.btl.findjob.model.CompanyListVO;
import com.btl.findjob.model.MypageCriteria;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageMapper mapper;
	
	@Override
	public List<CompanyListVO> followCompanyGetList(String userEmail,MypageCriteria criteria) {
		// TODO Auto-generated method stub
		return mapper.followCompanyGetListWithPage(userEmail,criteria);
	}

	@Override
	public int getTotalFollowCount(String userEmail) {
		// TODO Auto-generated method stub
		return mapper.getTotalFollowCount(userEmail);
	}

	@Override
	public List<CompanyListVO> getRecentCompanyList(String userEmail, String[] recentArr) {
		// TODO Auto-generated method stub
		return mapper.getRecentCompanyList(userEmail, recentArr);
	}

}
