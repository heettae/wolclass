package com.wolclass.service;

import com.wolclass.domain.ClassVO;

public interface THService {

	// 디비 시간정보 조회
	public String getTime();
	
	// 상세페이지 조회
	public ClassVO getClassDetail(Integer c_no) throws Exception;
	
}
