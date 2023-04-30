package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

import com.wolclass.domain.ClassVO;

public interface ClassDAO {
	String NAMESPACE = "com.wolclass.mappers.ClassMapper";
	
	// 상세페이지 조회 TH
	public ClassVO selectClass(Integer c_no) throws Exception;
	
	// 페이징 처리를 위한 클래스 리스트 갯수 조회 HJ
	public int getClassListCnt(Map<String, Object> map) throws Exception;

	// 클래스 리스트 조회 HJ
	public List<ClassVO> getClassList(Map<String, Object> map) throws Exception;

	// 주변 검색 클래스 리스트 조회 HJ
	public List<ClassVO> getNearbyClassList(Map<String, Object> map) throws Exception;

}
