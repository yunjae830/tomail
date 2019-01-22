package com.map.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.map.biz.BoardBiz;
import com.map.domain.BoardDto;
import com.map.domain.Criteria;
import com.map.domain.PageDto;

@Controller
@RequestMapping("/mailbox/")
public class BoardController {
	
	@Autowired
	BoardBiz biz;
	
	@RequestMapping("getList.do")
	public String getList(Criteria cri, Model model) {
		model.addAttribute("list", biz.getList(cri));
		model.addAttribute("pageMaker", new PageDto(cri, 100));
		return "getList";
	}
	
	@RequestMapping(value= {"getBoard.do", "updateBaord"}, method=RequestMethod.GET)
	public void getBoard(@RequestParam("bno") int bno,@ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("board", biz.getBoard(bno));
	}
	
	@RequestMapping(value="addBoard.do", method=RequestMethod.GET)
	public void addBoard(Model model) {
		model.addAttribute("title", "메일 작성");
	}
	
	@RequestMapping(value="addBoard.do", method=RequestMethod.POST)
	public String addBoard(BoardDto board, RedirectAttributes rttr) {
		biz.addBoard(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect: /getList.do";
	}
	
	@RequestMapping(value="mailbox/updateBoard.do", method=RequestMethod.POST)
	public String updateBoard(BoardDto board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if(biz.updateBoard(board)) {
			rttr.addFlashAttribute("result", "요청 작업 완료");
			
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			
		}
		
		return "redirect:/getList.do";
	}
	
	@RequestMapping("mailbox/deleteBoard.do")
	public String deleteBoard(@RequestParam("bno") int bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		if(biz.deleteBoard(bno)) {
			rttr.addFlashAttribute("result", "요청 작업 완료");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect: /getList.do";
	}
	

}
