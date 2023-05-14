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
	private SqlSession sqlSession;

	@Override
	public SubscriptionVO getSubsInfo(String m_id) throws Exception {
		logger.info("dao.getSubInfo: "+m_id);
		SubscriptionVO resultVO = sqlSession.selectOne(NAMESPACE+".getSubsInfo",m_id);
		logger.info("dao.getSubInfo-resultVO: "+resultVO);
		return resultVO;
	}
	
	@Override
	public Integer insertSubs(String m_id) throws Exception {
		int cnt = sqlSession.insert(NAMESPACE+".insertSubs",m_id);
		logger.info("cnt : "+cnt);
		return cnt;
	}
	
}
