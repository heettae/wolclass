package com.wolclass.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wolclass.domain.ClassVO;
import com.wolclass.service.THService;

@Controller
@RequestMapping("/th/*")
public class THController {
	
	private static final Logger logger = LoggerFactory.getLogger(THController.class);
	


	// 서비스 객체 주입
	@Autowired
	private THService service;
	
	// http://localhost:8080/th/main
	@RequestMapping(value = "/main")
	public void mainGET() {
		logger.info(" mainGET() 호출 ");
	}
	
	// http://localhost:8080/th/detail
	@RequestMapping(value = "/detail")
	public void detailGET(@RequestParam("c_no")int c_no, Model model) throws Exception {
		logger.info(" detailGET() 호출 ");
		ClassVO vo = service.getClassDetail(c_no);
		logger.info("vo : "+vo);
		model.addAttribute(vo);
	}
	
	
	
	
	// http://localhost:8080/th/calender
	@RequestMapping(value = "/calender")
	public void calenderGET() {
		logger.info(" calenderGET() 호출 ");
	}
	
	
	
	
}
