package com.wolclass.persistance;

import com.wolclass.domain.PayDTO;
import com.wolclass.domain.RsrvPayVO;

public interface RsrvPayDAO {
	String NAMESPACE = "com.wolclass.mappers.RsrvPayMapper";

	// 주문번호+1 TH
	public String makeP_no() throws Exception;
	
	// 결제정보 디비에 등록 TH
	public void insertPaymentInfo(PayDTO pdto) throws Exception;
	
	// 결제정보 업데이트 TH (5/10 PayDTO -> rsrvPay rvo)
	public Integer updatePaymentInfo(RsrvPayVO rvo) throws Exception;

	// db 가격 조회 TH
	public Integer selectPrice(String p_no) throws Exception;
	
	// 결제 완료 - 업데이트 TH
	public Integer modifyOrder(String p_no) throws Exception;
	
	// DB 결제정보 조회 TH
	public RsrvPayVO selectPayInfo(String p_no) throws Exception;
}
