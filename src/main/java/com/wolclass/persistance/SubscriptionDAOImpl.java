package com.wolclass.persistance;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.SubscriptionVO;

@Repository
public class SubscriptionDAOImpl implements SubscriptionDAO{
	private static final Logger logger = LoggerFactory.getLogger(SubscriptionDAOImpl.class);
	
	@Autowired
	private SqlSession session;

	@Override
	public SubscriptionVO getSubsInfo(String m_id) throws Exception {
		logger.info("dao.getSubInfo: "+m_id);
		SubscriptionVO resultVO = session.selectOne(NAMESPACE+".getSubsInfo",m_id);
		logger.info("dao.getSubInfo-resultVO: "+resultVO);
		
		return resultVO;
	}
	
}
