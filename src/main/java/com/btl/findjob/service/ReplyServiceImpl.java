package com.btl.findjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btl.findjob.mapper.BoardMapper;
import com.btl.findjob.mapper.ReplyMapper;
import com.btl.findjob.model.BoardCriteria;
import com.btl.findjob.model.ReplyDTO;
import com.btl.findjob.model.ReplyPageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
    
    @Setter(onMethod_ = @Autowired)
    private ReplyMapper replymapper;
    
    @Setter(onMethod_ = @Autowired)
    private BoardMapper mapper;

    @Transactional
    @Override
    public int replyRegister(ReplyDTO dto) {
        log.info("register..."+dto);
        mapper.updateReplyCnt(dto.getBoard_id(), 1);
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

    @Transactional
    @Override
    public int replyRemove(int reply_id) {
        log.info("remove..."+reply_id);
        ReplyDTO dto = replymapper.read(reply_id);
        mapper.updateReplyCnt(dto.getBoard_id(), -1);
        return replymapper.delete(reply_id);
    }

    @Override
    public ReplyPageDTO getListPage(BoardCriteria cri, int board_id) {
        log.info("listpage....");
        return new ReplyPageDTO(replymapper.getCountByBoard_id(board_id), replymapper.getListWithPaging(cri, board_id));
    }
}
