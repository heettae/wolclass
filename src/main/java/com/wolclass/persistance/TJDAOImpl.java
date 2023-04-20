package com.wolclass.persistance;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TJDAOImpl implements TJDAO {
	
	static final String NAMESPACE = "com.wolclass.mappers.TJMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
}
