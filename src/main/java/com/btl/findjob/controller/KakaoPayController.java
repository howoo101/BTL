package com.btl.findjob.controller;

import com.btl.findjob.service.KakaoPayService;
import com.btl.findjob.utils.KakaoPay;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;

@Log4j
@Controller
@SessionAttributes("user_id")
@AllArgsConstructor
public class KakaoPayController {

    private KakaoPay kakaopay;

    private KakaoPayService kakaoPayService;

    @GetMapping("kakaoPay")
    public void kakaoPayGet() {
    }

    @PostMapping("kakaoPay")
    public String kakaoPay(HttpSession httpSession) {
        String user_id = (String) httpSession.getAttribute("user_id");

        log.info(user_id);
        log.info(kakaopay.kakaoPayReady(user_id));
        return "redirect:" + kakaopay.kakaoPayReady(user_id);

    }

    @GetMapping("kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam(value="pg_token") String pg_token, Model model, HttpSession httpSession) {
        String user_id = (String) httpSession.getAttribute("user_id");
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);

        //db
        kakaoPayService.insert(kakaopay.kakaoPayInfo(pg_token, user_id));

        //회원 등급
        kakaoPayService.update(user_id);

        model.addAttribute("info",kakaoPayService.get(user_id));

        log.info(model);

    }

}