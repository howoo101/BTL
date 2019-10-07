package com.btl.findjob.service;

import java.util.List;

import com.btl.findjob.model.*;
import org.apache.ibatis.annotations.Param;

public interface MypageService {

    public List<CompanyListVO> followCompanyGetList(String userEmail, MypageCriteria criteria);

    public int getTotalFollowCount(String userEmail);

    public List<CompanyListVO> getRecentCompanyList(@Param("userEmail") String userEmail, @Param("recentArr") String[] recentArr);

    List<CompanyReview> myReviewComment(int user_id);

    List<InterviewReviewDTO> myInterviewReview(int user_id);

}
