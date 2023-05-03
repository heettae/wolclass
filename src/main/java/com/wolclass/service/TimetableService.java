package com.wolclass.service;

import java.util.List;
import java.util.Map;

import com.wolclass.domain.TimetableVO;

public interface TimetableService {
	
	// 예약가능한 타임테이블 가져오기 TH
	public List<TimetableVO> getTimetable(Integer c_no) throws Exception;
	
	// 클래스 시간 등록 TJ
	public void addTime(Map<String, Object> map) throws Exception;
}
