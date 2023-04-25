package com.wolclass.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.wolclass.service.ClassService;
import com.wolclass.service.SearchDataService;

@Controller
@RequestMapping("/class/*")
public class ClassController {
	private static final Logger logger = LoggerFactory.getLogger(ClassController.class);
	
	@Autowired
	private ClassService cservice;
	@Autowired
	private SearchDataService sdservice;
	
	//클래스리스트 검색결과 출력 hj
	//http://localhost:8080/class/list
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listPOST(@RequestParam Map<String,Object> map, Model model, HttpServletRequest request) throws Exception {
		logger.info(" ClassController-listPOST() 호출 ");
		
		// 인기검색어 리스트
		model.addAttribute("psList", sdservice.getPSList());
		
		// 사용자 위치정보 예외처리
		String userLat = (String)request.getSession().getAttribute("userLat");
		if(userLat != null) {
			map.put("userLat", userLat);
			map.put("userLng", (String)request.getSession().getAttribute("userLng"));
		}else {
			map.put("userLat", "0");
			map.put("userLng", "0");
		}
		
		// 검색데이터 분석 및 저장
		new Thread(() -> {
			if(map.containsKey("search"))
				try {
					sdservice.analyze(map.get("search"));
				} catch (Exception e) {
					e.printStackTrace();
				}
		}).start();
		
		// 검색결과 및 페이징데이터 반환
		List list = cservice.getClassList(map);
		model.addAttribute(list);
		model.addAttribute("jsonStr", new ObjectMapper().writeValueAsString(list));
		model.addAttribute("map", map);
	}
	//클래스리스트 검색결과 출력 hj
	
	//지도 팝업 hj
	@RequestMapping(value = "/popupMap")
	public void popupMapAll() throws Exception {
		logger.info(" ClassController-popupMapAll() 호출 ");
	}
	//지도 팝업 hj
	
	//주변검색 팝업 hj
	@RequestMapping(value = "/popupLocation")
	public void popupLocationAll(HttpServletRequest request, Model model) throws Exception {
		logger.info(" ClassController-popupLocation() 호출 ");
		model.addAttribute("jsonStr", new ObjectMapper().writeValueAsString(cservice.getNearbyClassList(request.getSession().getAttribute("userLat"), request.getSession().getAttribute("userLng"))));
	}
	//주변검색 팝업 hj
	
	// 클래스 상세정보 th
	@RequestMapping(value = "/detail")
	public void detailGET(@RequestParam("c_no")int c_no, Model model) throws Exception {
		logger.info(" detailGET() 호출 ");
//		ClassVO vo = cservice.getClassDetail(c_no);
//		logger.info("vo : "+vo);
//		model.addAttribute(vo);
	}
	// 클래스 상세정보 th
}
