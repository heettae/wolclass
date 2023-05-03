package com.wolclass.service;

import java.util.Map;

import com.wolclass.domain.MemberVO;

public interface MemberService {
	
	// 회원 정보 조회
	public MemberVO getMemberInfo(String m_id) throws Exception;
	
	// 회원가입 - 다빈
	public void memberJoin(Map<String,Object> map) throws Exception;
	
	// 아이디 중복검사 - 다빈
	public Integer idCheck(String m_id) throws Exception;
	
	// 이메일 중복검사 - 다빈
	public Integer emailCheck(String m_email) throws Exception;
	
	// 전화번호 중복검사 - 다빈
	public Integer phoneCheck(String m_phone) throws Exception;
	
	// 로그인 - 다빈
	public MemberVO memberLogin(MemberVO vo) throws Exception;
	
	// 아이디 찾기 - 다빈
	public MemberVO findId(MemberVO vo) throws Exception;
	
	// 비밀번호 찾기 - 다빈
	public boolean findPw(MemberVO vo) throws Exception;

	// 임시비밀번호 설정 - 다빈
	public void updateTempPw(MemberVO vo);
	
	// 카카오로그인 토큰 - 다빈
	public String getToken(String code) throws Exception;
	public Map<String, String> getUserInfo(String access_token) throws Exception;
	
	// 카카오 insert
	public void kakaoInsert(MemberVO vo) throws Exception;
	public MemberVO kfindId(MemberVO vo) throws Exception;
}
