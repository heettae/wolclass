package com.wolclass.service;

import java.util.List;

import com.wolclass.domain.ClassVO;
import com.wolclass.domain.PayDTO;
import com.wolclass.domain.RsrvPayVO;
import com.wolclass.domain.SubscriptionVO;
import com.wolclass.domain.TimetableVO;

public interface THService {

	// 디비 시간정보 조회
	public String getTime();
	
	// 상세페이지 조회 TH
	public ClassVO getClassDetail(Integer c_no) throws Exception;
	
	// 예약가능한 타임테이블 가져오기 TH
	public List<TimetableVO> getTimetable(Integer c_no) throws Exception;
	
	// 예약가능한 시간 가져오기 TH
	public List<TimetableVO> getTime(TimetableVO vo) throws Exception;
	
	// 예약가능한 최대 인원 가져오기 TH
	public TimetableVO getRemainNum(TimetableVO vo) throws Exception;
	
	// 구독정보 조회 TH
	public SubscriptionVO getSubsInfo(String m_id) throws Exception;
	
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
