package com.btl.findjob.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Getter
@Data
@AllArgsConstructor
public class ReplyPageDTO {
    private int replyCnt;
    private List<ReplyDTO> list;
    

}
