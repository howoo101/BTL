package com.btl.findjob.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
public class BoardCriteria {
    
    private int pageStart;
    private int pageNum;//page
    private int amount;//perPageNum
    
    private String type;
    private String keyword;
    
    public BoardCriteria() {
        this.pageNum = 1;
        this.amount = 10;
    }
    public BoardCriteria(int pageNum, int amount) {
        this.pageNum=pageNum;
        this.amount=amount;
    }
    
    
    
    public void setPageNum(int pageNum) {
        //페이지 번호가 0이거나 0보다 작으면 1페이지로 한다.
        //
        if(pageNum <=0){
            this.pageNum=1;
            return;
        }
        this.pageNum = pageNum;
    }
    
    public String[] getTypeArr() {
        return type == null? new String[] {}: type.split("");
    }
         
    // MyBatis SQL 의 Mapper 에서 인식해서 가져가는 파라미터 값 메소드 #{perPageNum}
    public void setAmount(int amount) {
        //몇개 씩 보여줄것인가 이다. 최대 100개씩 보여 줄것으로 설정한다.
        //만약 0보다 작거나 100 보다 크면 10으로 초기화 시킨다.
        if(amount <=0 || amount >100){
            this.amount=10;
            return;
        }
        this.amount = amount;
    }
 
 
    // MyBatis SQL 의 Mapper 에서 인식해서 가져가는 파라미터 값 메소드 #{pageStart}
    public int getPageStart() {
        //실질적으로 Mybatis 에서  파라미터로 인식해서  가져오는 것은 get 이다.
        // 따라서 getPageStart 에서 값을 설정한다.
        //시작 데이터 번호 = (페이지 번호 -1 ) * 페이지당 보여지는 개수
        this.pageStart=(this.pageNum -1)*amount;
        return this.pageStart;
    }
 
 
    public void setPageStart(int pageStart) {
        this.pageStart = pageStart;
    }
    
    
}
