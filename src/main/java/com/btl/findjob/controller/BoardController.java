package com.btl.findjob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.btl.findjob.model.BoardDTO;
import com.btl.findjob.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
//@RequestMapping("/board/*")
@Log4j
@AllArgsConstructor
public class BoardController {
    
    private BoardService service;
    
    @GetMapping("list")
    public void list(Model model) {
        log.info("list");
        model.addAttribute("list",service.getList());
//        return "/board/list";
    }
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
    public void get(@RequestParam("board_id") int board_id, Model model) {
        log.info("/get or modify");
        model.addAttribute("board",service.get(board_id));
        log.info(service.get(board_id));
    }
    
    @PostMapping("modify")
    public String modify(BoardDTO board, RedirectAttributes rttr) {
        log.info("modify : " + board);
        if(service.modify(board)) {
            rttr.addFlashAttribute("result","success");
            
        }
        return "redirect:list";
    }
    
    @PostMapping("remove")
    public String remove(@RequestParam("board_id") int board_id, RedirectAttributes rttr) {
        log.info("remove.."+ board_id);
        if(service.remove(board_id)) {
            rttr.addFlashAttribute("result", "success");
            
        }
        return "redirect:list";
    }
    
} 
