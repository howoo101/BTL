package com.btl.findjob.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.btl.findjob.model.CompanyInfoDTO;

public interface CompanyMapper {
	
	public List<CompanyInfoDTO>companyGetList(@Param("keyword") String keyword,@Param("startNum") String startNum);
}
