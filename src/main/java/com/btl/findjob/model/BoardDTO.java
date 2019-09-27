package com.btl.findjob.model;

import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class BoardDTO {
	
    private int board_userid; //유저 식별자 
	private int board_id; //글번호 
	private String board_writer;
	private String board_title; //글제목
	private String board_content; //글내용
	private Date board_regdate; //글 작성일
	private Date board_updateDate; // 글 수정일
	
	private int board_hit; //글 조회수
	private int replyCnt;// 댓글갯수
	
	private List<BoardAttachDTO> attachList; //첨부파일
	
}
