package com.btl.findjob.mapper;

import java.util.List;

import com.btl.findjob.model.*;
import org.apache.ibatis.annotations.Param;

public interface AdminMapper {
	public List<UserDTO> getList();
	
	public List<UserDTO> getListWithPaging(AdminCriteria cri);
	
	public int getTotalCount(AdminCriteria cri);
	  
	List<CompanyReview> myReviewComment(int user_id);
	
	List<InterviewReviewDTO> myInterviewReview(int user_id);
   
	public void grade_modify(@Param("user_id")int user_id,@Param("authorization_id")String authorization_id);

	public List<UserDTO> user_search(String user_name);

	List<QnADTO> adminAnswerList();

	void updateAdminAnswer(QnADTO qnADTO);

    void deleteIR(String ir_id);

	void deleteCR(String cr_id);
}
