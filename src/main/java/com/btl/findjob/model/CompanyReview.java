package com.btl.findjob.model;

import lombok.Data;
import lombok.Setter;

import java.util.Date;

@Data
@Setter
public class CompanyReview {

	private int cr_id; //회사 리뷰 아이디
	private String cr_comment; //회사 리뷰
	private int cr_starRt; //별점
	private Date cr_regDate; //등록일
	private int cr_category; //카테고리 1)승진 기회 및 가능성 2)복지 및 급여 3)업무와 삶의 균형 4)사내문화
	private int user_id; //유저 아이디
	private int ci_id;//회사 정보 아이디

	private String ci_companyName;
}
