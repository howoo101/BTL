package com.btl.findjob.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btl.findjob.mapper.AdminMapper;
import com.btl.findjob.model.AdminCriteria;
import com.btl.findjob.model.BoardCriteria;
import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.InterviewReviewDTO;
import com.btl.findjob.model.UserDTO;

@Service
public class AdminServicelmpl implements AdminService {

    @Autowired
    AdminMapper mapper;

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
	public int getTotal(AdminCriteria cri) {
		return mapper.getTotalCount(cri);
	}

}
