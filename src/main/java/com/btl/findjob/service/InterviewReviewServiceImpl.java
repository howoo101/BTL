package com.btl.findjob.service;

import com.btl.findjob.mapper.InterviewReviewMapper;
import com.btl.findjob.model.*;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
public class InterviewReviewServiceImpl implements InterviewReviewService {

    private InterviewReviewMapper interviewReviewMapper;

    @Override
    public int interviewReviewRegister(InterviewReviewDTO interviewReviewDTO) {
        return  interviewReviewMapper.interviewReviewRegister(interviewReviewDTO);
    }

    @Override
    public InterviewReviewPageDTO getListPage(InterviewReviewCriteria interviewReviewCriteria, int ci_id) {
        return new InterviewReviewPageDTO(interviewReviewMapper.getCount(ci_id), interviewReviewMapper.getListWithPaging(interviewReviewCriteria,ci_id));
    }

    @Override
    public int difficultyCnt(int ci_id, String ir_difficulty) {
        return interviewReviewMapper.difficultyCnt(ci_id, ir_difficulty);
    }

    @Override
    public int expCnt(int ci_id, String ir_experience) {
        return interviewReviewMapper.expCnt(ci_id, ir_experience);
    }

    @Override
    public int resultCnt(int ci_id, String ir_result) {
        return interviewReviewMapper.resultCnt(ci_id, ir_result);
    }

    @Override
    public InterviewReviewDTO get(int ir_id) {
        return interviewReviewMapper.get(ir_id);
    }

    @Override
    public int interviewModify(InterviewReviewDTO interviewReviewDTO) {
        return interviewReviewMapper.interviewModify(interviewReviewDTO);
    }

}
