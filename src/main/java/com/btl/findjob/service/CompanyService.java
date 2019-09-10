package com.btl.findjob.service;

import java.util.List;

import com.btl.findjob.model.CompanyInfoDTO;
import com.btl.findjob.model.CompanyListVO;

public interface CompanyService {

	public List<CompanyInfoDTO> companyGetList(String keyword, String startNum);
	public List<CompanyListVO> companyGetListWithCnt(String keyword, String startNum);
	
}
