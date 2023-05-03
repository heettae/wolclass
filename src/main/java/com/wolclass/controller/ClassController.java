package com.wolclass.controller;

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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;
import com.wolclass.domain.SubscriptionVO;
import com.wolclass.domain.TimetableVO;
import com.wolclass.service.ClassService;
import com.wolclass.service.FileService;
import com.wolclass.service.MemberService;
import com.wolclass.service.SearchDataService;
import com.wolclass.service.SubscriptionService;
import com.wolclass.service.TimetableService;
import com.wolclass.service.WishService;

@Controller
@RequestMapping("/class/*")
public class ClassController {
	private static final Logger logger = LoggerFactory.getLogger(ClassController.class);
	
	@Autowired
	private ClassService cservice;
	@Autowired
	private SearchDataService sdservice;
	@Autowired
	private MemberService mservice;
	@Autowired
	private SubscriptionService sservice;
	@Autowired
	private TimetableService tservice;
	@Autowired
	private WishService wservice;
	@Autowired
	private FileService fservice;
	
	//클래스리스트 검색결과 출력 HJ
	//http://localhost:8080/class/list
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listGET(@RequestParam Map<String,Object> map, Model model, HttpSession session) throws Exception {
		logger.info(" listGET() 호출 ");
		
		// 사용자 위치정보 예외처리
		String userLat = (String)session.getAttribute("userLat");
		if(userLat != null) {
			map.put("userLat", userLat);
			map.put("userLng", (String)session.getAttribute("userLng"));
		}else {
			map.put("userLat", "0");
			map.put("userLng", "0");
		}
		
		// 위시리스트
		model.addAttribute("wishList",wservice.getCnoList((String)session.getAttribute("id")));
		
		// 검색결과 및 페이징데이터 반환
		List list = cservice.getClassList(map);
		model.addAttribute(list);
		model.addAttribute("jsonStr", new ObjectMapper().writeValueAsString(list));
		model.addAttribute("map", map);
		// 인기검색어 리스트
		model.addAttribute("psList", sdservice.getPSList());
		
		// 검색데이터 분석 및 저장
		new Thread(() -> {
			if(map.containsKey("search"))
				try {
					sdservice.analyze(map.get("search"));
				} catch (Exception e) {
					e.printStackTrace();
				}
		}).start();
	}
	//클래스리스트 검색결과 출력 HJ
	
	//지도 팝업 HJ
	@RequestMapping(value = "/popupMap")
	public void popupMapAll() throws Exception {
		logger.info(" popupMapAll() 호출 ");
	}
	//지도 팝업 HJ
	
	//주변검색 팝업 HJ
	@RequestMapping(value = "/popupLocation")
	public void popupLocationAll(HttpSession session, Model model) throws Exception {
		logger.info(" popupLocation() 호출 ");
		model.addAttribute("jsonStr", new ObjectMapper().writeValueAsString(cservice.getNearbyClassList(session.getAttribute("userLat"), session.getAttribute("userLng"))));
	}
	//주변검색 팝업 HJ
	
	// 클래스 상세정보 TH
	// http://localhost:8080/th/detail?c_no=1
	@RequestMapping(value = "/detail")
	public void detailGET(@RequestParam("c_no")int c_no, Model model, HttpSession session) throws Exception {
		logger.info(" detailGET() 호출 ");
		
		String id = (String) session.getAttribute("id");
		logger.info("session.id : "+id);
		if (id != null) {
			MemberVO mvo = mservice.getMemberInfo(id);
			SubscriptionVO svo = sservice.getSubsInfo(id);
			logger.info("getInfo"+mvo);
			logger.info("svo:"+svo);
			model.addAttribute(mvo);
			if(svo==null) {
				svo = new SubscriptionVO();
			}
			model.addAttribute(svo);
		}
		ClassVO cvo = cservice.getClassDetail(c_no);
		List<TimetableVO> tvo = tservice.getTimetable(c_no);
		logger.info("cvo : "+cvo );
		logger.info("tvo.size  : "+tvo.size());
		model.addAttribute(cvo);
		model.addAttribute("dateList", tvo);
	}
	// 클래스 상세정보 TH
	
	// 클래스 등록 view 페이지 호출
	@RequestMapping(value = "/addClass", method = RequestMethod.GET)
	public void addGET() {
		logger.info(" addClassGET() 호출 ");
	}
	// 클래스 등록 view 페이지 호출

	// 클래스 등록 - 처리
	@RequestMapping(value = "/addClass", method = RequestMethod.POST)
	public String addPOST(HttpSession session, @ModelAttribute("vo") ClassVO vo,
			MultipartHttpServletRequest multiRequest) throws Exception {
		logger.info(" addClassPOST() 호출 ");
		String id = (String) session.getAttribute("id");
		// 한글처리
		multiRequest.setCharacterEncoding("UTF-8");
		String c_img = fservice.fileProcess(multiRequest);
		
		vo.setM_id(id);
		vo.setC_img(c_img);
		cservice.addClass(vo);

		logger.info("클래스 등록 완료@@@@@@@@@@@@");
		return "redirect:/member/classWorkSpace";
	}
	// 클래스 등록 - 처리
	
	// 시간 등록
	@RequestMapping(value = "/addTime", method = RequestMethod.POST)
	public String addTimePOST(@RequestParam Map<String, Object> map) throws Exception {
		logger.info(" addTimePOST() 호출 ");

		tservice.addTime(map);
		logger.info("Map@@@@@@@@@@@@" + map);

		return "redirect:/member/classWorkSpace";
	}
	// 시간 등록
	
}
