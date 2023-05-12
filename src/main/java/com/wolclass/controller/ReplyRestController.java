package com.wolclass.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wolclass.domain.ReplyVO;
import com.wolclass.service.ReplyService;

@RestController
@RequestMapping("/replyrest")
public class ReplyRestController {

	private static final Logger logger = LoggerFactory.getLogger(ReplyRestController.class);
	
	@Autowired
	private ReplyService service;
	
	@RequestMapping("/list")
	public Map<String, Object> list(@RequestParam Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<>();
		logger.info("{}",map);
		resultMap.put("reviewList", service.getList(map));
		resultMap.put("map", map);
		return resultMap;
	}

}
