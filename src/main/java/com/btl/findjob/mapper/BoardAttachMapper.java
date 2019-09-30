package com.btl.findjob.mapper;

import java.util.List;

import com.btl.findjob.model.BoardAttachDTO;

public interface BoardAttachMapper {
    public void insert(BoardAttachDTO dto);
    public void delete(String uuid);
    public List<BoardAttachDTO> findByBoard_id (int board_id);
    public void deleteAll(int board_id);
    void attachUpdate(BoardAttachDTO dto);
    
}
