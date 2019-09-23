package com.btl.findjob.controller;

import com.btl.findjob.model.ReplyDTO;
import com.btl.findjob.service.InterviewReviewService;
import lombok.extern.log4j.Log4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
@Log4j
@Controller
@RequestMapping("/interviewReview")
public class InterviewReviewController {

    private InterviewReviewService interviewReviewService;

//    @PostMapping(value="/new", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
//    public ResponseEntity<String> create(@RequestBody ReplyDTO dto) {
//
////        int insertCount = interviewReviewService.replyRegister(dto);
//
////        log.info("InterviewReview INSERT COUNT :"+insertCount);
//
//        return insertCount == 1
//                ? new ResponseEntity<>("success", HttpStatus.OK)
//                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//
//    }
}
