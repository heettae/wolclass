package com.wolclass.persistance;

import java.util.Map;

import com.wolclass.domain.MemberVO;

public interface DBDAO {
	
	// 회원가입 - 다빈
	public void memberJoin(Map<String,Object> map) throws Exception;
	
	// 아이디 중복검사 - 다빈
	public Integer idCheck(String m_id) throws Exception;;
	
	// 이메일 중복검사 - 다빈
	public Integer emailCheck(String m_email) throws Exception;;
	
	// 전화번호 중복검사 - 다빈
	public Integer phoneCheck(String m_phone) throws Exception;;
	
	// 로그인 - 다빈
	public MemberVO memberLogin(MemberVO vo) throws Exception;
	
	// 아이디 찾기 - 다빈
	public MemberVO findId(MemberVO vo) throws Exception;
	
	// 비밀버호 찾기(임시 비밀번호) - 다빈
	public int findPw(MemberVO vo) throws Exception;

	// 임시비밀번호 설정 - 다빈
	public void updateTempPw(MemberVO vo);
	
	// 카카오 로그인 
	public void kakaoInsert(MemberVO vo) throws Exception;
	
	// 카카오아이디  - 다빈
	public MemberVO kfindId(MemberVO vo) throws Exception;
	
	// 특정회원조회 - 다빈 
	public MemberVO selectMember(String id) throws Exception;
	
	// 프로필사진 변경 - 다빈	
	public void updateProfile(MemberVO vo) throws Exception;
		

}