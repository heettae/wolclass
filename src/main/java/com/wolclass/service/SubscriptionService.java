package com.wolclass.service;

import com.wolclass.domain.SubscriptionVO;

public interface SubscriptionService {
	
	// 구독정보 조회 TH
	public SubscriptionVO getSubsInfo(String m_id) throws Exception;
	
	// 구독 테이블 insert TH
	public Integer insertSubs(String m_id) throws Exception;
}
