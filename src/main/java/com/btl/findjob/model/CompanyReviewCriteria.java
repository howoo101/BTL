package com.btl.findjob.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.util.UriComponentsBuilder;

@Getter
@Setter
@ToString
public class CompanyReviewCriteria {
    private int pageNum;
    private int amount;

    public CompanyReviewCriteria(){
        this(1,10);
    }

    public CompanyReviewCriteria(int pageNum, int amount){
        this.pageNum = pageNum;
        this.amount = amount;
    }
    public String getListLink(){

        UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.fromPath("")
                .queryParam("pageNum",this.pageNum)
                .queryParam("amount", this.getAmount());

        return uriComponentsBuilder.toUriString();
    }

}
