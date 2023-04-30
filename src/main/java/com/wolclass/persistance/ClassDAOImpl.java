package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.ClassVO;

@Repository
public class ClassDAOImpl implements ClassDAO{
	private static final Logger logger = LoggerFactory.getLogger(ClassDAOImpl.class);
	
	@Autowired
	private SqlSession session;

	@Override
	public ClassVO selectClass(Integer c_no) throws Exception {
		logger.info("dao-sql호출");
		ClassVO resultVO = session.selectOne(NAMESPACE+".selectClass",c_no);
		logger.info("dao-resultVO: "+resultVO);
		return resultVO;
	}
	
	@Override
	public List<ClassVO> getNearbyClassList(Map<String, Object> map) throws Exception {
		return session.selectList(NAMESPACE+".nearbyClassList", map);
	}

	@Override
	public int getClassListCnt(Map<String, Object> map) throws Exception {
		return session.selectOne(NAMESPACE+".classListCnt", map);
	}
	
	@Override
	public List<ClassVO> getClassList(Map<String, Object> map) throws Exception {
		return session.selectList(NAMESPACE+".classList", map);
	}

}
