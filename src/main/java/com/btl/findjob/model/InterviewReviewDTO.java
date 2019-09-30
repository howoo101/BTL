package com.btl.findjob.model;

import lombok.Data;

import java.sql.Date;

@Data
public class InterviewReviewDTO {
    private int ir_id;//리뷰 번호
    private String ir_difficulty; //난이도
    private Date ir_interviewDate; //면접 날짜
    private String ir_experience; //면접 내용
    private String ir_route; //면접 경로
    private String ir_title; //제목
    private String ir_question; //면접 질문
    private String ir_answer; //질문 답
    private String ir_result; //면접 결과
    private Date ir_resultDate; //결과 날짜
    private int user_id; //유저 아이디
    private int ci_id; // 회사 아이디

    private String ci_companyName;
}
