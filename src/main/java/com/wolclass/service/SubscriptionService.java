package com.wolclass.service;

import com.wolclass.domain.SubscriptionVO;

public interface SubscriptionService {
	// 구독정보 조회 TH
	public SubscriptionVO getSubsInfo(String m_id) throws Exception;
}
