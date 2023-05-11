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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wolclass.domain.BoardVO;
import com.wolclass.domain.ReplyVO;
import com.wolclass.service.SwBoardService;

@Controller
@RequestMapping("/sw/*")
public class SWController {

	private static final Logger logger = LoggerFactory.getLogger(SWController.class);

	// 서버 시간
	@Autowired
	private SwBoardService service;

	// http://localhost:8080/sw/swWrite
	// 글쓰기 정보 입력
	@RequestMapping(value = "/swWrite", method = RequestMethod.GET)
	public void registGET() throws Exception {
		logger.info(" registGET() - 글정보 입력! ");
		logger.info(" 연결된 view페이지 이동 ");
	}

	// 글쓰기 정보 처리
	@RequestMapping(value = "/swWrite", method = RequestMethod.POST)
	public String registPOST(BoardVO vo, RedirectAttributes rttr) throws Exception {
		logger.info(" registPOST()  - 글쓰기처리! ");
		logger.info(" 글쓰기 정보: " + vo);
		service.writeBoard(vo);
		
		rttr.addFlashAttribute("result", "ok");

		return "redirect:/sw/community";
	}

	// http://localhost:8080/sw/community
	// 글 전체 조회
	@RequestMapping(value = "/community", method = RequestMethod.GET)
	public void listAllGET(@RequestParam Map<String, Object> map, Model model) throws Exception {
		logger.info(" listAllGet() 글전체 조회");

		List<BoardVO> boardList = service.selectPageNumBoTotal(map);
		logger.info(" boardList {}", boardList.size());
		logger.info(" boardList {}", boardList);

		model.addAttribute("map", map);
		model.addAttribute("boardList", boardList);
	}
	  
	// http://localhost:8080/sw/swRead
	// http://localhost:8080/sw/swRead // 특정글 글정보 보기
	  @RequestMapping(value = "/swRead", method = RequestMethod.GET) 
	  public void readGET(@RequestParam("b_no") int b_no,@RequestParam Map<String, Object> map, Model model) throws Exception {
	  logger.info(" readGET()  ");
	  
	  logger.info("  b_no : " + b_no);
	  
	  service.incrementViewCnt(b_no); 
	  BoardVO resultVO = service.getBoard(b_no);
	  logger.info(resultVO.toString()); 
	  model.addAttribute("resultVO", resultVO); 
	  
	  logger.info(" readGET() 글전체 조회");

		List<ReplyVO> replyList = service.getReplyList(map);
		logger.info(" replyList {}", replyList.size());
		logger.info(" replyList {}", replyList);
			
		model.addAttribute("map", map);
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
		  
		  return "redirect:/sw/community";
	  }
	  
	  
	  // 글삭제하기
	  @RequestMapping(value = "/boardRemove", method = RequestMethod.POST) 
	  public String	 removePOST(@ModelAttribute("b_no") int b_no, RedirectAttributes rttr) throws
		 Exception {
		 
		 logger.info(" b_no : " + b_no);
		 
		 int result = service.removeBoard(b_no);
		 
		 if (result == 1) { rttr.addFlashAttribute("result", "delOK"); }
		 
		 return "redirect:/sw/community"; 
		 }
	  
	  // 특정글 댓글쓰기
	  @RequestMapping(value = "/commentWrite", method = RequestMethod.POST)
	  public String commentPOST(@RequestParam Map<String, Object> cmap, Model model) throws Exception {
		  logger.info("vo :"+cmap);
		  
		  service.writeComment(cmap); 
		 model.addAttribute("cmap", cmap);
		 
		 return "redirect:/sw/swRead?b_no="+cmap.get("b_no")+"&b_category="+
		 cmap.get("b_category")+"&search="+cmap.get("search")+"&pageNum="+cmap.get("pageNum");
	  }
	  
	  // 댓글 수정하기 
	  @RequestMapping(value = "/comUpdate", method = RequestMethod.POST)
	  @ResponseBody
	  public int commentUpdate(ReplyVO ruvo, RedirectAttributes rttr) throws Exception {
		  logger.info(" commentUpdate() ");
		  logger.info(ruvo.toString());
		  
		  return service.modifyComment(ruvo); 
	  }
	  
	  
	  // 댓글 삭제하기
	  @RequestMapping(value = "/comRemove", method = RequestMethod.POST)
	  @ResponseBody
	  public int commentRemove(int r_no) throws Exception {
		  logger.info(" r_no : " + r_no);
		  return service.removeComment(r_no);
	  }
	  
	  // 목록으로 돌아가기 
	  @RequestMapping(value = "/backBoardList")
	  public String backBoardList(@RequestParam("b_no") int b_no,@RequestParam("pageNum") int pageNum,
			  @RequestParam("b_category") String b_category,@RequestParam("search") String search){
		  
		  return "redirect:/sw/community?b_no="+b_no+"&b_category="+b_category+"&search="+search+"&pageNum="+pageNum;
	  }
	  
	  
		// http://localhost:8080/sw/review?c_no=30 
	  @RequestMapping(value = "/review", method = RequestMethod.GET)
	  public void reviewGET(@RequestParam("c_no") int c_no, @RequestParam Map<String, Object> map, Model model) throws Exception {
			logger.info(" listAllGet() 글전체 조회");

			List<ReplyVO> reviewList = service.selectPageNumReTotal(map);
			logger.info(" reviewList {}", reviewList.size());
			logger.info(" reviewList {}", reviewList);

			model.addAttribute("map", map);
			model.addAttribute("reviewList", reviewList);
		}
	  
		//http://localhost:8080/sw/detail?c_no=30 
	  @RequestMapping(value = "/detail", method = RequestMethod.GET)
	  public void detailGET() {
	  }

}
