package com.btl.findjob.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.btl.findjob.model.*;
import com.btl.findjob.service.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class AdminController {

    @Autowired
    AdminService adminservice;
    @Inject
    UserService userservice;
    @Autowired
    CompanyService companyService;

    QnAService qnAService;


    @RequestMapping(value = "admin_Menu", method = {RequestMethod.GET, RequestMethod.POST})
    public String admin_Menu() {
        return "admin/admin_Menu";
    }

    @RequestMapping(value = "admin_page", method = {RequestMethod.GET, RequestMethod.POST})
    public String admin_page(AdminCriteria cri, Model model) {
        model.addAttribute("user_list", adminservice.getList(cri));
        int total = adminservice.getTotal(cri);
        model.addAttribute("pageMaker", new AdminPageDTO(cri, total));
        return "admin/admin_page";
    }

    @RequestMapping(value = "admin_answer", method = {RequestMethod.GET, RequestMethod.POST})
    public String admin_answer(Model model) {
        model.addAttribute("answerList", adminservice.adminAnswerList());

        return "admin/admin_answer";
    }

    @GetMapping("admin_answerUpdate")
    public String getQnA(String qnA_id, Model model) {
        model.addAttribute("qnAList", qnAService.getQnA(qnA_id));
        return "admin/admin_answerUpdate";
    }

    @PostMapping("answerUpdate")
    public String answerUpdate(QnADTO qnADTO){
        adminservice.updateAdminAnswer(qnADTO);
    return "redirect:admin_answerUpdate";
    }

    @RequestMapping(value = "user_status", method = {RequestMethod.GET, RequestMethod.POST})
    public String user_status(Model model, @Param("user_email") String user_email) {

        model.addAttribute("Uinfo_list", userservice.user_info(user_email));

        return "admin/user_status";
    }

    @RequestMapping(value = "/user_InterviewReview", method = {RequestMethod.GET, RequestMethod.POST})
    public String user_InterviewReview(@Param("user_id") int user_id, Model model, @Param("user_email")String user_email) {

        model.addAttribute("user_id", user_id);
        model.addAttribute("user_email",user_email);
        System.out.println(model);
        model.addAttribute("myInterviewList", adminservice.myInterviewReview(user_id));

        return "admin/user_InterviewReview";
    }

    @RequestMapping(value = "/user_ReviewComment", method = {RequestMethod.GET, RequestMethod.POST})
    public String user_ReviewComment(@Param("user_id") int user_id, Model model, @Param("user_email")String user_email) {

        model.addAttribute("myReviewCommentList", adminservice.myReviewComment(user_id));
        model.addAttribute("user_email",user_email);

        return "admin/user_ReviewComment";
    }

    @GetMapping("adminIRdelete")
    public String adminIRdelete(String ir_id, String user_email){
        adminservice.deleteIR(ir_id);
        return "redirect:user_status?user_email="+user_email;
    }

    @GetMapping("adminCRdelete")
    public String adminCRdelete(String cr_id, String user_email){
        adminservice.deleteCR(cr_id);
        return "redirect:user_status?user_email="+user_email;
    }

    //관리자 인터셉터
    @RequestMapping(value = "adminceptor", method = {RequestMethod.GET, RequestMethod.POST})
    public String interceptor(Model model) {

        Map<String, List<CompanyListVO>> map1 = new HashMap<>();
        map1.put("follow 많은 기업", companyService.getManyFollowOrdersList());
        map1.put("면접리뷰 많은 기업", companyService.getManyInterviewReviewOrdersList());

        Map<Integer, Map<String, List<CompanyListVO>>> map2 = new HashMap<>();
        List<Map<String, List<CompanyListVO>>> list = new ArrayList<>();
        String[] categoryArr = companyService.getCategoryArr();
        for (int i = 0; i < categoryArr.length / 2; i++) {
            list.add(new HashMap<>());
            for (int j = 2 * i; j < categoryArr.length; j++) {
                if (list.get(i).size() == 2) continue;
                list.get(i).put(categoryArr[j], companyService.getMostCtOrdersList(j));
                if (j % 2 == 1) map2.put(i, list.get(i));
            }
        }

        model.addAttribute("map1", map1);
        model.addAttribute("map2", map2);

        String atr = "";
        atr += "<script>";
        atr += "Swal.fire({";
        atr += "type: 'warning',";
        atr += "html: '관리자 페이지입니다.<br> 관리자 계정으로 로그인 해주십시오.'";
        atr += "})";
        atr += "</script>";

        model.addAttribute("atr", atr);

        return "index";
    }

    @RequestMapping(value = "/grade_modify", method = {RequestMethod.POST})
    @ResponseBody
    public String grade_modify(@Param("authorization_id") String authorization_id, @Param("user_id") int user_id) {

        adminservice.grade_modify(user_id, authorization_id);
        return "1";
    }

    @RequestMapping(value = "user_search", method = {RequestMethod.GET})
    public String user_search(@Param("user_name") String user_name, Model model) {

        model.addAttribute("user_list", adminservice.user_search(user_name));
        return "admin/user_search";
    }
}
