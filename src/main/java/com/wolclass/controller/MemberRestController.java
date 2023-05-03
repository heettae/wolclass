package com.wolclass.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wolclass.service.MemberService;

@RestController
@RequestMapping("/memberrest/*")
public class MemberRestController {
	private static final Logger logger = LoggerFactory.getLogger(MemberRestController.class);
	
	@Autowired
	private MemberService service;
	
	//아이디 중복검사 - 다빈 
	@RequestMapping(value = "/memberIdChk",method = RequestMethod.POST)
	public String memberIdChk(String m_id) throws Exception{
		logger.info("memberIdChk() 호출!");
		int result = service.idCheck(m_id);
		
		if(result != 0) {
			return "fail";
		}else {
			return "success";
		}
	}
		
	// 이메일 중복검사 - 다빈
	@PostMapping("/emailCheck")
	public String emailCheck(String m_email) throws Exception{
		logger.info("emailCheck() 호출");
		int result = service.emailCheck(m_email);
		
		if(result != 0) {
			return "fail";
		}else {
			return "success";
		}
		
	}
	
	// 전화번호 중복검사 - 다빈
	@PostMapping("/phoneCheck")
	public String phoneCheck(String m_phone) throws Exception{
		logger.info("phoneCheck() 호출");
		int result = service.phoneCheck(m_phone);
		
		if(result != 0) {
			return "fail";
		}else {
			return "success";
		}
	}

}
