package com.btl.findjob.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.btl.findjob.model.CompanyInfoDTO;
import com.btl.findjob.model.CompanyListVO;
import com.btl.findjob.model.FollowVO;

public interface CompanyMapper {
	
	public List<CompanyInfoDTO>companyGetList(@Param("keyword") String keyword,@Param("startNum") String startNum);
	public List<CompanyListVO>companyGetListWithCnt(@Param("keyword") String keyword,@Param("startNum") String startNum);
	public List<CompanyListVO>companyGetListWithCntWithLogin(@Param("userEmail") String userEmail,@Param("keyword") String keyword,@Param("startNum") String startNum);
	
	//follow
	public void companyInsertFollow(@Param("userEmail") String userEmail,@Param("ci_id") int ciId);
	public void companyDeleteFollow(@Param("followId") String followId);
	
	//index 리스트
	public List<CompanyListVO> getManyFollowOrdersList();
	public List<CompanyListVO> getManyInterviewReviewOrdersList();
	public List<CompanyListVO> getMostCt0OrdersList();
	public List<CompanyListVO> getMostCt1OrdersList();
	public List<CompanyListVO> getMostCt2OrdersList();
	public List<CompanyListVO> getMostCt3OrdersList();
}
