package com.wolclass.persistance;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.ClassVO;

@Repository
public class TJDAOImpl implements TJDAO {
	
	static final String NAMESPACE = "com.wolclass.mappers.TJMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void addClass(ClassVO vo) throws Exception {
		sqlSession.insert(NAMESPACE+".addClass", vo);
	}
	
}
