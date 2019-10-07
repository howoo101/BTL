package com.btl.findjob.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.InterviewReviewDTO;
import com.btl.findjob.model.UserDTO;

public interface AdminService {

public List<UserDTO> get_userlist();

List<CompanyReview> myReviewComment(int user_id);

List<InterviewReviewDTO> myInterviewReview(int user_id);

public void grade_modify(@Param("user_id")int user_id,@Param("authorization_id")String authorization_id);

public List<UserDTO> user_search(String user_name);


}
