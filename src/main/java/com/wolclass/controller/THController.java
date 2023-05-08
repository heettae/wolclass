package com.wolclass.controller;

import java.util.List;

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
import com.wolclass.domain.RsrvPayVO;
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
	
	
	// 주문번호 가져오기 TH(0504수정)
	@RequestMapping(value = "/getP_no", method = RequestMethod.POST)
	@ResponseBody
	public String p_noPost() throws Exception{

		logger.info(" p_noPost() 호출 ");

		String pno = service.makeP_no();
		//logger.info("cvo : "+cvo );
		logger.info("pno : "+pno);
	
		return pno;
	}
	// 주문번호 가져오기 TH(0504수정)
	
	
//	 //결제 처리하기 TH
//	@RequestMapping(value = "/detail", method = RequestMethod.POST)
//	public String payment(@ModelAttribute PayDTO pdto, HttpSession session) throws Exception{
//		logger.info("payment() 실행 ");
//		String id = (String) session.getAttribute("id");
//
//		logger.info("pdto : "+pdto);
//		service.insertPaymentinfo()(pdto);
//		return "redirect:/th/payments";
//		
//	}
//	 //결제 처리하기 TH
	
	
	 //결제 처리하기 TH
//	@RequestMapping(value = "/payments", method = RequestMethod.POST)
//	public String payments(HttpSession session) throws Exception{
//		logger.info("payment() 실행 ");
//		String id = (String) session.getAttribute("id");
//
////		logger.info("pdto : "+pdto);
////		service.payment(pdto);
//		return "redirect:/th/payments";
//		
//	}

	 //결제 처리하기 TH
	
	
	@RequestMapping(value = "/payments", method = RequestMethod.GET)
	public void paymentsGET() throws Exception{
		logger.info("payments() 실행 ");
		
		RsrvPayVO vo = new RsrvPayVO();
		vo.setP_no(1);

	}
	
//	// 환불하기 TH
//	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
//	@ResponseBody
//	public String cancelPOST(@RequestBody String merchant_uid) throws Exception{
//
//		logger.info(" cancelPOST() 호출 ");
//
//
//		logger.info("m : "+merchant_uid);
//	
//		return merchant_uid;
//	}
//	// 환불하기 TH
	
	
	
	// http://localhost:8080/th/cancelTest
	@RequestMapping(value = "/cancelTest")
	public void cancelTestGET() {
		logger.info(" cancelTestGET() 호출 ");
	}
	
	
	
	/////////////////////////////////////////////////
	
	   //private PaymentsService paymentsService;
		
//		@ResponseBody
//		@PostMapping("/insertPaymentInfo")
//		public String insertPaymentInfo(@RequestBody PaymentsModel paymentsModel) {
//			// STEP5-3. 결제 정보 검증 후 저장하기
//			// 처음에 요청했던 금액 저장하기
//			try {
//				paymentsService.insertPaymentInfo(paymentsModel);
//				return "ok";	
//			}catch(Exception e){
//				return "ng";
//			}
//		}
//		
		
	
//		@ResponseBody
//		@RequestMapping(value = "/complete", method = RequestMethod.POST)
//		public String complete(@ModelAttribute PayDTO pdto) throws Exception {
//			logger.info("pdto:"+pdto);
//			// STEP5. 결제 정보 검증 및 저장하기
//			try {
//				// STEP5-2. 결제 정보 조회하기
//				// 액세스 토큰(access token) 발급 받기
//				String accessToken = service.getAccessToken(pdto);
//				logger.info("token"+accessToken);
//				// imp_uid로 아임포트 서버에서 결제 정보 조회
//				PayDTO paymentInfo = service.getPaymentInfo(accessToken, pdto);
//				logger.info("결제정보조회"+paymentInfo);
//				// STEP5-3. 결제 정보 검증 후 저장하기
//				// DB에서 결제되어야 하는 금액 조회
////				String amountToBePaid = service.getAmountToBePaid(paymentsModel);
////				int amount = paymentInfo.getAmount();
////				// 결제 검증하기
////				if(Integer.parseInt(amountToBePaid) == amount) {
////					service.updatePaymentInfo(paymentInfo); // DB에 결제 정보 저장
////					if(paymentInfo.getStatus().equals("paid")) { // 결제 완료
////						return "success";
////					}else if(paymentInfo.getStatus().equals("ready")) { // 가상계좌발급
////						return "vbankIssued";
////					}else {
////						return "fail";
////					}
////				}else { // 결제금액 불일치. 위/변조 된 결제
////					return "forgery";
////				}
//				return null; // 임시
//			}catch(Exception e) {
//				return "exception";
//			}
//		}







	
	
}
