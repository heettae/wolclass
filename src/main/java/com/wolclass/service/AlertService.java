package com.wolclass.service;

import java.util.List;

import com.wolclass.domain.AlertVO;

public interface AlertService {

	// 알림 목록
	public List<AlertVO> getAlertList(String m_id) throws Exception;
	
	// 알림 체크
	public void alertCheck(Integer a_no) throws Exception;
	
	// 알림 전체 읽기
	public void alertCheckAll(String m_id) throws Exception;
	
}
