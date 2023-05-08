package com.wolclass.persistance;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.MemberVO;

@Repository
public class DBDAOImpl implements DBDAO{
	private static final Logger logger = LoggerFactory.getLogger(DBDAOImpl.class);
	
	private static final String NAMESPACE ="com.wolclass.mapper.DbMapper";
	
	@Autowired
	private SqlSession sqlSession;
	// 회원가입 - 다빈
	@Override
	public void memberJoin(Map<String,Object> map) throws Exception {
		sqlSession.insert(NAMESPACE+".memberJoin",map);
	}
	// 아이디 중복검사 - 다빈
	@Override
	public Integer idCheck(String m_id) throws Exception{
		return sqlSession.selectOne(NAMESPACE+".idCheck",m_id);
	}
	// 이메일 중복검사 - 다빈
	@Override
	public Integer emailCheck(String m_email) throws Exception{
		return sqlSession.selectOne(NAMESPACE+".emailCheck", m_email);
	}
	// 전화번호 중복검사 - 다빈
	@Override
	public Integer phoneCheck(String m_phone) throws Exception{
		return sqlSession.selectOne(NAMESPACE+".phoneCheck", m_phone);
	}
	// 로그인 - 다빈
	@Override
	public MemberVO memberLogin(MemberVO vo) throws Exception {
		MemberVO resultVO = sqlSession.selectOne(NAMESPACE+".loginMember", vo);
		return resultVO;
	}
	// 아이디 찾기 - 다빈
	@Override
	public MemberVO findId(MemberVO vo) throws Exception {
		MemberVO findIdVO = sqlSession.selectOne(NAMESPACE+".findId",vo);
		return findIdVO;
	}
	
	// 비밀번호 찾기(임시비밀번호) - 다빈
	@Override
	public int findPw(MemberVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".findPw", vo);
	}
	// 비밀번호 찾기(임시비밀번호) - 다빈
	@Override
	public void updateTempPw(MemberVO vo) {
		sqlSession.update(NAMESPACE+".updatePw", vo);
	}
	
	// 카카오 - 다빈
	@Override
	public void kakaoInsert(MemberVO vo) throws Exception{
		sqlSession.insert(NAMESPACE+".kakaoInsert",vo);
	}
	
	// 카카오 - 다빈
	@Override
	public MemberVO kfindId(MemberVO vo) throws Exception {
		MemberVO kfindIdVO = sqlSession.selectOne(NAMESPACE+".kfindId", vo);
		return kfindIdVO;
	}
	
	// 특정회원조회 - 다빈
	@Override
	public MemberVO selectMember(String id) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".selectM", id);
	}
	
	// 프로필사진 변경 - 다빈
	@Override
	public void updateProfile(MemberVO vo) throws Exception {
		sqlSession.update(NAMESPACE+".profileImg", vo);
	}


	
	
}