package com.wolclass.persistance;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);
	
	@Autowired
	private SqlSession session;
	
	@Override
	public MemberVO getMemberInfo(String m_id) {
		MemberVO vo = session.selectOne(NAMESPACE+".getMemberInfo", m_id);
		return vo;
	}
	
	// 회원가입 - 다빈
	@Override
	public void memberJoin(Map<String,Object> map) throws Exception {
		session.insert(NAMESPACE+".memberJoin",map);
	}
	// 아이디 중복검사 - 다빈
	@Override
	public Integer idCheck(String m_id) throws Exception{
		return session.selectOne(NAMESPACE+".idCheck",m_id);
	}
	// 이메일 중복검사 - 다빈
	@Override
	public Integer emailCheck(String m_email) throws Exception{
		return session.selectOne(NAMESPACE+".emailCheck", m_email);
	}
	// 전화번호 중복검사 - 다빈
	@Override
	public Integer phoneCheck(String m_phone) throws Exception{
		return session.selectOne(NAMESPACE+".phoneCheck", m_phone);
	}
	// 로그인 - 다빈
	@Override
	public MemberVO memberLogin(MemberVO vo) throws Exception {
		MemberVO resultVO = session.selectOne(NAMESPACE+".loginMember", vo);
		return resultVO;
	}
	// 아이디 찾기 - 다빈
	@Override
	public MemberVO findId(MemberVO vo) throws Exception {
		MemberVO findIdVO = session.selectOne(NAMESPACE+".findId",vo);
		return findIdVO;
	}
	
	// 비밀번호 찾기(임시비밀번호) - 다빈
	@Override
	public int findPw(MemberVO vo) throws Exception {
		return session.selectOne(NAMESPACE+".findPw", vo);
	}
	// 비밀번호 찾기(임시비밀번호) - 다빈
	@Override
	public void updateTempPw(MemberVO vo) {
		session.update(NAMESPACE+".updatePw", vo);
	}
	
	// 카카오 - 다빈
	@Override
	public void kakaoInsert(MemberVO vo) throws Exception{
		session.insert(NAMESPACE+".kakaoInsert",vo);
	}
	
	// 카카오 - 다빈
	@Override
	public MemberVO kfindId(MemberVO vo) throws Exception {
		MemberVO kfindIdVO = session.selectOne(NAMESPACE+".kfindId", vo);
		return kfindIdVO;
	}
	
}
