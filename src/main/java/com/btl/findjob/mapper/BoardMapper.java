package com.btl.findjob.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.btl.findjob.model.BoardCriteria;
import com.btl.findjob.model.BoardDTO;

public interface BoardMapper {
//	@Select("select * from board where board_id > 0 ")
	public List<BoardDTO> getList();
	
	public void insert(BoardDTO baord);
	
	public void insertSelectKey(BoardDTO board);
	
	public int delete(int board);
	
	public int modify(BoardDTO board);
	
	public List<BoardDTO> getListWithPaging(BoardCriteria cri);
	
	public int getTotalCount(BoardCriteria cri);
	
	//댓글처리
    public BoardDTO read(int board_id);
    
    public void updateReplyCnt(@Param("board_id") int board_id, @Param("amount") int amount);
}
