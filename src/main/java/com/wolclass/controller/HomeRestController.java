package com.wolclass.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wolclass.domain.AlertVO;
import com.wolclass.service.AlertService;

@RestController
public class HomeRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeRestController.class);
	
	@Autowired
	private AlertService alertService;
	
	// 사용자 위치정보 세션에 저장 HJ
	@RequestMapping(value = "/location", method = RequestMethod.POST)
	public void setLocation(HttpSession session, @RequestParam("userLat") String lat, @RequestParam("userLng") String lng) {
		logger.info(" setLocation() 호출 ");
		logger.info("접속 위치정보  위도 {} , 경도 {}", lat, lng);
		session.setAttribute("userLat", lat);
		session.setAttribute("userLng", lng);
	}
	// 사용자 위치정보 세션에 저장 HJ
	
	// 사용자 위치정보 세션에 저장 HJ
	@RequestMapping(value = "/addr", method = RequestMethod.POST)
	public void setAddr(HttpSession session, @RequestParam("userAddr") String addr) {
		logger.info(" setLocation() 호출 ");
		logger.info("접속 위치정보 행정주소 {} ", addr);
		session.setAttribute("userAddr", addr);
	}
	// 사용자 위치정보 세션에 저장 HJ
	
	// 알림 목록
	@RequestMapping(value = "/alertList", method = RequestMethod.GET)
    public List<AlertVO> alertList(HttpSession session) throws Exception{
        logger.info(" alertList() 호출 ");
        String id = (String) session.getAttribute("id");
        return alertService.getAlertList(id);
    }

	// 알림 체크
	@RequestMapping(value = "/alertCheck", method = RequestMethod.GET)
	public void alertCheck(Integer a_no) throws Exception{
		logger.info("alertCheck() 호출");
		logger.info("a_no@@@@"+a_no);
		alertService.alertCheck(a_no);
	}
	
	// 알림 전체 체크
	@RequestMapping(value = "/alertCheckAll", method = RequestMethod.GET)
	public void alertCheckAll(HttpSession session) throws Exception{
		logger.info("alertCheckAll() 호출 ");
		
		String id = (String) session.getAttribute("id");
		alertService.alertCheckAll(id);
	}
}
