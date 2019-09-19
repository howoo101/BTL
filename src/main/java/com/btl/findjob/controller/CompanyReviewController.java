package com.btl.findjob.controller;

import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.CompanyReviewCriteria;
import com.btl.findjob.model.CompanyReviewPageDTO;
import com.btl.findjob.service.CompanyReviewService;
import com.google.common.base.Utf8;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/companyReview/")
@Log4j
@AllArgsConstructor
public class CompanyReviewController {

    private CompanyReviewService companyReviewService;

    @PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> insertCompanyReview(@RequestBody CompanyReview companyReview) throws Exception {

        log.info("CompanyReview : "+companyReview);

        int insertCount = companyReviewService.insertCompanyReview(companyReview);

        return insertCount ==1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

    }

    //페이지 처리 위해서 수정
    @GetMapping(value = "/reviewList")
    public void list(int ci_id, @RequestParam(defaultValue = "1") int cr_category, @RequestParam(defaultValue = "1") int pageNum, HttpServletRequest httpServletRequest) throws Exception {
        httpServletRequest.setCharacterEncoding("utf-8");

        Map<String, Integer> dataReview = new HashMap<>();
        dataReview.put("pageNum", pageNum);
        dataReview.put("ci_id", ci_id);
        dataReview.put("cr_category", cr_category);

        Map<String,Object> mapData = new HashMap<>();
        List<CompanyReview> reviewList = companyReviewService.getReviewsList(dataReview);
        Map<String,Integer> reviewPageDate = companyReviewService

    }

}
