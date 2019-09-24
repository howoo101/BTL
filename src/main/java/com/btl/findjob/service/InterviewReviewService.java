package com.btl.findjob.service;

import com.btl.findjob.model.*;
import org.apache.ibatis.annotations.Param;

public interface InterviewReviewService {
    int interviewReviewRegister(InterviewReviewDTO interviewReviewDTO);

    InterviewReviewPageDTO getListPage(InterviewReviewCriteria interviewReviewCriteria, int ci_id);

    int difficultyCnt(String ci_companyName, String ir_difficulty);

    int expCnt(String ci_companyName, String ir_experience);

    int resultCnt(String ci_companyName, String ir_result);

}
