package com.wolclass.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wolclass.domain.ClassVO;
import com.wolclass.service.ClassService;

@Controller
@RequestMapping("/tj/*")
public class TJController {
	
	private static final Logger logger = LoggerFactory.getLogger(TJController.class);
	@Autowired
	private ClassService service;
	
	// http://localhost:8080/tj/main
	@RequestMapping(value = "/main")
	public void mainGET(@RequestParam Map<String, Object> map, Model model) throws Exception {
		logger.info(" mainGET() 호출 ");
		
		List<ClassVO> list = service.getClassList(map);
		logger.info(list.size()+"");
		model.addAttribute(list);
		model.addAttribute("map", map);
		logger.info("@@@@@@{}",map);
		
	}
	
	@RequestMapping(value = "/addClass", method = RequestMethod.GET)
	public void addClassGET() {
		logger.info(" addClassGET() 호출 ");
		
	}
	
	
}
