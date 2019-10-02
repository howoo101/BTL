package com.btl.findjob.service;

import java.util.List;

import com.btl.findjob.model.CompanyInfoDTO;
import com.btl.findjob.model.CompanyListVO;
import com.btl.findjob.model.FollowVO;

public interface CompanyService {

	public List<CompanyInfoDTO> companyGetList(String keyword, String startNum);
	public List<CompanyListVO> companyGetListWithCnt(String keyword, String startNum);
	public List<CompanyListVO> companyGetListWithCntWithLogin(String userEmail,String keyword, String startNum);
	
	public void companyInsertFollow(String userEmail,int ciId);
	public void companyDeleteFollow(String followId);
	public int getFollowId(String userEmail, String ciId);
	
	//index
	public List<CompanyListVO> getManyFollowOrdersList();
	public List<CompanyListVO> getManyInterviewReviewOrdersList();
	public List<CompanyListVO> getMostCt0OrdersList();
	public List<CompanyListVO> getMostCt1OrdersList();
	public List<CompanyListVO> getMostCt2OrdersList();
	public List<CompanyListVO> getMostCt3OrdersList();
	
}
