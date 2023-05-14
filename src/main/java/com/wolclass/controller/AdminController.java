package com.wolclass.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wolclass.domain.BoardVO;
import com.wolclass.domain.MemberVO;
import com.wolclass.service.AdminService;

@RequestMapping("/admin/*")
@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService service;
	
	// 1:1 문의 리스트 (관리자 메인)
	@GetMapping("/msgList")
	public void msgList(@RequestParam Map<String,Object> map, Model model) throws Exception {
		model.addAttribute(service.getBoardList(map, 1));
		model.addAttribute("amap",map);
	}
	
	// 1:1  문의 읽기
	@RequestMapping("/readMsg")
	public void readMsg(@RequestParam("b_no") int bno, Model model) throws Exception {
		model.addAttribute(service.getBoard(bno));
	}
	
	// 1:1  문의 답신 페이지 이동
	@GetMapping("/writeMsg")
	public void writeMsgGET(@RequestParam("b_no") int bno, Model model) throws Exception {
		model.addAttribute(service.getBoard(bno));
	}
	
	// 1:1  문의 답신
	@PostMapping("/writeMsg")
	public String writeMsgPOST(BoardVO vo) throws Exception {
		service.writeBoard(vo);
		return "redirect:/admin/msgList";
	}
	
	// 회원목록 출력
	@GetMapping("/memberList")
	public void memberList(@RequestParam Map<String,Object> map, Model model) throws Exception {
		model.addAttribute(service.getMemberList(map));
		model.addAttribute("amap",map);
	}
	
	// 회원 정보 수정
	@RequestMapping("/updateMember")
	@ResponseBody
	public void updateMember(MemberVO vo) throws Exception {
		service.updateMember(vo);
	}
	
	// 회원 정보 삭제
	@RequestMapping("/deleteMember")
	@ResponseBody
	public void deleteMember(@RequestParam("m_id") String id) throws Exception {
		service.deleteMember(id);
	}
	
	// 클래스 등록대기 목록 출력
	@GetMapping("/classList")
	public void classList(@RequestParam Map<String,Object> map, Model model) throws Exception {
		model.addAttribute(service.getClassList(map));
		model.addAttribute("amap",map);
	}
	
	// 클래스 상세정보
	@RequestMapping("/classDetail")
	public void classDetail(@RequestParam("c_no") int cno, Model model) throws Exception {
		model.addAttribute(service.getClass(cno));
	}
	
	// 클래스 등록 승인
	@RequestMapping("/confirmClass")
	@ResponseBody
	public void confirmClass(@RequestParam("c_no") int cno) throws Exception {
		service.confirmClass(cno);
	}
	
	// 클래스 등록 승인 거부
	@RequestMapping("/deleteClass")
	@ResponseBody
	public void deleteClass(@RequestParam("c_no") int cno) throws Exception {
		service.deleteClass(cno);
	}
	
	// 커뮤니티 목록
	@GetMapping("/boardList")
	public void boardList(@RequestParam Map<String,Object> map, Model model) throws Exception {
		model.addAttribute(service.getBoardList(map, 0));
		model.addAttribute("amap",map);
	}
	
	// 커뮤니티 읽기
	@RequestMapping("/readBoard")
	public void readBoard(@RequestParam Map<String,Object> map, Model model) throws Exception {
		model.addAttribute(service.getBoard(Integer.parseInt(map.get("b_no").toString())));
		model.addAttribute(service.getCommentList(map));
		model.addAttribute("amap",map);
	}
	
	// 공지사항 등록
	@RequestMapping("/writeBoard")
	public String writeBoard(BoardVO vo) throws Exception {
		service.writeBoard(vo);
		return "redirect:/admin/boardList";
	}
	
	// 커뮤니티 글 삭제
	@RequestMapping("/deleteBoard")
	public String deleteBoard(@RequestParam("b_no") int bno) throws Exception {
		service.deleteBoard(bno);
		return "redirect:/admin/boardList";
	}
	
	// 커뮤니티 댓글 삭제
	@RequestMapping("/deleteReply")
	@ResponseBody
	public void deleteReply(@RequestParam("r_no") int rno) throws Exception {
		service.deleteReply(rno);
	}
	
	// 수강후기 리스트
	@GetMapping("/reviewList")
	public void reviewList(@RequestParam Map<String,Object> map, Model model) throws Exception {
		model.addAttribute(service.getReviewList(map));
		model.addAttribute("amap",map);
	}
	
	// 수강후기 삭제
	@RequestMapping("/deleteReview")
	@ResponseBody
	public void deleteReview(@RequestParam("r_no") int rno) throws Exception {
		service.deleteReview(rno);
	}
	
	// 결제 리스트
	@GetMapping("/payList")
	public void payList(@RequestParam Map<String,Object> map, Model model) throws Exception {
		model.addAttribute("rsrvPayVOList",service.getPayList(map));
		model.addAttribute("amap",map);
	}
	
	// 공지사항 - 글쓰기 정보 입력
	@RequestMapping(value = "/boardWrite", method = RequestMethod.GET)
	public void registGET() throws Exception {
		logger.info(" registGET() - 글정보 입력! ");
		logger.info(" 연결된 view페이지 이동 ");
	}

	// 공지사항 - 글쓰기 정보 처리
	@RequestMapping(value = "/boardWrite", method = RequestMethod.POST)
	public String registPOST(BoardVO vo) throws Exception {
		logger.info(" registPOST()  - 글쓰기처리! ");
		logger.info(" 글쓰기 정보: " + vo);
		service.writeBoard(vo);
		return "redirect:/board/notice";
	}
	
}
