package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDataDAOImpl implements SearchDataDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<String> getPSList() throws Exception {
		return session.selectList(NAMESPACE+".pslist");
	}

	@Override
	public boolean getClassCount(String word) {
		return ((int)session.selectOne(NAMESPACE+".classCount", word)) > 0;
	}

	@Override
	public void insert(Map<String, Object> map) throws Exception {
		session.insert(NAMESPACE+".insert", map);
	}

}
