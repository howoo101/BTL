package com.findjob.btl.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.btl.findjob.mapper.BoardMapper;
import com.btl.findjob.model.BoardDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {

    @Setter(onMethod_ = @Autowired)
    private BoardMapper mapper;
    
    @Test
    public void testGetList() {
        mapper.getList().forEach(board -> log.info(board));
    }
    
    @Test
    public void testInsert() {
        BoardDTO board = new BoardDTO();
        board.setBoard_title("새로 작성하는글");
        board.setBoard_content("새로 작성하는 내용");
        board.setBoard_writer("newbie");
        
        mapper.insert(board);
        log.info(board);
    }
    
    @Test
    public void testInsertSelectKey() {
        BoardDTO board = new BoardDTO();
        board.setBoard_title("새로 작성하는글 ");
        board.setBoard_content("새로 작성하는내용 ");
        board.setBoard_writer("새로 작성하는글 ");
        
        mapper.insertSelectKey(board);
        log.info(board);
    }
    
    @Test
    public void testRead() {
        BoardDTO board = mapper.read(5);
        log.info(board);
    }
    @Test
    public void testDelete() {
        log.info("DELETE COUNT:" + mapper.delete(9));
    }
    
    @Test
    public void testModify() {
        BoardDTO board = new BoardDTO();
        board.setBoard_id(9);
        
        board.setBoard_title("수정된제목 ");
        board.setBoard_content("수정된내용 ");
        board.setBoard_writer("user00 ");
        
        int count = mapper.modify(board);
        log.info("UPDATE COUNT:" + count);
    }

}
