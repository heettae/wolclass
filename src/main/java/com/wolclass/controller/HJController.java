package com.wolclass.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wolclass.service.HJService;

@Controller
@RequestMapping("/hj/*")
public class HJController {
	
	private static final Logger logger = LoggerFactory.getLogger(HJController.class);
	
	@Autowired
	private HJService service;
	
	@RequestMapping(value = "/main")
	public void mainGET() {
		logger.info(" mainGET() 호출 ");
	}
	
	//클래스리스트 검색결과 출력 hj
	//http://localhost:8080/hj/list
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listGET(@RequestParam Map<String,Object> map, Model model) throws Exception {
		model.addAttribute(service.getPSList());
	}
	//클래스리스트 검색결과 출력 hj
}
