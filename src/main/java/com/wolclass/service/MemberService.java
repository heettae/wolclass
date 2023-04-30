package com.wolclass.service;

import com.wolclass.domain.MemberVO;

public interface MemberService {
	
	// 회원 정보 조회
	public MemberVO getMemberInfo(String m_id) throws Exception;
}
