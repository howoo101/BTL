package com.btl.findjob.service;


import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.CompanyReviewCriteria;
import com.btl.findjob.model.CompanyReviewPageDTO;

import java.util.List;

public interface CompanyReviewService {

    int insertCompanyReview(CompanyReview companyReview) throws Exception;

    CompanyReviewPageDTO getListWithPaging(CompanyReviewCriteria companyReviewCriteria, int ci_id) throws Exception;

    double getStarRtAvg(int cr_category, int ci_id);

}
