package com.wolclass.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.domain.SubscriptionVO;
import com.wolclass.persistance.SubscriptionDAO;

@Service
public class SubscriptionServiceImpl implements SubscriptionService {

	@Autowired
	private SubscriptionDAO dao;

	@Override
	public SubscriptionVO getSubsInfo(String m_id) throws Exception {
		return dao.getSubsInfo(m_id);
	}

}
