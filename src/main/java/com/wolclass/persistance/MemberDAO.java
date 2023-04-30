package com.wolclass.persistance;

import com.wolclass.domain.MemberVO;

public interface MemberDAO {
	String NAMESPACE = "com.wolclass.mappers.MemberMapper";
	
	// 회원 조회
	public MemberVO getMemberInfo(String m_id) throws Exception;
}
