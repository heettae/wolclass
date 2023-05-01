package com.wolclass.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wolclass.domain.WishVO;
import com.wolclass.service.WishService;

@Controller
@RequestMapping("/wish/*")
public class WishController {
	private static final Logger logger = LoggerFactory.getLogger(WishController.class);
	
	@Autowired
	private WishService service;
	
	// 위시리스트 등록 HJ
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public void addPOST(WishVO vo, HttpSession session) {
		logger.info(" addPOST() 호출 ");
		vo.setM_id((String)session.getAttribute("id"));
		service.add(vo);
	}
	// 위시리스트 등록 HJ
	
	// 위시리스트 삭제 HJ
	@RequestMapping(value = "/del", method = RequestMethod.POST)
	@ResponseBody
	public void delPOST(WishVO vo, HttpSession session) {
		logger.info(" delPOST() 호출 ");
		vo.setM_id((String)session.getAttribute("id"));
		service.delete(vo);
	}
	// 위시리스트 삭제 HJ
}
