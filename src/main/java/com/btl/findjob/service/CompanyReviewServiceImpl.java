package com.btl.findjob.service;

import com.btl.findjob.mapper.CompanyMapper;
import com.btl.findjob.mapper.CompanyReviewMapper;
import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.CompanyReviewCriteria;
import com.btl.findjob.model.CompanyReviewPageDTO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CompanyReviewServiceImpl implements CompanyReviewService {
    @Setter(onMethod_ =@Autowired)
    private CompanyReviewMapper companyReviewMapper;

    @Override
    public int insertCompanyReview(CompanyReview companyReview) {return companyReviewMapper.insertCompanyReview(companyReview);
    }

    @Override
    public CompanyReviewPageDTO getListWithPaging(CompanyReviewCriteria companyReviewCriteria, int ci_id) throws Exception {
        return new CompanyReviewPageDTO(companyReviewMapper.getCountByCi_id(ci_id), companyReviewMapper.getListWithPaging(companyReviewCriteria, ci_id));
    }

    @Override
    public double totalStarRtAve(String ci_companyName) {
        return companyReviewMapper.totalStarRtAve(ci_companyName);
    }

    @Override
    public double categoryStarRtAve(String ci_companyName, int cr_category) {
        return companyReviewMapper.categoryStarRtAve(ci_companyName, cr_category);
    }


}
