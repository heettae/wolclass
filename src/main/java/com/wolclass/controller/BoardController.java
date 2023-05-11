package com.wolclass.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wolclass.domain.BoardVO;
import com.wolclass.domain.ReplyVO;
import com.wolclass.service.BoardService;
import com.wolclass.service.SwBoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService bservice;
	@Autowired
	private SwBoardService service;
	
	// 글쓰기 정보 입력
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void registGET() throws Exception {
		logger.info(" registGET() - 글정보 입력! ");
		logger.info(" 연결된 view페이지 이동 ");
	}

	// 글쓰기 정보 처리
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String registPOST(BoardVO vo, RedirectAttributes rttr) throws Exception {
		logger.info(" registPOST()  - 글쓰기처리! ");
		logger.info(" 글쓰기 정보: " + vo);
		service.writeBoard(vo);
		
		rttr.addFlashAttribute("result", "ok");

		return "redirect:/board/community";
	}

	// 글 전체 조회
	@RequestMapping(value = "/community", method = RequestMethod.GET)
	public void listAllGET(@RequestParam Map<String, Object> cmap, Model model) throws Exception {
		logger.info(" listAllGet() 글전체 조회");

		List<BoardVO> boardList = service.selectPageNumBoTotal(cmap);
		logger.info(" boardList {}", boardList.size());
		logger.info(" boardList {}", boardList);

		model.addAttribute("cmap", cmap);
		model.addAttribute("boardList", boardList);
	}
	  
	@RequestMapping(value = "/read", method = RequestMethod.GET) 
	public void readGET(@RequestParam("b_no") int b_no,@RequestParam Map<String, Object> cmap, Model model) throws Exception {
		logger.info(" readGET()  ");
		
		logger.info("  b_no : " + b_no);
		
		service.incrementViewCnt(b_no); 
		BoardVO resultVO = service.getBoard(b_no);
		logger.info(resultVO.toString()); 
		model.addAttribute("resultVO", resultVO); 
		
		logger.info(" readGET() 글전체 조회");
		
		List<ReplyVO> replyList = service.getReplyList(cmap);
		logger.info(" replyList {}", replyList.size());
		logger.info(" replyList {}", replyList);
			
		model.addAttribute("cmap", cmap);
		model.addAttribute("replyList", replyList);
	}
	  
	  
	// 글수정하기 
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
	public String modifyPOST(BoardVO vo, RedirectAttributes rttr) throws Exception {
		logger.info("/boardUpdate 호출");
		logger.info("modifyPOST() 호출");
		logger.info(vo.toString());
		
		
		int result = service.modifyBoard(vo); 
		if (result == 1) {
		rttr.addFlashAttribute("result", "updOK"); }
		
		return "redirect:/board/community";
	}
		  
	  
	// 글삭제하기
	@RequestMapping(value = "/boardRemove", method = RequestMethod.POST) 
	public String removePOST(@ModelAttribute("b_no") int b_no, RedirectAttributes rttr) throws Exception {
		
		logger.info(" b_no : " + b_no);
		
		int result = service.removeBoard(b_no);
		
		if (result == 1) { rttr.addFlashAttribute("result", "delOK"); }
		
		return "redirect:/board/community"; 
	}
}
