package com.btl.findjob.service;


import com.btl.findjob.model.BoardCriteria;
import com.btl.findjob.model.ReplyDTO;
import com.btl.findjob.model.ReplyPageDTO;

public interface ReplyService {

    public int replyRegister(ReplyDTO dto);

    public ReplyDTO replyGet(int reply_id);

    public int replyModify(ReplyDTO dto);

    public int replyRemove(int reply_id);

    public ReplyPageDTO getListPage(BoardCriteria cri, int board_id);

}
