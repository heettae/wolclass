package com.wolclass.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wolclass.utils.KakaoMapAPI;

@Controller("/api/*")
public class APIController {
	private static final Logger logger = LoggerFactory.getLogger(APIController.class);
	
	@RequestMapping(value = "getKakaoMap")
	@ResponseBody
	public String getKakaoMap() throws Exception{
		logger.info(" getKakaoMap() 호출 ");
		
		String result = KakaoMapAPI.getKakaoMapScript();
		logger.info(" result : {} ",result);
		return result;
	}

}
