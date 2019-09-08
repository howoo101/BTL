package com.btl.findjob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btl.findjob.mapper.SshMapper;
import com.btl.findjob.model.CompanyInfoDTO;
import com.btl.findjob.model.CompanyPersonalDTO;

@Service
public class SshServiceImpl implements SshService {
	
	@Autowired
	SshMapper mapper;
	
	// 서송현 코딩 ===================================================
	@Override
	public List<CompanyInfoDTO> companyList(String ci_companyName) {
	
		return mapper.companyList(ci_companyName);
	}

	@Override
	public List<CompanyPersonalDTO> cpList(String ci_companyName) {
	
		return mapper.cpList(ci_companyName);
	}

	@Override
	public int cpSince(String ci_companyName) {

		return mapper.cpSince(ci_companyName);
	}

	@Override
	public int allcprank(String ci_companyName) {
		return mapper.allcprank(ci_companyName);
	}

	@Override
	public int allcp(String ci_companyName) {

		return mapper.allcp(ci_companyName);
	}

	@Override
	public int cptotal(String ci_companyName) {
		
		return mapper.cptotal(ci_companyName);
	}




	@Override
	public int alltotalrank(String ci_companyName) {
	
		 return mapper.alltotalrank(ci_companyName);
	}




	@Override
	public int latestallcp(String ci_companyName) {
	
		return mapper.latestallcp(ci_companyName);
	}




	@Override
	public int tmin(String ci_companyName) {
	
		return mapper.tmin(ci_companyName);
	}




	@Override
	public int alltminrank(String ci_companyName) {
		
		return mapper.alltminrank(ci_companyName);
	}




	@Override
	public int tmout(String ci_companyName) {
		// 
		return mapper.tmout(ci_companyName);
	}




	@Override
	public int alltmoutrank(String ci_companyName) {

		return mapper.alltmoutrank(ci_companyName);
	}

	// 서송현 코딩 끝 ===================================================

}
