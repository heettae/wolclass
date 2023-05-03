package com.wolclass.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;

public interface TJService {
	// 클래스 등록
	public int addClass(ClassVO vo) throws Exception;
	
	// 클래스 시간 등록
	public void addTime(Map<String, Object> map) throws Exception;
	
	// 등록 완료 클래스 리스트
	public List<ClassVO> registerClassList(String m_id) throws Exception;
	
	// 파일 처리
	public List<String> fileProcess(MultipartHttpServletRequest multiRequest) throws Exception;
	
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
