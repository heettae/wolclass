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
	private SqlSession sqlSession;
	
	// 온라인 리스트
	@Override
	public List<ClassVO> getOnlineList() throws Exception {
		return sqlSession.selectList(NAMESPACE+".onlineClassList");
	}
	
	// 키워드별 추천 - tj
	@Override
	public List<ClassVO> findByKeyword(String keyword) {
		return sqlSession.selectList(NAMESPACE+".findByKeyword", keyword);
	}
	// 키워드별 추천 - tj

	// 카테고리별 리스트
	@Override
	public List<ClassVO> getCategoryClassList() throws Exception {
		return sqlSession.selectList(NAMESPACE+".getCategoryClassList");
	}
	// 카테고리별 리스트
	
	@Override
	public void addClass(ClassVO vo) throws Exception {
		sqlSession.insert(NAMESPACE+".addClass", vo);
	}
	
	@Override
	public List<ClassVO> registerClassList(String m_id) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".registerClassList", m_id);
	}
	
	@Override
	public ClassVO selectClass(Integer c_no) throws Exception {
		logger.info("dao-sql호출");
		ClassVO resultVO = sqlSession.selectOne(NAMESPACE+".selectClass",c_no);
		logger.info("dao-resultVO: "+resultVO);
		return resultVO;
	}
	
	@Override
	public List<ClassVO> getNearbyClassList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE+".nearbyClassList", map);
	}

	@Override
	public int getClassListCnt(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".classListCnt", map);
	}
	
	@Override
	public List<ClassVO> getClassList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE+".classList", map);
	}

}
