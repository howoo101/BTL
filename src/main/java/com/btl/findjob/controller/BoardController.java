package com.btl.findjob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.btl.findjob.model.BoardCriteria;
import com.btl.findjob.model.BoardDTO;
import com.btl.findjob.model.BoardPageDTO;
import com.btl.findjob.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class BoardController {
    
    private BoardService service;
    //목록
    @GetMapping("list")
    public void list(BoardCriteria cri,Model model) {
        log.info("list:"+cri);
        model.addAttribute("list",service.getList(cri));
        int total = service.getTotal(cri);
        log.info("total:"+total);
        model.addAttribute("pageMaker", new BoardPageDTO(cri, total));
    }
    //등록
    @PostMapping("register")
    public String register(BoardDTO board, RedirectAttributes rttr) {
        log.info("register:"+board);
        service.register(board);
        rttr.addFlashAttribute("result",board.getBoard_id());
        return "redirect:list";
    }
    
    @GetMapping("register")
    public void register() {
        
    }
    
    @GetMapping({"get","modify"})
    public void get(@RequestParam("board_id") int board_id, @ModelAttribute("cri") BoardCriteria cri, Model model) {
        log.info("/get or modify");
        model.addAttribute("board",service.get(board_id));

    }
    //수정
    @PostMapping("modify")
    public String modify(BoardDTO board, @ModelAttribute("cri") BoardCriteria cri, RedirectAttributes rttr) {
        log.info("modify : " + board);
        
        if(service.modify(board)) {
            rttr.addFlashAttribute("result","success");
        }
        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());
        rttr.addAttribute("type", cri.getType());
        rttr.addAttribute("keyword", cri.getKeyword());
        
        return "redirect:list";
    }
    //삭제
    @PostMapping("remove")
    public String remove(@RequestParam("board_id") int board_id, @ModelAttribute("cri") BoardCriteria cri, RedirectAttributes rttr) {
        log.info("remove.."+ board_id);
        if(service.remove(board_id)) {
            rttr.addFlashAttribute("result", "success");
            
        }
        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());
        rttr.addAttribute("type", cri.getType());
        rttr.addAttribute("keyword", cri.getKeyword());
        
        return "redirect:list";
    }
    
} 
