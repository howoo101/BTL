package com.btl.findjob.model;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class AdminCriteria {
private int pageStart;
private int pageNum;//페이지번호
private int amount;//양

private String type;
private String keyword;

public AdminCriteria() {
    this.pageNum = 1;
    this.amount = 10;
}
public AdminCriteria(int pageNum, int amount) {
    this.pageNum=pageNum;
    this.amount=amount;
}



public void setPageNum(int pageNum) {
    if(pageNum <=0){
        this.pageNum=1;
        return;
    }
    this.pageNum = pageNum;
}

public String[] getTypeArr() {
    return type == null? new String[] {}: type.split("");
    }
         
    public void setAmount(int amount) {
        if(amount <=0 || amount >100){
            this.amount=10;
            return;
        }
        this.amount = amount;
    }
 
    public int getPageStart() {
        this.pageStart=(this.pageNum -1)*amount;
        return this.pageStart;
    }
 
 
    public void setPageStart(int pageStart) {
        this.pageStart = pageStart;
    }
    
    public String getListLink() {
        UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
	    .queryParam("pageNum", this.getPageNum()) 
	    .queryParam("amount", this.getAmount())
	    .queryParam("type", this.getType())
	    .queryParam("keyword", this.getKeyword());
    return builder.toUriString();
}
}
