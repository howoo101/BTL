package com.btl.findjob.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.btl.findjob.mapper.ReplyMapper;
import com.btl.findjob.model.BoardCriteria;
import com.btl.findjob.model.ReplyDTO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
    
    @Inject
    private ReplyMapper replymapper;

    @Override
    public int replyRegister(ReplyDTO dto) {
        log.info("register..."+dto);
        return replymapper.insert(dto);
    }

    @Override
    public ReplyDTO replyGet(int reply_id) {
        log.info("get..."+ reply_id);
        return replymapper.read(reply_id);
    }

    @Override
    public int replyModify(ReplyDTO dto) {
        log.info("modify..."+dto);
        return replymapper.update(dto);
    }

    @Override
    public int replyRemove(int reply_id) {
        log.info("remove..."+reply_id);
        return replymapper.delete(reply_id);
    }

    @Override
    public List<ReplyDTO> replyGetList(BoardCriteria cri, int board_id) {
        log.info("get Reply List od a Board"+board_id);
        return replymapper.getListWithPaging(cri, board_id);
    }
    
    
}
