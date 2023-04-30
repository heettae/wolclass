package com.wolclass.service;

import java.util.List;

import com.wolclass.domain.TimetableVO;

public interface TimetableService {
	
	// 예약가능한 타임테이블 가져오기 TH
	public List<TimetableVO> getTimetable(Integer c_no) throws Exception;
}
