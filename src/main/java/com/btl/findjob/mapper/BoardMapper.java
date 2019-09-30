package com.btl.findjob.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.btl.findjob.model.BoardCriteria;
import com.btl.findjob.model.BoardDTO;

public interface BoardMapper {
    //게시판 crud
    public List<BoardDTO> getList();

    public void insert(BoardDTO baord);

    public void insertSelectKey(BoardDTO board);

    public int delete(int board_id);

    public int modify(BoardDTO board);
    //페이징
    public List<BoardDTO> getListWithPaging(BoardCriteria cri);
    //목록 총개수
    public int getTotalCount(BoardCriteria cri);

    // 댓글처리
    public BoardDTO read(int board_id);

    // 댓글 수 카운트
    public void updateReplyCnt(@Param("board_id") int board_id, @Param("amount") int amount);

    // 조회수 카운트
    public void updateBoardHit(int board_id);

}
