package com.wolclass.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wolclass.domain.PayDTO;
import com.wolclass.domain.RsrvPayVO;
import com.wolclass.service.THService;

@RequestMapping("/thr")
@RestController
public class THRestController {

	
	
private static final Logger logger = LoggerFactory.getLogger(THController.class);
	


	// 서비스 객체 주입
	@Autowired
	private THService service;
	

	@RequestMapping(value = "/insertPaymentInfo", method = RequestMethod.POST)
	public String insertPaymentInfo(@RequestBody PayDTO pdto) {
		logger.info("insertPaymentInfo 호출 ");
		// STEP5-3. 결제 정보 검증 후 저장하기
		// 처음에 요청했던 금액 저장하기
		try {
			service.insertPaymentInfo(pdto);
			return "ok";	
		}catch(Exception e){
			e.printStackTrace();
			logger.info("e"+e);
			return "ng";
		}
	}




	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	public ResponseEntity<String> completePOST(@RequestBody PayDTO pdto) throws Exception{
		logger.info("completePOST() 호출");
		logger.info("pdto : "+pdto);
		int result = 0;
		ResponseEntity<String> respEntity = null;
		
		logger.info("pdto:"+pdto);
		// STEP5. 결제 정보 검증 및 저장하기
		try {
			// STEP5-2. 결제 정보 조회하기
			// 액세스 토큰(access token) 발급 받기
			String accessToken = service.getAccessToken();
			logger.info("token"+accessToken);
			// imp_uid로 아임포트 서버에서 결제 정보 조회
			// PayDTO -> rsrvPay로 변경하였음 (이유: service.updatePaymentInfo 환불할때도 쓸거라서)
			RsrvPayVO paymentInfo = service.getPaymentInfo(accessToken, pdto);
			
			logger.info("결제정보조회"+paymentInfo);
			// STEP5-3. 결제 정보 검증 후 저장하기
			// 결제되어야 하는 금액 조회
			int selectPrice = service.selectPrice(pdto.getP_no());
			logger.info("selectPrice"+selectPrice);
			int amount = paymentInfo.getP_price(); // paymentInfo 타입 변경해서 바꿈
			logger.info("db에 입력된 금액"+selectPrice+",결제된 금액"+amount);
										// 내부에서 price 계산하는건데 여기 있으면 안될듯
										//int totalPrice = service.totalPrice(pdto); 
			// 결제 검증하기
			if(selectPrice == amount) {
				service.updatePaymentInfo(paymentInfo); // DB에 결제 정보 저장
				logger.info("update"+pdto);
				if(paymentInfo.getP_status().equals("paid")) { // 결제 완료 // paymentInfo 타입 변경해서 바꿈
					respEntity = new ResponseEntity<String>("success", HttpStatus.OK);
				//}else if(paymentInfo.getStatus().equals("ready")) { // 가상계좌발급
				//	return "vbankIssued";
				}else {
					respEntity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST); // error 400
				}
			}else { // 결제금액 불일치. 위/변조 된 결제
				respEntity = new ResponseEntity<String>("ddd", HttpStatus.BAD_REQUEST);
			}
			
		}catch(Exception e) {
			respEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return respEntity;		
	}


	
	
	
	
	
	@RequestMapping(value = "/checkPayment", method = RequestMethod.POST)
	public String checkPaymentPOST(@RequestBody String p_no) throws Exception {
		logger.info("checkPaymentPOST() 호출");
		
		logger.info("p_no: "+p_no);
		RsrvPayVO resultVO = service.selectPayInfo(p_no);
		logger.info(resultVO + "");
		return p_no; // return 뭘로할지 고민하기
	}
	
	@RequestMapping(value = "/refund", method = RequestMethod.POST)
	public String refundPOST(@RequestBody String p_no) throws Exception {
		logger.info("refundPOST() 호출");
		logger.info("p_no: "+p_no);
		
		/*엑세스 토큰(access token) 발급 */
		String accessToken = service.getAccessToken();
		/*결제정보 조회*/
		RsrvPayVO resultVO = service.selectPayInfo(p_no);
		
//		int cancelableAmount = paymentInfoByMerchantId.getAmount() - paymentInfoByMerchantId.getCancelAmount();
//		
//		if(cancelableAmount <= 0) {// 이미 전액 환불된 경우
//			return ("already refund");
//		}
		/*아임포트 REST API로 결제환불 요청*/
		
		//paymentInfoByMerchantId.setAmount(여기에 환불할 금액을 계산해서 넣으면 됨);
		
		//PaymentsModel cancelInfo = paymentsService.getCancelInfo(accessToken, paymentInfoByMerchantId, cancelableAmount);
		RsrvPayVO cancelInfo = service.getCancelInfo(accessToken, resultVO);
		/*환불결과 동기화*/
		service.updatePaymentInfo(cancelInfo);
		
		return "ok";


	}
	

}
