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

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ClassService classService;
	@Autowired
	private WishService wishService;
	@Autowired
	private MemberService memberService;
	
	// main 페이지 - tj
	@RequestMapping(value = "/")
	public String mainGET(@RequestParam Map<String, Object> map, Model model, HttpSession session) throws Exception {
		logger.info(" mainGET() 호출 ");
		List<ClassVO> recommendedClass;
		String keyword = "";
		// 카테고리별 리스트 출력
		Map<String, List<ClassVO>> classMap = new HashMap<String, List<ClassVO>>();
		List<ClassVO> categoryClassList = classService.getCategoryClassList();
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

		if (id != null) {
			MemberVO vo = memberService.getMemberInfo(id);
			if (vo.getM_dogbirth() != null) {
				int age = memberService.calculateAge(vo.getM_dogbirth());
				int birth = memberService.oneWeekBeforeBirth(vo.getM_id());
//				if (age >= 8 && birth > 0) {
//					// 반려견 나이 기준 8살 이상일때 건강 카테고리 추천
//					keyword = "건강|영양|생일";
//					recommendedClass = tjService.findByKeyword(keyword);
//					model.addAttribute("recClass", recommendedClass);
//				} else if (age >= 8) {
//					keyword = "건강|영양";
//					recommendedClass = tjService.findByKeyword(keyword);
//					model.addAttribute("recClass", recommendedClass);
//				} else if (birth > 0) {
//					keyword = "생일";
//					recommendedClass = tjService.findByKeyword(keyword);
//					model.addAttribute("recClass", recommendedClass);
//				}
				List<String> keywords = new ArrayList<>();
				if(birth > 0) keywords.add("생일");
				if(age >= 8) {
					keywords.add("건강");
					keywords.add("영양");
				}
				if(keywords.size() > 0) {
					recommendedClass = classService.findByKeyword(String.join("|", keywords.toArray(new String[0])));
					model.addAttribute("recClass", recommendedClass);
				}
				logger.info("반려견 나이 : " + age);
			}
		}
		
		model.addAttribute("onlineList", classService.getOnlineList());
		model.addAttribute("WDATA", OpenweatherAPI.getCurrentWeather((String)session.getAttribute("userLat"), (String)session.getAttribute("userLng")));
		model.addAttribute("categoryList", classMap);
		model.addAttribute("wishList", wishService.getCnoList((String) session.getAttribute("id")));
		logger.info("classMap@@@@@@@@@@@@@@@@@ : " + classMap.size());
		
		return "/main/main";
	}
	// main 페이지 - tj
	
	// 리뷰 이벤트 페이지
	@RequestMapping(value = "/reviewEvent")
	public String event() throws Exception{
		return "/main/reviewEvent";
	}
	// 리뷰 이벤트 페이지

}
