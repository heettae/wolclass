package com.wolclass.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wolclass.service.ClassService;

@Controller
@RequestMapping("/class/*")
public class ClassController {
	private static final Logger logger = LoggerFactory.getLogger(HJController.class);
	
	@Autowired
	private ClassService service;
	
	@RequestMapping("/list")
	public void listGET() {
		logger.info(" ClassController-listGET()호출  ");
		
	}
}
