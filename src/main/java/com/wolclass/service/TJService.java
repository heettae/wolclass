package com.wolclass.service;

import java.sql.Timestamp;
import java.util.List;

import com.wolclass.domain.AlertVO;
import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;

public interface TJService {
	public void addClass(ClassVO vo) throws Exception;
	
//	public List<ClassVO> getRecommendations(String m_id);
	
	// 회원 정보 조회
	public MemberVO getMemberInfo(String m_id) throws Exception;
	
	// 사용자 기반 카테고리별 추천 리스트
	public List<ClassVO> findByKeyword(String keyword) throws Exception;
	
	// 반려견 나이 계산
	public Integer calculateAge(Timestamp birth) throws Exception;
	
	// 카테고리별 클래스 리스트
	public List<ClassVO> getCategoryClassList() throws Exception;
	
	// 반려견 생일 1주일 전 계산
	public int oneWeekBeforeBirth(String m_id) throws Exception;
	

}
