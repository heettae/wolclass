package com.wolclass.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;
import com.wolclass.domain.PayDTO;
import com.wolclass.domain.ReplyVO;
import com.wolclass.domain.RsrvPayVO;
import com.wolclass.domain.SubscriptionVO;
import com.wolclass.domain.TimetableVO;
import com.wolclass.service.ReplyService;
import com.wolclass.service.SwBoardService;
import com.wolclass.service.THService;
import com.wolclass.service.TJService;
import com.wolclass.service.WishService;

@Controller
@RequestMapping("/th/*")
public class THController {
	
	private static final Logger logger = LoggerFactory.getLogger(THController.class);
	


	// 서비스 객체 주입
	@Autowired
	private THService service;
	
	@Autowired
	private WishService wservice;
	

	@Autowired
	private TJService tjService;
	
	
	@Autowired
	private SwBoardService swService;
	
	@Autowired
	private ReplyService replyService;
	
	
	
	
	// http://localhost:8080/th/main
	@RequestMapping(value = "/main")
	public void mainGET() {
		logger.info(" mainGET() 호출 ");
	}
	
	// 클래스 상세정보 TH
	// http://localhost:8080/th/detail?c_no=56
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
			model.addAttribute("wishList", wservice.getCnoList((String) session.getAttribute("id")));
		}
		ClassVO cvo = service.getClassDetail(c_no);
		List<TimetableVO> tvo = service.getTimetable(c_no);
		logger.info("cvo : "+cvo );
		logger.info("tvo.size  : "+tvo.size());
		model.addAttribute(cvo);
		model.addAttribute("dateList", tvo);
		
	
		// 후기
		Map<String,Object> map = new HashMap<>();
		map.put("c_no",c_no);
		model.addAttribute("reviewList", replyService.getList(map));
		model.addAttribute("map", map);

	}
	// 클래스 상세정보 TH
	
	// 클래스 예약 가능한 시간 가져오기 TH
	@RequestMapping(value = "/getTime", method = RequestMethod.POST)
	@ResponseBody
	public List<TimetableVO> timePost(@RequestBody TimetableVO vo) throws Exception{
		logger.info(" timePost() 호출 ");
		logger.info("vo:"+vo);
		List<TimetableVO> tvo = service.getTime(vo);
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
		logger.info("tvo : "+pNum);
	
		return pNum;
	}
	// 클래스 예약 가능한 인원 가져오기 TH
	
	
	// 주문번호 가져오기 TH(0504수정)
	@RequestMapping(value = "/getP_no", method = RequestMethod.POST)
	@ResponseBody
	public String p_noPost() throws Exception{

		logger.info(" p_noPost() 호출 ");

		String pno = service.makeP_no();

		logger.info("pno : "+pno);
	
		return pno;
	}
	// 주문번호 가져오기 TH(0504수정)
	
	
	 //결제 처리하기 TH
	@RequestMapping(value = "/orderSuccess", method = RequestMethod.POST)
	@ResponseBody
	public Integer orderSuccess(@RequestBody PayDTO pdto) throws Exception{
		int cnt = 0;
		logger.info("orderSuccess() 호출 ");
		logger.info("pdto : "+pdto);
		if(pdto.getC_no()==null) {
			cnt = service.insertSubs(pdto.getM_id());
			logger.info("구독 insert 완료"+cnt);
		} else {
			cnt = service.modifyOrder(pdto.getP_no());
			logger.info("주문 update 완료"+cnt);
		}
		return cnt;
		
	}

	 //결제 처리하기 TH
	
	// payments
	@RequestMapping(value = "/payments", method = RequestMethod.GET)
	public void paymentsGET() throws Exception{
		logger.info("payments() 실행 ");
		
	}
	


	
	
}
