package com.btl.findjob.service;


import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.CompanyReviewCriteria;
import com.btl.findjob.model.CompanyReviewPageDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CompanyReviewService {

    int insertCompanyReview(CompanyReview companyReview) throws Exception;

    CompanyReviewPageDTO getListWithPaging(CompanyReviewCriteria companyReviewCriteria, int ci_id) throws Exception;

    double getStarRtAvg(@Param("cr_category") int cr_category, @Param("ci_companyName") String ci_companyName) throws Exception;

}
