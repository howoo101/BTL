package com.btl.findjob.service;

import com.btl.findjob.model.*;
import org.apache.ibatis.annotations.Param;

public interface InterviewReviewService {
    int interviewReviewRegister(InterviewReviewDTO interviewReviewDTO);

    InterviewReviewPageDTO getListPage(InterviewReviewCriteria interviewReviewCriteria, int ci_id);

    int difficultyCnt(int ci_id, String ir_difficulty);

    int expCnt(int ci_id, String ir_experience);

    int resultCnt(int ci_id, String ir_result);

}
