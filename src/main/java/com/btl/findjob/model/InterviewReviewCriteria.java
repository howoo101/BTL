package com.btl.findjob.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.util.UriComponentsBuilder;

@Getter
@Setter
@ToString
public class InterviewReviewCriteria {
    private int pageStart;
    private int pageNum;
    private int amount;

    public InterviewReviewCriteria() {
        this(1, 2);
    }

    public InterviewReviewCriteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }

    public void setPageNum(int pageNum){
        //페이지 번호가 0이거나 0보다 적으면 1페이지로 이동
        if(pageNum<=0){
            this.pageNum = 1;
            return;
        }
        this.pageNum = pageNum;
    }

    //MyBatis SQL의 Mapper에서 인식해서 가져가는 파라미터 값 메소드
    public void setAmount(int amount){
        //몇개씩 보여줄 것인지에 대해 0보다 작거나 100보다 크면 10으로 초기화 시킨다.
        if(amount<=0||amount > 100){
            this.amount = 2;
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



    public String getListLink() {

        UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.fromPath("").queryParam("pageNum", this.pageNum).queryParam("amount", this.getAmount());

        return uriComponentsBuilder.toUriString();
    }
}
