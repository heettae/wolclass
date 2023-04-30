package com.wolclass.persistance;

import java.util.List;

import com.wolclass.domain.TimetableVO;

public interface TimetableDAO {
	String NAMESPACE = "com.wolclass.mappers.TimetableMapper";
	
	// 예약 가능한 타임테이블 TH
	public List<TimetableVO> getTimetable(Integer c_no) throws Exception;
}
