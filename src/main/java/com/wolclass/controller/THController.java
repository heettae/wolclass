package com.wolclass.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.annotation.JsonAppend.Attr;
import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;
import com.wolclass.domain.PayDTO;
import com.wolclass.domain.SubscriptionVO;
import com.wolclass.domain.TimetableVO;
import com.wolclass.service.THService;
import com.wolclass.service.TJService;

@Controller
@RequestMapping("/th/*")
public class THController {
	
	private static final Logger logger = LoggerFactory.getLogger(THController.class);
	


	// 서비스 객체 주입
	@Autowired
	private THService service;
	
	@Autowired
	private TJService tjService;
	// http://localhost:8080/th/main
	@RequestMapping(value = "/main")
	public void mainGET() {
		logger.info(" mainGET() 호출 ");
	}
	
	// 클래스 상세정보 TH
	// http://localhost:8080/th/detail?c_no=1
	@RequestMapping(value = "/detail")
	public void detailGET(@RequestParam("c_no")int c_no, Model model, HttpSession session) throws Exception {
		logger.info(" detailGET() 호출 ");
		
		String id = (String) session.getAttribute("id");
		logger.info("session.id : "+id);
		if (id != null) {
			MemberVO mvo = tjService.getMemberInfo(id);
			SubscriptionVO svo = service.getSubsInfo(id);
			logger.info("getInfo"+mvo);
			logger.info("svo:"+svo);
			model.addAttribute(mvo);
			if(svo==null) {
				svo = new SubscriptionVO();
			}
			model.addAttribute(svo);
		}
		ClassVO cvo = service.getClassDetail(c_no);
		List<TimetableVO> tvo = service.getTimetable(c_no);
		logger.info("cvo : "+cvo );
		logger.info("tvo.size  : "+tvo.size());
		model.addAttribute(cvo);
		model.addAttribute("dateList", tvo);
		
		
		
	}
	// 클래스 상세정보 TH
	
	// 클래스 예약 가능한 시간 가져오기 TH
	@RequestMapping(value = "/getTime", method = RequestMethod.POST)
	@ResponseBody
	public List<TimetableVO> timePost(@RequestBody TimetableVO vo) throws Exception{
		logger.info(" timePost() 호출 ");
		//logger.info("t_date:"+t_date);
		//logger.info("c_no:"+c_no);
		logger.info("vo:"+vo);
		List<TimetableVO> tvo = service.getTime(vo);
		//logger.info("cvo : "+cvo );
		logger.info("tvo : "+tvo);
	
		return tvo;
	}
	// 클래스 예약 가능한 시간 가져오기 TH
	

	// 클래스 예약 가능한 인원 가져오기 TH
	@RequestMapping(value = "/getPNum", method = RequestMethod.POST)
	@ResponseBody
	public TimetableVO PNumPost(@RequestBody TimetableVO vo) throws Exception{

		logger.info(" PNumPost() 호출 ");
		logger.info("vo:"+vo);
		TimetableVO pNum = service.getRemainNum(vo);
		//logger.info("cvo : "+cvo );
		logger.info("tvo : "+pNum);
	
		return pNum;
	}
	// 클래스 예약 가능한 인원 가져오기 TH
	
	
	// 주문번호 가져오기 TH
	@RequestMapping(value = "/getP_no", method = RequestMethod.POST)
	@ResponseBody
	public int p_noPost() throws Exception{

		logger.info(" p_noPost() 호출 ");

		int pno = service.makeP_no();
		//logger.info("cvo : "+cvo );
		logger.info("pno : "+pno);
	
		return pno;
	}
	// 주문번호 가져오기 TH
	
	
	 //결제 처리하기 TH
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public String payment(@ModelAttribute PayDTO pdto, HttpSession session) throws Exception{
		logger.info("payment() 실행 ");
		String id = (String) session.getAttribute("id");

		logger.info("pdto : "+pdto);
		service.payment(pdto);
		return "redirect:/th/payList";
		
	}
	 //결제 처리하기 TH
	
	
	@RequestMapping(value = "/payList", method = RequestMethod.GET)
	public void payListGET() throws Exception{
		logger.info("payList() 실행 ");


		
	}
	
	// http://localhost:8080/th/calender
	@RequestMapping(value = "/calender")
	public void calenderGET() {
		logger.info(" calenderGET() 호출 ");
	}
	
	

	
	
}
