package com.btl.findjob.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.btl.findjob.model.AdminCriteria;
import com.btl.findjob.model.BoardCriteria;
import com.btl.findjob.model.BoardDTO;
import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.InterviewReviewDTO;
import com.btl.findjob.model.UserDTO;

public interface AdminMapper {
	public List<UserDTO> getList();
	
	public List<UserDTO> getListWithPaging(AdminCriteria cri);
	
	public int getTotalCount(AdminCriteria cri);
	  
	List<CompanyReview> myReviewComment(int user_id);
	
	List<InterviewReviewDTO> myInterviewReview(int user_id);
   
	public void grade_modify(@Param("user_id")int user_id,@Param("authorization_id")String authorization_id);

	public List<UserDTO> user_search(String user_name);
}
