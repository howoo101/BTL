package com.btl.findjob.model;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

@Data
public class AdminPageDTO {
    private int startPage;
    private int endPage;
    private boolean prev, next;
    
    private int total; //전체데이터 수
    private AdminCriteria cri; 
    
    public AdminPageDTO(AdminCriteria cri, int total) {
        this.cri = cri;
        this.total = total;
        
        //페이지 번호 계산
        this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;
        
        this.startPage = this.endPage-9;
        int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
        
        if(realEnd < this.endPage) {
            this.endPage = realEnd;
        }
        
        this.prev = this.startPage > 1;
        this.next = this.endPage < realEnd;
    }

}
