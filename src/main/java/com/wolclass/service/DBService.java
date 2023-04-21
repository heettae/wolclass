package com.wolclass.service;

import java.util.Map;

import com.wolclass.domain.MemberVO;

public interface DBService {
	
	// 회원가입 - db
	public void memberJoin(Map<String,Object> map) throws Exception;
	
	// 아이디 중복검사
	public Integer idCheck(String m_id) throws Exception;
}