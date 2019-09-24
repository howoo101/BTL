package com.btl.findjob.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.btl.findjob.model.CompanyListVO;
import com.btl.findjob.model.MypageCriteria;

public interface MypageService {
	
//	public List<CompanyListVO> followCompanyGetList(String userEmail);
	public List<CompanyListVO> followCompanyGetList(String userEmail,MypageCriteria criteria);
	public int getTotalFollowCount(String userEmail);	
	public List<CompanyListVO> getRecentCompanyList(@Param("userEmail") String userEmail, @Param("recentArr") String[] recentArr);
}
