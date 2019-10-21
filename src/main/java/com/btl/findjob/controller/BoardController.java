package com.btl.findjob.controller;


import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.btl.findjob.model.BoardAttachDTO;
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
    public void list(BoardCriteria cri, Model model) {
        model.addAttribute("list", service.getList(cri));
        int total = service.getTotal(cri);
        model.addAttribute("pageMaker", new BoardPageDTO(cri, total));
    }

    //등록
    @PostMapping("register")
    public String register(BoardDTO board, RedirectAttributes rttr) {
        //첨부파일 리스트 출력
//        if(board.getAttachList() != null) {
//            board.getAttachList().forEach(log::info);
//        }
        service.register(board);
        rttr.addFlashAttribute("result", board.getBoard_id());
        return "redirect:list";
    }

    @GetMapping("register")
    public void register() {

    }

    @GetMapping({"get", "modify"})
    public void get(@RequestParam("board_id") int board_id, @ModelAttribute("cri") BoardCriteria cri, Model model) {
        model.addAttribute("board", service.get(board_id));

    }

    //수정
    @PostMapping("modify")
    public String modify(BoardDTO board, @ModelAttribute("cri") BoardCriteria cri, RedirectAttributes rttr) {

        if (service.modify(board)) {
            rttr.addFlashAttribute("result", "success");
        }

        return "redirect:list";
    }

    //삭제
    @PostMapping("remove")
    public String remove(@RequestParam("board_id") int board_id, @ModelAttribute("cri") BoardCriteria cri, RedirectAttributes rttr) {

        List<BoardAttachDTO> attachList = service.getAttachList(board_id);

        if (service.remove(board_id)) {
            deleteFiles(attachList);
            rttr.addFlashAttribute("result", "success");
        }

        return "redirect:list" + cri.getListLink();
    }

    @GetMapping(value = "getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<List<BoardAttachDTO>> getAttachList(int board_id) {
        return new ResponseEntity<>(service.getAttachList(board_id), HttpStatus.OK);
    }

    private void deleteFiles(List<BoardAttachDTO> attachList) {
        if (attachList == null || attachList.size() == 0) {
            return;
        }
        attachList.forEach(attach -> {
            try {
                Path file = Paths.get("c:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
                Files.deleteIfExists(file);

                if (Files.probeContentType(file).startsWith("image")) {

                    Path thumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_" + attach.getFileName());

                    Files.delete(thumbNail);
                }

            } catch (Exception e) {
                log.error("delete file error" + e.getMessage());
            }//end catch
        });//end foreachd

    }

} 
