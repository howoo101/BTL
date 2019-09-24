package com.btl.findjob.service;

import java.util.List;

import com.btl.findjob.model.BoardCriteria;
import com.btl.findjob.model.BoardDTO;

public interface BoardService {
    public List<BoardDTO> getList(BoardCriteria cri);

    public void register(BoardDTO board);

    public BoardDTO get(int board_id);
    
    public boolean modify(BoardDTO board);

    public boolean remove(int board);
    
    public int getTotal(BoardCriteria cri);
    
  //조회수 카운트
    public void updateBoardHit(int board_id);
}
