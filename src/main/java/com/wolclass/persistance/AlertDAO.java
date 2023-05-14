package com.wolclass.persistance;

import java.util.List;

import com.wolclass.domain.AlertVO;

public interface AlertDAO {
	String NAMESPACE = "com.wolclass.mappers.AlertMapper";

	// 알림 목록
	public List<AlertVO> getAlertList(String m_id) throws Exception;
	
	// 알림 체크
	public void alertCheck(Integer a_no) throws Exception;
	
	// 알림 전체 체크
	public void alertCheckAll(String m_id) throws Exception;
}
