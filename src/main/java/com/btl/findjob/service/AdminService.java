package com.btl.findjob.service;

import java.util.List;


import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.InterviewReviewDTO;
import com.btl.findjob.model.UserDTO;

public interface AdminService {

public List<UserDTO> get_userlist();

List<CompanyReview> myReviewComment(int user_id);

List<InterviewReviewDTO> myInterviewReview(int user_id);


}
