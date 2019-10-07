package com.btl.findjob.service;

import java.util.List;

import com.btl.findjob.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btl.findjob.mapper.MypageMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MypageServiceImpl implements MypageService {

    @Autowired
    MypageMapper mapper;

    @Override
    public List<CompanyListVO> followCompanyGetList(String userEmail, MypageCriteria criteria) {
        return mapper.followCompanyGetListWithPage(userEmail, criteria);
    }

    @Override
    public int getTotalFollowCount(String userEmail) {
        return mapper.getTotalFollowCount(userEmail);
    }

    @Override
    public List<CompanyListVO> getRecentCompanyList(String userEmail, String[] recentArr) {
        return mapper.getRecentCompanyList(userEmail, recentArr);
    }

    @Override
    public List<CompanyReview> myReviewComment(int user_id) {
        return mapper.myReviewComment(user_id);
    }

    @Override
    public List<InterviewReviewDTO> myInterviewReview(int user_id) {
        return mapper.myInterviewReview(user_id);
    }


}
