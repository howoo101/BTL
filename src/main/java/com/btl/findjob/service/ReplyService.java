package com.btl.findjob.service;

import java.util.List;

import com.btl.findjob.model.BoardCriteria;
import com.btl.findjob.model.ReplyDTO;

public interface ReplyService {

    public int replyRegister(ReplyDTO dto);

    public ReplyDTO replyGet(int reply_id);
    
    public int replyModify(ReplyDTO dto);
    
    public int replyRemove(int reply_id);
    
    public List<ReplyDTO> replyGetList(BoardCriteria cri, int board_id);
    
}
