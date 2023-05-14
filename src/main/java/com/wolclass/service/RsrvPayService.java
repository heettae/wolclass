package com.wolclass.service;

import com.wolclass.domain.PayDTO;
import com.wolclass.domain.RsrvPayVO;

public interface RsrvPayService {

	// 주문번호 TH
	public String makeP_no() throws Exception;
	
	// 가격 계산 TH (5/8 수정)
	public Integer totalPrice(PayDTO pdto) throws Exception;
	
	// 토큰 TH
	public String getAccessToken();
	
	// 서버 결제정보 조회 TH (5/10 타입 PayDTO -> RsrvPayVO 수정)
	public RsrvPayVO getPaymentInfo(String accessToken, PayDTO pdto);
	
	// 결제 insert TH
	public void insertPaymentInfo(PayDTO pdto) throws Exception;
	
	// 결제 update TH (5/10 수정 (PayDTO -> RsrvPayVO))
	public Integer updatePaymentInfo(RsrvPayVO rvo) throws Exception;

	// DB price 조회 TH
	public Integer selectPrice(String p_no) throws Exception;
	
	// 결제 완료 - 업데이트 TH
	public Integer modifyOrder(String p_no) throws Exception;
	
	// DB 결제정보 조회 TH
	public RsrvPayVO selectPayInfo(String p_no) throws Exception;
	
	// 서버 결제정보 조회 TH
	public RsrvPayVO getCancelInfo(String accessToken, RsrvPayVO rvo) throws Exception;
	
}
