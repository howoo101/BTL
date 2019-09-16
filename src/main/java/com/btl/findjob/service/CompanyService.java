package com.btl.findjob.service;

import java.util.List;

import com.btl.findjob.model.CompanyInfoDTO;
import com.btl.findjob.model.CompanyListVO;
import com.btl.findjob.model.FollowVO;

public interface CompanyService {

	public List<CompanyInfoDTO> companyGetList(String keyword, String startNum);
	public List<CompanyListVO> companyGetListWithCnt(String keyword, String startNum);
	
	public int companyInsertFollow(FollowVO vo);
	public void companyDeleteFollow(String followId);
}
