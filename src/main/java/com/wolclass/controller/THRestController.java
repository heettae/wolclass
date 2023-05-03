package com.wolclass.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wolclass.domain.PayDTO;
import com.wolclass.service.THService;

@RestController
public class THRestController {

	
	
private static final Logger logger = LoggerFactory.getLogger(THController.class);
	


	// 서비스 객체 주입
	@Autowired
	private THService service;
	
	


	
	
	@RequestMapping(value = "/th/refund", method = RequestMethod.POST)
	public String paymentsPOST(@RequestBody PayDTO dto) throws Exception {
		logger.info("paymentsPOST() 호출");
		// @RequestBody JSON형태로 전달된 데이터를 매핑되는 객체가 있다면 
		logger.info(dto + "");
		return "";
	}
	
	
	
	
}
