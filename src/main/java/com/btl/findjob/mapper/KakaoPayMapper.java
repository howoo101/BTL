package com.btl.findjob.mapper;

import com.btl.findjob.model.KakaoPayApprovalVO;

import java.util.List;

public interface KakaoPayMapper {

    void insert(KakaoPayApprovalVO kakaoPayApprovalVO);

    KakaoPayApprovalVO get(String user_id);

}
