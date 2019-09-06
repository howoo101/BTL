package com.btl.findjob.model;

import java.util.Date;

public class InterviewReview {
	int ir_id; //면접후기 pk
	String ci_companyName; //기업pk 
	int user_id; //유저pk
	int ir_difficulty; //면접 난이도
	Date ir_interviewDate; //면접일자
	String ir_experience; //면접 경험
	String ir_route; //면접 경로
	String ir_question; //면접 질문
	String ir_answer; //면접 답변
	String ir_result; //면접 결과
	Date ir_resultDate; //면접경과 날짜
}
