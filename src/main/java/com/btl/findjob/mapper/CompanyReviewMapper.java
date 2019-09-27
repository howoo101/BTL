package com.btl.findjob.mapper;

import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.CompanyReviewCriteria;
import com.btl.findjob.model.CompanyReviewPageDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CompanyReviewMapper {

    int insertCompanyReview(CompanyReview companyReview);

    List<CompanyReview> getListWithPaging(@Param("companyReviewCriteria") CompanyReviewCriteria companyReviewCriteria,@Param("cr_category") int cr_category ,@Param("ci_id") int ci_id) throws Exception;

    int crTotalCount(int ci_id) throws Exception;

    //숫자 파악위해서 사용N
    int getCountCr(@Param("ci_id") int ci_id, @Param("cr_category") int cr_category);

    double totalStarRtAve(int ci_id);

    double categoryStarRtAve(@Param("ci_id") int ci_id, @Param("cr_category") int cr_category);

    String categoryName(int cr_category);

    int getStarCtn(@Param("ci_id") int ci_id, @Param("cr_starRt") int starRt);

    CompanyReview get(int cr_id);

    int commentModify(CompanyReview companyReview);
}

