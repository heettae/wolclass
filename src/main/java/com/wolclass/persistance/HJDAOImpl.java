package com.wolclass.persistance;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.PopularSearchVO;

@Repository
public class HJDAOImpl implements HJDAO{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<PopularSearchVO> getPSList() throws Exception {
		return session.selectList(NAMESPACE+"pslist");
	}
	
}
