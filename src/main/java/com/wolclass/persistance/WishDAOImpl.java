package com.wolclass.persistance;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.WishVO;

@Repository
public class WishDAOImpl implements WishDAO{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Integer> getCnoList(String m_id) {
		return session.selectList(NAMESPACE+".getCnoList", m_id);
	}

	@Override
	public void add(WishVO vo) {
		session.insert(NAMESPACE+".add", vo);
	}

	@Override
	public void delete(WishVO vo) {
		session.delete(NAMESPACE+".del", vo);
	}
	
}
