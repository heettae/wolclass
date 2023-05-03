package com.wolclass.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wolclass.service.ClassService;
import com.wolclass.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	@Autowired
	private ClassService cservice;
	
	// 클래스 워크스페이스
	@RequestMapping(value = "/classWorkSpace", method = RequestMethod.GET)
	public void classWorkSpace(Model model, HttpSession session) throws Exception {
		logger.info(" classWorkSpaceGET() 호출 ");

		String id = (String) session.getAttribute("id");
		model.addAttribute("registerList", cservice.registerClassList(id));
	}
	// 클래스 워크스페이스
}
