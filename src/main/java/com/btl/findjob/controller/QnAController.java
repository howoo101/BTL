package com.btl.findjob.controller;

import com.btl.findjob.model.QnADTO;
import com.btl.findjob.service.QnAService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@AllArgsConstructor
public class QnAController {

    private QnAService qnAService;

    @RequestMapping("QnA")
    public void list(Model model, HttpSession httpSession) {

        String qnA_user_id = (String) httpSession.getAttribute("user_id");
        model.addAttribute("list", qnAService.list(qnA_user_id));
        System.out.println(model);
    }

    @GetMapping("QnARegister")
    public String QnARegister() {
        return "QnARegister";
    }

    @PostMapping("QnARegister")
    public String QnARegister(QnADTO qnADTO) {
        qnAService.register(qnADTO);
        return "redirect:QnA";
    }

    @GetMapping("getQnA")
    public String getQnA(String qnA_id, Model model){
     model.addAttribute("qnAList", qnAService.getQnA(qnA_id));
     return "getQnA";
    }

}

