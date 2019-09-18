package com.btl.findjob.model;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class ReplyDTO {
	private int reply_id; //댓글번호
	private int user_id; //유저 식별자
	private int board_id; //글번호
	
	private String reply_writer; //댓글 작성자
	private String reply_content; //댓글 내용
	private Date reply_date; //댓글 작성일
	private Date reply_updateDate; //댓글 수정일
}
