package com.btl.findjob.service;


import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.CompanyReviewCriteria;
import com.btl.findjob.model.CompanyReviewPageDTO;

import java.util.List;

public interface CompanyReviewService {

    int insertCompanyReview(CompanyReview companyReview);

    CompanyReview get(int cr_id);

    List<CompanyReview> getList(CompanyReviewCriteria companyReviewCriteria, int ci_id);

    CompanyReviewPageDTO getListPage(CompanyReviewCriteria companyReviewCriteria, int ci_id);


}
