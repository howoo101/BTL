package com.btl.findjob.utils;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.UUID;

import com.btl.findjob.model.KakaoPayApprovalVO;
import com.btl.findjob.model.KakaoPayReadyVO;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

@Service
@Log4j
public class KakaoPay {

    private static final String HOST = "https://kapi.kakao.com";

    private static final String QUANTITY = "1";//주문수량 고정
    private static final String TOTAL_AMOUNT = "1000000"; //가격 고정
    private static final String TAX_FREE_AMOUNT = "10000";//제세
    private static final String APPROVAL_URL = "http://localhost:8282/findjob/kakaoPaySuccess";//성공 URL
    private static final String CANCEL_URL = "http://localhost:8282/findjob/kakaoPayCancel";//취소 URL
    private static final String FAIL_URL = "http://localhost:8282/findjob/kakaoPaySuccessFail";//실패 URL
    private static final String ITEM_NAME = "프리미엄회원권";//성공 URL
    private static final String partner_order_id = UUID.randomUUID().toString();//주문 고유번호 생성 위해서 or random?

    private KakaoPayReadyVO kakaoPayReadyVO;
    RestTemplate restTemplate = new RestTemplate();

    public static HttpHeaders headers() {
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        String[] headerName = {"Authorization", "Accept", "Content"};
        String[] headerValue = {"KakaoAK " + "6a4a878f48138ae2ac9a1e42f4033df7", "application/x-www-form-urlencoded;charset=utf-8", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8"};

        for (int i = 0; i <  headerName.length; i++) {
            headers.add(headerName[i], headerValue[i]);
        }
//        headers.add("Authorization", "KakaoAK " + "6a4a878f48138ae2ac9a1e42f4033df7");
//        headers.add("Accept", "application/x-www-form-urlencoded;charset=utf-8");
//        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

        return headers;
    }

    public String kakaoPayReady(String user_id) {

        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");//사업장 고유번호
        params.add("partner_order_id", partner_order_id);//주문번호 uuid 사용
        params.add("partner_user_id", user_id);//
        params.add("item_name", ITEM_NAME);
        params.add("quantity", QUANTITY);
        params.add("total_amount", TOTAL_AMOUNT);
        params.add("tax_free_amount", TAX_FREE_AMOUNT);
        params.add("approval_url", APPROVAL_URL);
        params.add("cancel_url", CANCEL_URL);
        params.add("fail_url", FAIL_URL);

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers());
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            log.info("" + kakaoPayReadyVO);

            //성공시
            return kakaoPayReadyVO.getNext_redirect_pc_url();

        } catch (RestClientException | URISyntaxException e) {
            e.printStackTrace();
        }

        return "pay";
        //실패시

    }

    public KakaoPayApprovalVO kakaoPayInfo(String pg_token, String user_id) {

        // 서버로 요청할 Header

        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", partner_order_id);
        params.add("partner_user_id", user_id);
        params.add("pg_token", pg_token);
        params.add("total_amount", TOTAL_AMOUNT);//금액

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers());

        try {
            KakaoPayApprovalVO kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            log.info("" + kakaoPayApprovalVO);

            return kakaoPayApprovalVO;

        } catch (RestClientException | URISyntaxException e) {
            e.printStackTrace();
        }

        return null;
    }

}