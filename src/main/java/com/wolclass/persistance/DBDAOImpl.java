package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.BoardVO;
import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;
import com.wolclass.domain.RsrvPayVO;
import com.wolclass.domain.SubscriptionVO;

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
	
	// 회원정보 수정 - 다빈
	@Override
	public void updateMember(Map<String,Object> map) throws Exception {
		sqlSession.update(NAMESPACE+".updateMember",map);
	}
	
	// 회원탈퇴 - 다빈
	@Override
	public void deleteMember(MemberVO vo) throws Exception {
		sqlSession.update(NAMESPACE+".deleteMember",vo);
	}
	
	// 결제내역 - 다빈
	@Override
	public List<Map<String,Object>> payList(Map<String,Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE+".payList",map);
	}
	
	// 내가 신청한 클래스(예약클래스) - 다빈
	@Override
	public List<Map<String,Object>> classList(Map<String,Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE+".classList", map);
	}
	
	// 내가 신청한 클래스(지난클래스) - 다빈
	@Override
	public List<Map<String,Object>> classList2(Map<String,Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE+".classList2", map);
	}
	
	// 메시지(받은) - 다빈
	@Override
	public List<BoardVO> msgList1(Map<String,Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE+".msgList1", map);
	}
	
	// 메시지(보낸) - 다빈
	@Override
	public List<BoardVO> msgList2(Map<String,Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE+".msgList2", map);
	}
	
	// 구독(남은기간) - 다빈 
	@Override
	public SubscriptionVO subscribe(String id) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".subday",id);
	}
	
	// 문의하기 - 다빈
	@Override
	public void myinquiry(RsrvPayVO vo) throws Exception {
		sqlSession.selectOne(NAMESPACE+".qna", vo);
	}
	
	// 문의하기 - 처리 - 다빈
	@Override
	public void myinquiryPro(Map<String, Object> map) throws Exception {
		sqlSession.insert(NAMESPACE+".insertQna", map);
	}
	
	// 마이페이지(후기등록) - 다빈
	@Override
	public void myreviewPro(Map<String, Object> map) throws Exception {
		sqlSession.insert(NAMESPACE+".myreview", map);
	}
	
	// 마이페이지(리뷰등록 완려) - 다빈
	@Override
	public void myreviewOk(String p_no) throws Exception {
		sqlSession.update(NAMESPACE+".reviewOK", p_no);
	}
	
	// 페이징 - 다빈
	@Override
	public Integer getclassListCnt(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".classListCnt", map);
	}
	@Override
	public Integer getclassList2Cnt(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".classList2Cnt", map);
	}
	@Override
	public Integer getmsgListCnt(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".msgList1Cnt", map);
	}
	@Override
	public Integer getmsgList2Cnt(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".msgList2Cnt", map);
	}
	@Override
	public Integer getpayListCnt(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".payListCnt", map);
	}
}