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
    public CompanyReviewPageDTO getListWithPaging(CompanyReviewCriteria companyReviewCriteria,int cr_category ,int ci_id) throws Exception {
        return new CompanyReviewPageDTO(companyReviewMapper.getCountCr(ci_id, cr_category), companyReviewMapper.getListWithPaging(companyReviewCriteria, cr_category ,ci_id));
    }

    @Override
    public double totalStarRtAve(int ci_id) {
        return Math.ceil(companyReviewMapper.totalStarRtAve(ci_id)*10)/10;
    }

    @Override
    public double categoryStarRtAve(int ci_id, int cr_category) {
        return Math.ceil(companyReviewMapper.categoryStarRtAve(ci_id, cr_category)*10)/10;
    }

    @Override
    public String categoryName(int cr_category) {
        return companyReviewMapper.categoryName(cr_category);
    }

    @Override
    public int getCountCr(int ci_id, int cr_category) {
        return companyReviewMapper.getCountCr(ci_id, cr_category);
    }

    @Override
    public int getStarCtn(int ci_id, int cr_starRt) {
        return companyReviewMapper.getStarCtn(ci_id, cr_starRt);
    }

}
