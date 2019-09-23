package com.btl.findjob.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.btl.findjob.model.BoardCriteria;
import com.btl.findjob.model.ReplyDTO;
import com.btl.findjob.model.ReplyPageDTO;
import com.btl.findjob.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {
    private ReplyService service;
    
    @PostMapping(value="/new", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> create(@RequestBody ReplyDTO dto) {
        log.info("ReplyDTO:"+ dto);
        
        int insertCount = service.replyRegister(dto);
        
        log.info("Reply INSERT COUNT :"+insertCount);
                
        return insertCount == 1 
        ? new ResponseEntity<>("success", HttpStatus.OK) 
        : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        
    }
    
    @GetMapping(value="/pages/{board_id}/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("board_id") int board_id) {
       log.info("get Reply List board_id : " +board_id);
       BoardCriteria cri = new BoardCriteria(page, 10);
       log.info("cri : " +cri);
        return new ResponseEntity<>(service.getListPage(cri, board_id), HttpStatus.OK);
    }
    
    @GetMapping(value = "/{reply_id}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
    public ResponseEntity<ReplyDTO> get(@PathVariable("reply_id") int reply_id){

        log.info("reply_id: "+reply_id);

        return new ResponseEntity<>(service.replyGet(reply_id), HttpStatus.OK);
    }
    
    @DeleteMapping(value = "/{reply_id}", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> remove(@PathVariable("reply_id") int reply_id){

        log.info("remove: "+reply_id);

        return service.replyRemove(reply_id) ==1 
                ? new ResponseEntity<>("success",HttpStatus.OK) 
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }
     
     
     
    @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
            value="/{reply_id}", consumes = "application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> modify(@RequestBody ReplyDTO dto, @PathVariable("reply_id") int reply_id) {
        dto.setReply_id(reply_id);
        log.info("reply_id..."+reply_id);
        log.info("modify:"+dto);
        return service.replyModify(dto) ==1 
                ? new ResponseEntity<>("success",HttpStatus.OK) 
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    }

}
