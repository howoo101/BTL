package com.btl.findjob.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.btl.findjob.model.CompanyInfoDTO;
import com.btl.findjob.model.CompanyListVO;
import com.btl.findjob.model.CompanyPersonalDTO;

public interface EnterpriseMapper {
	
	// 서송현 코딩================================================================= 
		public List<CompanyInfoDTO> companyList(String ci_companyName);
		
		public List<CompanyPersonalDTO> cpList(String ci_companyName);

		public int cpSince(String ci_companyName); 
		
		public int allcprank(String ci_companyName); 
		
		public int allcp(String ci_companyName);
		
		public int cptotal(String ci_companyName);
		
		public int alltotalrank(String ci_companyName);
		
		public int latestallcp(String ci_companyName);
		
		public int tmin(String ci_companyName);
		
		public int tmout(String ci_companyName);
		
		public int alltminrank(String ci_companyName);
		
		public int alltmoutrank(String ci_companyName);
		
		public int latestcptotal();
	
		public List<CompanyListVO> companyList(@Param("userEmail") String userEmail, @Param("companyName")String ci_companyName);
		
		
	//서송현 코딩 끝 ==========================================================================
		
        public int getSalary(String ci_companyName);
}
