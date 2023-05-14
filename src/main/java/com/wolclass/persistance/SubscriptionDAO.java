package com.wolclass.persistance;

import com.wolclass.domain.SubscriptionVO;

public interface SubscriptionDAO {
	String NAMESPACE = "com.wolclass.mappers.SubscriptionMapper";
	
	// 구독정보 조회 TH
	public SubscriptionVO getSubsInfo(String m_id) throws Exception;
	
	// 구독 테이블 insert TH
	public Integer insertSubs(String m_id) throws Exception;
}
