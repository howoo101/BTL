package com.btl.findjob.service;

import java.util.List;

import com.btl.findjob.model.BoardDTO;

public interface BoardService {
    public List<BoardDTO> getList();

    public void register(BoardDTO board);

    public BoardDTO get(int board_id);
    
    public boolean modify(BoardDTO board);

    public boolean remove(int board);
    
    

}
