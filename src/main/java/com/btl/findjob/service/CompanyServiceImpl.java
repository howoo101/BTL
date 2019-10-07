package com.btl.findjob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btl.findjob.mapper.CompanyMapper;
import com.btl.findjob.model.CompanyInfoDTO;
import com.btl.findjob.model.CompanyListVO;
import com.btl.findjob.model.FollowVO;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    CompanyMapper mapper;

    @Override
    public List<CompanyInfoDTO> companyGetList(String keyword, String startNum) {

        return mapper.companyGetList(keyword, startNum);
    }

    @Override
    public List<CompanyListVO> companyGetListWithCnt(String keyword, String startNum) {
        return mapper.companyGetListWithCnt(keyword, startNum);
    }


    @Override
    public List<CompanyListVO> companyGetListWithCntWithLogin(String userEmail, String keyword, String startNum) {
        return mapper.companyGetListWithCntWithLogin(userEmail, keyword, startNum);
    }

    @Override
    public void companyInsertFollow(String userEmail, int ciId) {

        mapper.companyInsertFollow(userEmail, ciId);
    }

    @Override
    public void companyDeleteFollow(String followId) {
        mapper.companyDeleteFollow(followId);
    }

    @Override
    public List<CompanyListVO> getManyFollowOrdersList() {
        return mapper.getManyFollowOrdersList();
    }

    @Override
    public List<CompanyListVO> getManyInterviewReviewOrdersList() {
        return mapper.getManyInterviewReviewOrdersList();
    }

    @Override
    public List<CompanyListVO> getMostCt0OrdersList() {
        return mapper.getMostCt0OrdersList();
    }

    @Override
    public List<CompanyListVO> getMostCt1OrdersList() {
        return mapper.getMostCt1OrdersList();
    }

    @Override
    public List<CompanyListVO> getMostCt2OrdersList() {
        return mapper.getMostCt2OrdersList();
    }

    @Override
    public List<CompanyListVO> getMostCt3OrdersList() {
        return mapper.getMostCt3OrdersList();
    }

    @Override
    public int getFollowId(String userEmail, String ciId) {
        return mapper.getFollowId(userEmail, ciId);
    }

}
