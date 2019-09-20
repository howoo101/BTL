package com.btl.findjob.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.btl.findjob.mapper.BoardMapper;
import com.btl.findjob.model.BoardCriteria;
import com.btl.findjob.model.BoardDTO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

    @Setter(onMethod_ = @Autowired)
    private BoardMapper mapper;
    
    @Override
    public List<BoardDTO> getList(BoardCriteria cri) {
        log.info("get List with boardcriteria:" + cri);
        
        return mapper.getListWithPaging(cri);
    }
    
    @Override
    public void register(BoardDTO board) {
        log.info("register...."+board);
        mapper.insertSelectKey(board);
    }
    
    @Override
    public BoardDTO get(int board_id) {
        log.info("get..."+board_id);
        return mapper.read(board_id);
    }

    @Override
    public boolean modify(BoardDTO board) {
        log.info("modify.."+board);
      return mapper.modify(board) == 1;
    }
    

    @Override
    public boolean remove(int board) {
        log.info("remove..."+board);
      return mapper.delete(board) ==1;
    }

    @Override
    public int getTotal(BoardCriteria cri) {
        return mapper.getTotalCount(cri);
    }

}
