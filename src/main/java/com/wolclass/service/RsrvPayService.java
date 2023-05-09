package com.wolclass.service;

import com.wolclass.domain.PayDTO;

public interface RsrvPayService {

	// 결제 토큰 TH
	public String getAccessToken(PayDTO paymentsModel);
	
	// 결제정보 조회 TH
	public PayDTO getPaymentInfo(String accessToken, PayDTO pdto);
	
	// 결제 insert TH
	public void insertPaymentInfo(PayDTO pdto) throws Exception;
	
	// 결제 update TH
	public Integer updatePaymentInfo(PayDTO pdto) throws Exception;

	// DB price 조회 TH
	public Integer selectPrice(String p_no) throws Exception;
	
}
