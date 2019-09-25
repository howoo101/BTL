package com.btl.findjob.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

import java.util.List;

@Getter
@Data
@AllArgsConstructor
public class InterviewReviewPageDTO {

    private int interviewReviewCnt;
    private List<InterviewReviewDTO> interviewReviewDTOList;

}
