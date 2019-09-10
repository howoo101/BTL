package com.btl.findjob.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

import java.util.List;

@Data
@AllArgsConstructor
@Getter
public class CompanyReviewPageDTO {

    private int companyReviewCtn;
    private List<CompanyReview> list;
}
