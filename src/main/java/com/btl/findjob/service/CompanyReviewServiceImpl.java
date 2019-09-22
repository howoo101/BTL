package com.btl.findjob.service;

import com.btl.findjob.mapper.CompanyReviewMapper;
import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.CompanyReviewCriteria;
import com.btl.findjob.model.CompanyReviewPageDTO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyReviewServiceImpl implements CompanyReviewService {
    @Setter(onMethod_ =@Autowired)
    private CompanyReviewMapper companyReviewMapper;

    @Override
    public int insertCompanyReview(CompanyReview companyReview) {return companyReviewMapper.insertCompanyReview(companyReview);
    }

    @Override
    public CompanyReviewPageDTO getListWithPaging(CompanyReviewCriteria companyReviewCriteria, int ci_id) throws Exception {
        return new CompanyReviewPageDTO(companyReviewMapper.crTotalCount(ci_id), companyReviewMapper.getListWithPaging(companyReviewCriteria, ci_id));
    }

    @Override
    public double totalStarRtAve(String ci_companyName) {
        return Math.ceil(companyReviewMapper.totalStarRtAve(ci_companyName)*10)/10;
    }

    @Override
    public double categoryStarRtAve(String ci_companyName, int cr_category) {
        return Math.ceil(companyReviewMapper.categoryStarRtAve(ci_companyName, cr_category)*10)/10;
    }

    @Override
    public String categoryName(int cr_category) {
        return companyReviewMapper.categoryName(cr_category);
    }

    @Override
    public int getCountByCategory(String ci_companyName, int cr_category) {
        return companyReviewMapper.getCountByCategory(ci_companyName, cr_category);
    }

}
