package com.btl.findjob.service;

import java.util.List;

import com.btl.findjob.model.CompanyInfoDTO;

public interface CompanyService {

	public List<CompanyInfoDTO>companyGetList(int startNum,String keyword);

}
