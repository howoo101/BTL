package com.btl.findjob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btl.findjob.mapper.AdminMapper;
import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.InterviewReviewDTO;
import com.btl.findjob.model.UserDTO;

@Service
public class AdminServicelmpl implements AdminService {
	
@Autowired
AdminMapper mapper;

	@Override
	public List<CompanyReview> myReviewComment(int user_id) {
		// TODO Auto-generated method stub
		return mapper.myReviewComment(user_id);
	}

	@Override
	public List<InterviewReviewDTO> myInterviewReview(int user_id) {
		// TODO Auto-generated method stub
		return mapper.myInterviewReview(user_id);
	}

	
	@Override
	public List<UserDTO> get_userlist() {
		// TODO Auto-generated method stub
		return mapper.get_userlist();
	}
	  
}
