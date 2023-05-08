package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.AlertVO;
import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;

@Repository
public class TJDAOImpl implements TJDAO {
	private static final Logger logger = LoggerFactory.getLogger(TJDAOImpl.class);
	static final String NAMESPACE = "com.wolclass.mappers.TJMapper";
	
	@Autowired
	private SqlSession sqlSession;

	// 클래스 등록
	@Override
	public int addClass(ClassVO vo) throws Exception {
		return sqlSession.insert(NAMESPACE+".addClass", vo);
	}
	// 클래스 등록

	// 클래스 시간 등록
	@Override
	public void addTime(Map<String, Object> map) throws Exception {
		sqlSession.insert(NAMESPACE+".addTime", map);
	}
	// 클래스 시간 등록
	
	// 시간 중복 체크
	@Override
	public int timeOverlapCheck(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".timeOverlapCheck", map);
	}
	// 시간 중복 체크
	
	// 등록 완료 클래스 리스트
	@Override
	public List<ClassVO> registerClassList(String m_id) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".registerClassList", m_id);
	}
	// 등록 완료 클래스 리스트
	

	// 회원정보 조회
	@Override
	public MemberVO getMemberInfo(String m_id) {
		MemberVO vo = sqlSession.selectOne(NAMESPACE+".getMemberInfo", m_id);
		
		return vo;
	}
	// 회원정보 조회


	// 키워드별 추천 - tj
	@Override
	public List<ClassVO> findByKeyword(String keyword) {
		
		return sqlSession.selectList(NAMESPACE+".findByKeyword", keyword);
	}
	// 키워드별 추천 - tj


	// 카테고리별 리스트
	@Override
	public List<ClassVO> getCategoryClassList() throws Exception {
		return sqlSession.selectList(NAMESPACE+".getCategoryClassList");
	}
	// 카테고리별 리스트
	
	// 반려견 생일 1주일 전
	@Override
	public int oneWeekBeforeBirth(String m_id) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".oneWeekBeforeBirth", m_id);
	}
	// 반려견 생일 1주일 전

	// 알림 목록
	@Override
	public List<AlertVO> getAlertList(String m_id) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".getAlertList", m_id);
	}
	// 알림 목록

	// 알림 체크
	@Override
	public void alertCheck(Integer a_no) throws Exception {
		sqlSession.update(NAMESPACE+".alertRead", a_no);
	}
	// 알림 체크

	// 알림 전체 체크
	@Override
	public void alertCheckAll(String m_id) throws Exception {
		sqlSession.update(NAMESPACE+".alertReadAll", m_id);
	}
	// 알림 전체 체크

	// 온라인 리스트
	@Override
	public List<ClassVO> getOnlineList() throws Exception {
		return sqlSession.selectList(NAMESPACE+".onlineClassList");
	}
	
	
	
	
	
}
