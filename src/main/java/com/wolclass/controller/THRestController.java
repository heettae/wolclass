package com.wolclass.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.wolclass.domain.PayDTO;
import com.wolclass.service.THService;

@RequestMapping("/th/payments")
@RestController
public class THRestController {

	
	
private static final Logger logger = LoggerFactory.getLogger(THController.class);
	


	// 서비스 객체 주입
	@Autowired
	private THService service;
	
	

	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	public ResponseEntity<String> paymentsPOST(@RequestBody PayDTO dto) throws Exception{
		logger.info("paymensPOST() 호출");
		logger.info("dto : "+dto);
		int result = 0;
		ResponseEntity<String> respEntity = null;
		
		try {
			result = service.payment(dto);
			if (result == 1) {
				respEntity = new ResponseEntity<String>("payOK", HttpStatus.OK);
			}

		} catch (Exception e) { // Exception : 예외에 대한 정보를 알려줌

			if (result != 1) { // 수정 실패
				respEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST); // error 400
			}
		}
		return respEntity;		
	}


	
	@RequestMapping(value = "/refund", method = RequestMethod.POST)
	public String refundPOST(@RequestBody PayDTO dto) throws Exception {
		logger.info("refundPOST() 호출");
		// @RequestBody JSON형태로 전달된 데이터를 매핑되는 객체가 있다면 
		logger.info(dto + "");
		return "";
	}
	
//	
//	
//	@RequestMapping(value = "/complete", method = RequestMethod.POST)
//    public String completePayment(@PathVariable("imp_uid") String impUid) {
//		String apiUrl = "https://api.iamport.kr/payments/" + impUid;
//		URL url = new URL(apiUrl);
//		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//		conn.setRequestMethod("GET");
//		conn.setRequestProperty("Authorization", "Basic " + Base64.getEncoder().encodeToString((apiKey + ":" + apiSecret).getBytes()));
//		BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
//		StringBuffer sb = new StringBuffer();
//		String line;
//		while ((line = br.readLine()) != null) {
//		    sb.append(line);
//		}
//		conn.disconnect();
//
//		Gson gson = new Gson();
//		Payment payment = gson.fromJson(sb.toString(), Payment.class);
//		PaymentResult paymentResult = new PaymentResult(payment);
//    
//}
	
}
