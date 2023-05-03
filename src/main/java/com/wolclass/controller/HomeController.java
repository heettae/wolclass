package com.wolclass.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;
import com.wolclass.service.ClassService;
import com.wolclass.service.MemberService;
import com.wolclass.service.WishService;
import com.wolclass.utils.OpenweatherAPI;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ClassService service;
	@Autowired
	private WishService wservice;
	@Autowired
	private MemberService mservice;
	/**
	 * 메인페이지 가는 메소드임
	 */
	// http://localhost:8080/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) throws Exception{
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<ClassVO> recommendedClass;
		String keyword;
		// 카테고리별 리스트 출력
		Map<String, List<ClassVO>> classMap = new HashMap<String, List<ClassVO>>();
		List<ClassVO> categoryClassList = service.getCategoryClassList();
		for (ClassVO classVO : categoryClassList) {
			String category = classVO.getC_category();
			List<ClassVO> categoryList = classMap.get(category);
			if (categoryList == null) {
				categoryList = new ArrayList<ClassVO>();
				classMap.put(category, categoryList);
			}
			categoryList.add(classVO);
		}
		String id = (String) session.getAttribute("id");
		// 특정일 기준
//		List<ClassVO> list = service.getClassList(map);

		if (id != null) {
			MemberVO vo = mservice.getMemberInfo(id);
			if (vo.getM_dogbirth() != null) {
				int age = service.calculateAge(vo.getM_dogbirth());
				int birth = service.oneWeekBeforeBirth(vo.getM_id());
				if (age >= 8 && birth > 0) {
					// 반려견 나이 기준 8살 이상일때 건강 카테고리 추천
					keyword = "건강|훈련|영양|생일";
					recommendedClass = service.findByKeyword(keyword);
					model.addAttribute("recClass", recommendedClass);
				} else if (age >= 8) {
					keyword = "건강|훈련|영양";
					recommendedClass = service.findByKeyword(keyword);
					model.addAttribute("recClass", recommendedClass);
				} else if (birth > 0) {
					keyword = "명절|생일";
					recommendedClass = service.findByKeyword(keyword);
					model.addAttribute("recClass", recommendedClass);
				}
				logger.info("반려견 나이 : " + age);
			}
		}
		model.addAttribute("categoryList", classMap);
		model.addAttribute("wishList", wservice.getCnoList((String) session.getAttribute("id")));
		// 사용자 위치기반 날씨정보 얻어옴.
		String wData = OpenweatherAPI.getCurrentWeather((String)session.getAttribute("userLat"), (String)session.getAttribute("userLng"));
		model.addAttribute("WDATA", wData);
		logger.info("wData : {}",wData);
		
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
