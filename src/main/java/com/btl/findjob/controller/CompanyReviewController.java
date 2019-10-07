package com.btl.findjob.controller;

import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.CompanyReviewCriteria;
import com.btl.findjob.model.CompanyReviewPageDTO;
import com.btl.findjob.service.CompanyReviewService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/companyReview/")
@Log4j
@AllArgsConstructor
public class CompanyReviewController {

    private CompanyReviewService companyReviewService;

    @PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> insertCompanyReview(@RequestBody CompanyReview companyReview) throws Exception {

        int insertCount = companyReviewService.insertCompanyReview(companyReview);

        return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

    }

    //페이지 처리 위해서 수정
    @GetMapping(value = "/pages/{ci_id}/{cr_category}/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<CompanyReviewPageDTO> getListWithPaging(@PathVariable("page") int page, @PathVariable("cr_category") int cr_category, @PathVariable("ci_id") int ci_id) throws Exception {

        CompanyReviewCriteria companyReviewCriteria = new CompanyReviewCriteria(page, 5);

        return new ResponseEntity<>(companyReviewService.getListWithPaging(companyReviewCriteria, cr_category, ci_id), HttpStatus.OK);
    }

    @GetMapping(value = "/{cr_id}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<CompanyReview> get(@PathVariable("cr_id") int cr_id) {

        return new ResponseEntity<>(companyReviewService.get(cr_id), HttpStatus.OK);
    }

    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
            value = "/{cr_id}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE, MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<String> interviewModify(@RequestBody CompanyReview companyReview, @PathVariable("cr_id") int cr_id) {
        companyReview.setCr_id(cr_id);
        return companyReviewService.commentModify(companyReview) == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
}