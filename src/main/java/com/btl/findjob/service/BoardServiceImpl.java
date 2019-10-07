package com.btl.findjob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btl.findjob.mapper.BoardAttachMapper;
import com.btl.findjob.mapper.BoardMapper;
import com.btl.findjob.model.BoardAttachDTO;
import com.btl.findjob.model.BoardCriteria;
import com.btl.findjob.model.BoardDTO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

    @Setter(onMethod_ = @Autowired)
    private BoardMapper mapper;
    @Setter(onMethod_ = @Autowired)
    private BoardAttachMapper attachMapper;

    @Override
    public List<BoardDTO> getList(BoardCriteria cri) {

        return mapper.getListWithPaging(cri);
    }

    @Transactional
    @Override
    public void register(BoardDTO board) {
        mapper.insertSelectKey(board);
        if (board.getAttachList() == null || board.getAttachList().size() <= 0) {
            return;
        }
        board.getAttachList().forEach(attach -> {
            attach.setBoard_id(board.getBoard_id());
            attachMapper.insert(attach);
        });
    }

    @Transactional
    @Override
    public BoardDTO get(int board_id) {
        mapper.updateBoardHit(board_id);
        return mapper.read(board_id);
    }

    @Transactional
    @Override
    public boolean modify(BoardDTO board) {
        attachMapper.deleteAll(board.getBoard_id());
        boolean modifyResult = mapper.modify(board) == 1;
        if (modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {
            board.getAttachList().forEach(attach -> {
                attach.setBoard_id(board.getBoard_id());
                attachMapper.attachUpdate(attach);
            });
        }
        return modifyResult;
    }

    @Transactional
    @Override
    public boolean remove(int board_id) {
        attachMapper.deleteAll(board_id);
        return mapper.delete(board_id) == 1;
    }

    @Override
    public int getTotal(BoardCriteria cri) {
        return mapper.getTotalCount(cri);
    }

    @Override
    public void updateBoardHit(int board_id) {

    }

    @Override
    public List<BoardAttachDTO> getAttachList(int board_id) {
        return attachMapper.findByBoard_id(board_id);
    }

}
