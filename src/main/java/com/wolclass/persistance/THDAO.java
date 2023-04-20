package com.wolclass.persistance;

import com.wolclass.domain.ClassVO;

public interface THDAO {
	// 디비 시간정보 조회
	public String getDBTime();
	
	// 상세페이지 조회
	public ClassVO selectClass(Integer c_no) throws Exception;
}
