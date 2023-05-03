package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

import com.wolclass.domain.TimetableVO;

public interface TimetableDAO {
	String NAMESPACE = "com.wolclass.mappers.TimetableMapper";
	
	// 예약 가능한 타임테이블 TH
	public List<TimetableVO> getTimetable(Integer c_no) throws Exception;
	
	// 클래스 시간 등록 TJ
	public void addTime(Map<String, Object> map) throws Exception;
}
