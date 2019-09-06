package com.btl.findjob.model;

public class CompanyReview {
	int cr_id; //기업 리뷰 pk
	String cr_content; //기업 리뷰
	double cr_totalRt; //기업 평가점수
	double cr_promotableRt; //승진기회 점수
	double cr_welfareRt; //복지점수
	double cr_wlbRt; //워라밸점수
	double cr_corCultuerRt; // 기업문화점수
	double cr_managementRt; //경영진 점수
	int user_id; //유저 pk
	String ci_id; //fk 기업 pk
	
	
}
