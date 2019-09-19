package com.btl.findjob.service;

import com.btl.findjob.mapper.CompanyReviewMapper;
import com.btl.findjob.model.CompanyReview;
import com.btl.findjob.model.CompanyReviewCriteria;
import com.btl.findjob.model.CompanyReviewPageDTO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
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
    public List<CompanyReview> getReviewsList(Map<String, Integer> dataReview) {
        dataReview.put("reviewFlag",1);
        int pageNum = dataReview.get("pageNum");
        int starRow = 5 * (pageNum -1);
        dataReview.put("amount",5);
        dataReview.put("startRow", starRow);
        return companyReviewMapper.getReviewsList(dataReview);
    }

    @Override
    public double totalStarRtAve(String ci_companyName) {
        return companyReviewMapper.totalStarRtAve(ci_companyName);
    }

    @Override
    public double categoryStarRtAve(String ci_companyName, int cr_category) {
        return companyReviewMapper.categoryStarRtAve(ci_companyName, cr_category);
    }

    @Override
    public String categoryName(int cr_category) {
        return companyReviewMapper.categoryName(cr_category);
    }

    @Override
    public Map<String, Integer> reviewPageData(int pageNum, int ci_id, int cr_category) {
        Map<String, Integer> reviewPageData = new HashMap<>();
        Map<String, Integer> data = new HashMap<>();
        data.put("cr_category",cr_category);
        data.put("ci_id", ci_id);

        reviewPageData.put("pageNum",pageNum);
        reviewPageData.put("pageTotalCount",getReviewTotalRows(data));
        reviewPageData.put("startPage",getReviewStartPage(pageNum));
        reviewPageData.put("endPage",getReviewEndPage(pageNum));
        reviewPageData.put("msgPerPage",5);
        return reviewPageData;
    }
    // 페이징 처리할 때 필요한 total rows
    @Override
    public int getReviewTotalRows(Map<String, Integer> data) {
        data.put("reviewFlag", 1);
        int pageTotalCount = 0;
        if (companyReviewMapper.selectReviewTotalRows(data) != 0) {
            pageTotalCount = (int) Math.ceil(((double) companyReviewMapper.selectReviewTotalRows(data) / Constants.Review.NUM_OF_RVW_PER_PAGE));
        }
        return pageTotalCount;
    }

    @Override
    public int getReviewStartPage(int pageNum) {
        int startPage = ((pageNum - 1) / 5) * 5 + 1;
        return startPage;
    }

    @Override
    public int getReviewEndPage(int pageNum) {
        int endPage = (((pageNum - 1) / 5) + 1) * 5E;
        return endPage;
    }

}
