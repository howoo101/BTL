package com.btl.findjob.mapper;

import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.CompanyReviewCriteria;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CompanyReviewMapper {

   public int insertCompanyReview(CompanyReview companyReview);

    public CompanyReview read(int cr_id);

    public  List<CompanyReview> getListWithPaging(@Param("companyReviewCriteria") CompanyReviewCriteria companyReviewCriteria, @Param("ci_id") int ci_id);

    public  int getCountByCi_id(int ci_id);
}
