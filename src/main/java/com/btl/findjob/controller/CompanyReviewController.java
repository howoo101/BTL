package com.btl.findjob.controller;

import com.btl.findjob.model.BoardPageDTO;
import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.CompanyReviewCriteria;
import com.btl.findjob.model.CompanyReviewPageDTO;
import com.btl.findjob.service.BoardService;
import com.btl.findjob.service.CompanyReviewService;
import com.google.common.base.Utf8;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
    @GetMapping(value = "/pages/{ci_id}/{cr_category}/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<CompanyReviewPageDTO> getListWithPaging(@PathVariable("page") int page,@PathVariable("cr_category") int cr_category, @PathVariable("ci_id")  int ci_id) throws Exception {

        CompanyReviewCriteria companyReviewCriteria= new CompanyReviewCriteria(page, 5);

        return new ResponseEntity<>(companyReviewService.getListWithPaging(companyReviewCriteria,cr_category, ci_id),HttpStatus.OK);
    }
}
