package com.btl.findjob.service;

import com.btl.findjob.model.KakaoPayApprovalVO;

import java.util.List;

public interface KakaoPayService {

    void insert(KakaoPayApprovalVO kakaoPayApprovalVO);

    KakaoPayApprovalVO get(String user_id);

    void update(String user_id);
}
