package com.btl.findjob.mapper;

import java.util.List;

import com.btl.findjob.model.BoardCriteria;
import com.btl.findjob.model.BoardDTO;

public interface BoardMapper {
//	@Select("select * from board where board_id > 0 ")
    public List<BoardDTO> getList();
    public void insert(BoardDTO baord);
    public void insertSelectKey(BoardDTO board);
    public BoardDTO read(int board_id);
    public int delete(int board);
    public int modify(BoardDTO board);
    
    public List<BoardDTO> getListWithPaging(BoardCriteria cri);
    public int getTotalCount(BoardCriteria cri);

}
