package com.wolclass.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/th/*")
public class THController {
	
	private static final Logger logger = LoggerFactory.getLogger(THController.class);
	
	// http://localhost:8080/th/main
	@RequestMapping(value = "/main")
	public void mainGET() {
		logger.info(" mainGET() 호출 ");
	}
	
	// http://localhost:8080/th/detail
	@RequestMapping(value = "/detail")
	public void detailGET() {
		logger.info(" detailGET() 호출 ");
	}
	// http://localhost:8080/th/calender
	@RequestMapping(value = "/calender")
	public void calenderGET() {
		logger.info(" calenderGET() 호출 ");
	}
	
	
	
	
}
