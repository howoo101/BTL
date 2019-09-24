package com.btl.findjob.controller;

import com.btl.findjob.mapper.InterviewReviewMapper;
import com.btl.findjob.model.*;
import com.btl.findjob.service.InterviewReviewService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@Log4j
@RestController
@RequestMapping("/interviewReview")
@AllArgsConstructor
public class InterviewReviewController {

    private InterviewReviewService interviewReviewService;

    @PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> register(@RequestBody InterviewReviewDTO interviewReviewDTO) {

        int insertCount = interviewReviewService.interviewReviewRegister(interviewReviewDTO);

        log.info("InterviewReview INSERT COUNT :" + insertCount);

        return insertCount == 1
                ? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

    }

    @GetMapping(value = "/pages/{ci_id}/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<InterviewReviewPageDTO> getListWithPaging(@PathVariable("page") int page, @PathVariable("ci_id")  int ci_id) throws Exception {

        InterviewReviewCriteria interviewReviewCriteria= new InterviewReviewCriteria(page, 2);

        return new ResponseEntity<>(interviewReviewService.getListPage(interviewReviewCriteria, ci_id),HttpStatus.OK);
    }

}
