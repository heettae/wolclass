package com.wolclass.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/admin/*")
@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	// 임시
	@RequestMapping("/admin")
	public void admin() {
		
	}
	
	// 회원목록 출력
	@RequestMapping("/memberList")
	public void memberList() {
		
	}
	
	// 회원 정보 수정
	@RequestMapping("/updateMember")
	@ResponseBody
	public void updateMember() {
		
	}
	
	// 회원 정보 삭제
	@RequestMapping("/deleteMember")
	@ResponseBody
	public void deleteMember() {
		
	}
	
	// 클래스 등록대기 목록 출력
	@RequestMapping("/classList")
	public void classList() {
		
	}
	
	// 클래스 상세정보
	@RequestMapping("/classDetail")
	public void classDetail() {
		
	}
	
	// 클래스 등록 승인
	@RequestMapping("/confirmClass")
	@ResponseBody
	public void confirmClass() {
		
	}
	
	// 클래스 등록 승인 거부
	@RequestMapping("/deleteClass")
	@ResponseBody
	public void deleteClass() {
		
	}
	
	// 1:1 문의 리스트 (관리자 메인)
	@RequestMapping("/msgList")
	public void msgList() {
		
	}
	
	// 1:1  문의 읽기
	@RequestMapping("/readMsg")
	public void readMsg() {
		
	}
	
	// 1:1  문의 답신
	@RequestMapping("/writeMsg")
	public void writeMsg() {
		
	}
	
	// 커뮤니티 목록
	@RequestMapping("/boardList")
	public void boardList() {
		
	}
	
	// 커뮤니티 읽기
	@RequestMapping("/readBoard")
	public void readBoard() {
		
	}
	
	// 공지사항 등록
	@RequestMapping("/writeBoard")
	public void writeBoard() {
		
	}
	
	// 커뮤니티 글 삭제
	@RequestMapping("/deleteBoard")
	public void deleteBoard() {
		
	}
	
	// 수강후기 리스트
	@RequestMapping("/reviewList")
	public void reviewList() {
		
	}
	
	// 수강후기 삭제
	@RequestMapping("/deleteReview")
	public void deleteReview() {
		
	}
	
	// 수강후기 리스트
	@RequestMapping("/payList")
	public void payList() {
		
	}
	
}
