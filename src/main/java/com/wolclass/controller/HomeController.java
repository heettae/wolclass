package com.wolclass.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.wolclass.utils.OpenweatherAPI;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * 메인페이지 가는 메소드임
	 */
	// http://localhost:8080/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) throws Exception{
		logger.info("Welcome home! The client locale is {}.", locale);
		
		// 사용자 위치기반 날씨정보 얻어옴.
		model.addAttribute("WDATA", OpenweatherAPI.getCurrentWeather((String)session.getAttribute("userLat"), (String)session.getAttribute("userLng")));
		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
//		String formattedDate = dateFormat.format(date);
		
//		model.addAttribute("serverTime", formattedDate );
		
		return "/main/main";
	}
	
	// 사용자 위치정보 세션에 저장 HJ
	@RequestMapping(value = "/location", method = RequestMethod.POST)
	@ResponseBody
	public void setLocation(HttpSession session, @RequestParam("userLat") String lat, @RequestParam("userLng") String lng) {
		logger.info(" setLocation() 호출 ");
		logger.info("접속 위치정보  위도 {} , 경도{}", lat, lng);
		session.setAttribute("userLat", lat);
		session.setAttribute("userLng", lng);
	}
	// 사용자 위치정보 세션에 저장 HJ
	
}
