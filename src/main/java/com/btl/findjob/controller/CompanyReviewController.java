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
    public ResponseEntity<String> insertCompanyReview(@RequestBody CompanyReview companyReview){

        log.info("CompanyReview : "+companyReview);

        int insertCount = companyReviewService.insertCompanyReview(companyReview);

        return insertCount ==1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

    }

    @GetMapping(value = "/{cr_id}")
    public ResponseEntity<CompanyReview> get(@PathVariable("cr_id") int cr_id){

        return new ResponseEntity<>(companyReviewService.get(cr_id),HttpStatus.OK);


    }

    @GetMapping(value = "/pages/{ci_id}/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<CompanyReviewPageDTO> getList(@PathVariable("page") int page, @PathVariable("ci_id")int ci_id) {

        CompanyReviewCriteria companyReviewCriteria = new CompanyReviewCriteria(page, 10);

        return new ResponseEntity<>(companyReviewService.getListPage(companyReviewCriteria, ci_id), HttpStatus.OK);
    }
}
