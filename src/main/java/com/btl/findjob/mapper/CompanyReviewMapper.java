package com.btl.findjob.mapper;

import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.CompanyReviewCriteria;
import com.btl.findjob.model.CompanyReviewPageDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CompanyReviewMapper {

    int insertCompanyReview(CompanyReview companyReview);

    List<CompanyReview> getListWithPaging(@Param("companyReviewCriteria") CompanyReviewCriteria companyReviewCriteria, @Param("ci_id") int ci_id) throws Exception;

    int crTotalCount(int ci_id) throws Exception;

    //숫자 파악위해서 사용N
    int getCount(int ci_id);

    double totalStarRtAve(String ci_companyName);

    double categoryStarRtAve(@Param("ci_companyName") String ci_companyName, @Param("cr_category") int cr_category);

    String categoryName(int cr_category);

    int getCountByCategory(@Param("ci_companyName") String ci_companyName, @Param("cr_category") int cr_category);

}

