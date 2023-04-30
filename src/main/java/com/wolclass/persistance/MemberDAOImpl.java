package com.wolclass.persistance;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public MemberVO getMemberInfo(String m_id) {
		MemberVO vo = session.selectOne(NAMESPACE+".getMemberInfo", m_id);
		return vo;
	}
	
}
