package com.btl.findjob.mapper;

import com.btl.findjob.model.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface InterviewReviewMapper {

    int interviewReviewRegister(InterviewReviewDTO interviewReviewDTO);

    List<InterviewReviewDTO> getListWithPaging(@Param("interviewReviewCriteria") InterviewReviewCriteria interviewReviewCriteria, @Param("ci_id") int ci_id);

    int getCount(int ci_id);

    int difficultyCnt(@Param("ci_id") int ci_id, @Param("ir_difficulty") String ir_difficulty);

    int expCnt(@Param("ci_id") int ci_id, @Param("ir_experience") String ir_experience);

    int resultCnt(@Param("ci_id") int ci_id, @Param("ir_result") String ir_result);
}
