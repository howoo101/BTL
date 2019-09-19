package com.btl.findjob.mapper;

import java.util.List;

import com.btl.findjob.model.CompanyListVO;

public interface MypageMapper {
	public List<CompanyListVO> followCompanyGetList(String userEmail);
}
