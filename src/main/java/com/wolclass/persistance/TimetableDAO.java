package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

import com.wolclass.domain.TimetableVO;

public interface TimetableDAO {
	String NAMESPACE = "com.wolclass.mappers.TimetableMapper";
	
	// 시간 중복 체크
	public int timeOverlapCheck(Map<String, Object> map) throws Exception;
	
	// 클래스 시간 등록 TJ
	public void addTime(Map<String, Object> map) throws Exception;
	
	// 예약 가능한 타임테이블 TH
	public List<TimetableVO> getTimetable(Integer c_no) throws Exception;
	
	// 예약 가능한 시간 TH
	public List<TimetableVO> getTime(TimetableVO vo) throws Exception;
	
	// 예약 가능한 최대 인원 TH
	public TimetableVO getRemainNum(TimetableVO vo) throws Exception;

}
