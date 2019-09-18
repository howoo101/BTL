package com.btl.findjob.service;


import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.CompanyReviewCriteria;
import com.btl.findjob.model.CompanyReviewPageDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CompanyReviewService {

    int insertCompanyReview(CompanyReview companyReview) throws Exception;

    CompanyReviewPageDTO getListWithPaging(CompanyReviewCriteria companyReviewCriteria, int ci_id) throws Exception;

    double totalStarRtAve(String ci_companyName);

    double categoryStarRtAve(String ci_companyName,int cr_category);
}
