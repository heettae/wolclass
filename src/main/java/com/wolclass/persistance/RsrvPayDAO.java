package com.wolclass.persistance;

import com.wolclass.domain.PayDTO;

public interface RsrvPayDAO {
	String NAMESPACE = "com.wolclass.mappers.RsrvPayMapper";

	// 결제정보 디비에 등록 TH
	public void insertPaymentInfo(PayDTO pdto) throws Exception;
	
	// 결제정보 업데이트 TH
	public Integer updatePaymentInfo(PayDTO pdto) throws Exception;

	// db 가격 조회 TH
	public Integer selectPrice(String p_no) throws Exception;
}
