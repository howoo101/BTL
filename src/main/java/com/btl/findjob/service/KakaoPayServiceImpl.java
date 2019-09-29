package com.btl.findjob.service;

import com.btl.findjob.mapper.KakaoPayMapper;
import com.btl.findjob.model.KakaoPayApprovalVO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class KakaoPayServiceImpl implements KakaoPayService {

    private KakaoPayMapper kakaoPayMapper;

    @Override
    public void insert(KakaoPayApprovalVO kakaoPayApprovalVO) {
        kakaoPayMapper.insert(kakaoPayApprovalVO);
    }

    @Override
    public  KakaoPayApprovalVO get(String user_id) {
        return kakaoPayMapper.get(user_id);
    }

}
