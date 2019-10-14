package com.btl.findjob.service;

import java.util.List;

import com.btl.findjob.mapper.QnAMapper;
import com.btl.findjob.model.*;
import lombok.AllArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btl.findjob.mapper.AdminMapper;

@Service
@AllArgsConstructor
public class AdminServicelmpl implements AdminService {

    AdminMapper mapper;

    QnAMapper qnAMapper;

    @Override
    public List<CompanyReview> myReviewComment(int user_id) {
        return mapper.myReviewComment(user_id);
    }

    @Override
    public List<InterviewReviewDTO> myInterviewReview(int user_id) {
        return mapper.myInterviewReview(user_id);
    }


    @Override
    public List<UserDTO> getList(AdminCriteria cri) {
        return mapper.getListWithPaging(cri);
    }

    @Override
    public void grade_modify(@Param("user_id") int user_id, @Param("authorization_id") String authorization_id) {

        mapper.grade_modify(user_id, authorization_id);

    }

    @Override
    public List<UserDTO> user_search(String user_name) {
        return mapper.user_search(user_name);
    }

    @Override
    public List<QnADTO> adminAnswerList() {
        return mapper.adminAnswerList();
    }

    @Override
    public void updateAdminAnswer(QnADTO qnADTO) {
        mapper.updateAdminAnswer(qnADTO);
    }

    @Override
    public void deleteIR(String ir_id) {
        mapper.deleteIR(ir_id);
    }

    @Override
    public void deleteCR(String cr_id) {
        mapper.deleteCR(cr_id);
    }

    @Override
    public int getTotal(AdminCriteria cri) {
        return mapper.getTotalCount(cri);
    }

}
