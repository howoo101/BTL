package com.btl.findjob.mapper;

import java.util.List;

import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.InterviewReviewDTO;
import org.apache.ibatis.annotations.Param;

import com.btl.findjob.model.CompanyListVO;
import com.btl.findjob.model.MypageCriteria;

public interface MypageMapper {
	public List<CompanyListVO> followCompanyGetList(String userEmail);
	public List<CompanyListVO> followCompanyGetListWithPage(@Param("userEmail") String userEmail,@Param("criteria")MypageCriteria criteria);
	public int getTotalFollowCount(String userEmail);
	public List<CompanyListVO> getRecentCompanyList(@Param("userEmail") String userEmail, @Param("recentArr") String[] recentArr);

	List<CompanyReview> myReviewComment(int user_id);

	List<InterviewReviewDTO> myInterviewReview(int user_id);
}
