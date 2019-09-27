package com.btl.findjob.utils;

import java.net.URI;
import java.net.URISyntaxException;

import com.btl.findjob.model.KakaoPayApprovalVO;
import com.btl.findjob.model.KakaoPayReadyVO;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import lombok.extern.java.Log;

@Service
@Log
public class KakaoPay {

    private static final String HOST = "https://kapi.kakao.com";

    private static final String QUANTITY = "1";//주문수량 고정
    private static final String TOTAL_AMOUNT = "1000000"; //가격 고정
    private static final String TAX_FREE_AMOUNT = "10000";//제세
    private static final String APPROVAL_URL ="http://localhost:8282/findjob/kakaoPaySuccess";//성공 URL
    private static final String CANCEL_URL ="http://localhost:8282/findjob/kakaoPayCancel";//성공 URL
    private static final String FAIL_URL ="http://localhost:8282/findjob/kakaoPaySuccessFail";//성공 URL
    private static final String ITEM_NAME ="프리미엄회원권";//성공 URL

    private KakaoPayReadyVO kakaoPayReadyVO;

    public String kakaoPayReady() {

        RestTemplate restTemplate = new RestTemplate();

        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "6a4a878f48138ae2ac9a1e42f4033df7");
        headers.add("Accept", "application/x-www-form-urlencoded;charset=utf-8");
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1012301");
        params.add("partner_user_id", "123123");
        params.add("item_name", "프리미엄권");
        params.add("quantity", QUANTITY);
        params.add("total_amount", TOTAL_AMOUNT);
        params.add("tax_free_amount", TAX_FREE_AMOUNT);
        params.add("approval_url",APPROVAL_URL);
        params.add("cancel_url", CANCEL_URL);
        params.add("fail_url", FAIL_URL);

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        System.out.println("body"+body);
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            log.info("" + kakaoPayReadyVO);

            return kakaoPayReadyVO.getNext_redirect_pc_url();

        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "pay";

    }

    public KakaoPayApprovalVO kakaoPayInfo(String pg_token) {

        log.info("KakaoPayInfoVO............................................");
        log.info("-----------------------------");

        RestTemplate restTemplate = new RestTemplate();

        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "6a4a878f48138ae2ac9a1e42f4033df7");
        headers.add("Accept", "application/x-www-form-urlencoded;charset=utf-8");
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", "1012301");
        params.add("partner_user_id", "123123");
        params.add("pg_token", pg_token);
        params.add("total_amount",TOTAL_AMOUNT);//금액

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

        try {
            KakaoPayApprovalVO kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            log.info("" + kakaoPayApprovalVO);

            return kakaoPayApprovalVO;

        } catch (RestClientException | URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }

}