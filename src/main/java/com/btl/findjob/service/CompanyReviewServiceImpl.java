package com.btl.findjob.service;

import com.btl.findjob.mapper.CompanyMapper;
import com.btl.findjob.mapper.CompanyReviewMapper;
import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.CompanyReviewCriteria;
import com.btl.findjob.model.CompanyReviewPageDTO;
import com.btl.findjob.model.ReplyPageDTO;
import lombok.AllArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyReviewServiceImpl implements CompanyReviewService {
    @Setter(onMethod_ =@Autowired)
    private CompanyReviewMapper companyReviewMapper;
    @Setter(onMethod_ =@Autowired)
    private CompanyMapper companyMapper;

    @Override
    public int insertCompanyReview(CompanyReview companyReview) {return companyReviewMapper.insertCompanyReview(companyReview);
    }

    @Override
    public CompanyReview get(int cr_id) {
        return companyReviewMapper.read(cr_id);
    }

    @Override
    public List<CompanyReview> getList(CompanyReviewCriteria companyReviewCriteria, int ci_id) {
        return companyReviewMapper.getListWithPaging(companyReviewCriteria, ci_id);
    }

    @Override
    public CompanyReviewPageDTO getListPage(CompanyReviewCriteria companyReviewCriteria, int ci_id) {
        return new CompanyReviewPageDTO(companyReviewMapper.getCountByCi_id(ci_id), companyReviewMapper.getListWithPaging(companyReviewCriteria, ci_id));
    }
}
