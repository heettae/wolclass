package com.wolclass.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;
import com.wolclass.service.TJService;
import com.wolclass.service.WishService;
import com.wolclass.utils.OpenweatherAPI;

@Controller
@RequestMapping("/tj/*")
public class TJController {

	private static final Logger logger = LoggerFactory.getLogger(TJController.class);

	@Autowired
	private TJService tjService;

	@Autowired
	private WishService wservice;

	// main 페이지 - tj
	// http://localhost:8080/tj/main
	@RequestMapping(value = "/main")
	public void mainGET(@RequestParam Map<String, Object> map, Model model, HttpSession session) throws Exception {
		logger.info(" mainGET() 호출 ");
		List<ClassVO> recommendedClass;
		String keyword;
		// 카테고리별 리스트 출력
		Map<String, List<ClassVO>> classMap = new HashMap<String, List<ClassVO>>();
		List<ClassVO> categoryClassList = tjService.getCategoryClassList();
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
			MemberVO vo = tjService.getMemberInfo(id);
			if (vo.getM_dogbirth() != null) {
				int age = tjService.calculateAge(vo.getM_dogbirth());
				int birth = tjService.oneWeekBeforeBirth(vo.getM_id());
				if (age >= 8 && birth > 0) {
					// 반려견 나이 기준 8살 이상일때 건강 카테고리 추천
					keyword = "건강|훈련|영양|생일";
					recommendedClass = tjService.findByKeyword(keyword);
					model.addAttribute("recClass", recommendedClass);
				} else if (age >= 8) {
					keyword = "건강|훈련|영양";
					recommendedClass = tjService.findByKeyword(keyword);
					model.addAttribute("recClass", recommendedClass);
				} else if (birth > 0) {
					keyword = "명절|생일";
					recommendedClass = tjService.findByKeyword(keyword);
					model.addAttribute("recClass", recommendedClass);
				}
				logger.info("반려견 나이 : " + age);
			}
		}
		model.addAttribute("WDATA", OpenweatherAPI.getCurrentWeather((String)session.getAttribute("userLat"), (String)session.getAttribute("userLng")));
		model.addAttribute("categoryList", classMap);
		model.addAttribute("wishList", wservice.getCnoList((String) session.getAttribute("id")));
		logger.info("classMap@@@@@@@@@@@@@@@@@ : " + classMap.size());
	}
	// main 페이지 - tj

	// 클래스 워크스페이스
	@RequestMapping(value = "/classWorkSpace", method = RequestMethod.GET)
	public void classWorkSpace(Model model, HttpSession session) throws Exception {
		logger.info(" classWorkSpaceGET() 호출 ");

		String id = (String) session.getAttribute("id");
		model.addAttribute("registerList", tjService.registerClassList(id));
	}
	// 클래스 워크스페이스

	// 클래스 등록 view 페이지 호출
	@RequestMapping(value = "/addClass", method = RequestMethod.GET)
	public void addClassGET() {
		logger.info(" addClassGET() 호출 ");
	}
	// 클래스 등록 view 페이지 호출

	// 클래스 등록 - 처리
	@RequestMapping(value = "/addClass", method = RequestMethod.POST)
	public String addClassPOST(HttpSession session, @ModelAttribute("vo") ClassVO vo,
			MultipartHttpServletRequest multiRequest) throws Exception {
		logger.info(" addClassPOST() 호출 ");
		String id = (String) session.getAttribute("id");
		// 한글처리
		multiRequest.setCharacterEncoding("UTF-8");
		String c_img = String.join(",", tjService.fileProcess(multiRequest));
		
		vo.setM_id(id);
		vo.setC_img(c_img);
		tjService.addClass(vo);

		logger.info("클래스 등록 완료@@@@@@@@@@@@");
		return "redirect:/tj/classWorkSpace";
	}
	// 클래스 등록 - 처리

	// 시간 등록
	@RequestMapping(value = "/addTime", method = RequestMethod.POST)
	public String addTimePOST(@RequestParam Map<String, Object> map) throws Exception {
		logger.info(" addTimePOST() 호출 ");

		tjService.addTime(map);
		logger.info("Map@@@@@@@@@@@@" + map);

		return "redirect:/tj/classWorkSpace";
	}
	// 시간 등록
	
	// 알림
	public String alert() throws Exception{
		
		return "";
	}
	// 알림

}
