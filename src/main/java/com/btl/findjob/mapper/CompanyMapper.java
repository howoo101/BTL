package com.btl.findjob.mapper;

import java.util.List;

import com.btl.findjob.model.CompanyInfoDTO;

public interface CompanyMapper {
	public List<CompanyInfoDTO>companyGetList(CompanyInfoDTO ci_companyName);
	public List<CompanyInfoDTO>companyGetList2(String keyword);
}
