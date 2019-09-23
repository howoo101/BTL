package com.btl.findjob.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class MypageCriteria {
	
	private int startNum; //페이지 시작 데이터 번호
	private int pageNum; //페이지 번호
	private int amount; //페이지당 몇개의 데이터
	
	public MypageCriteria() {
		this(1,10);
	}
	
	public MypageCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public int getStartNum() {
		return (pageNum-1) * amount;
	}
	
	
}
