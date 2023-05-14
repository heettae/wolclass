package com.wolclass.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.domain.AlertVO;
import com.wolclass.persistance.AlertDAO;

@Service
public class AlertServiceImpl implements AlertService {

	@Autowired
	private AlertDAO dao;
	
	// 알림 목록
	@Override
	public List<AlertVO> getAlertList(String m_id) throws Exception {
		return dao.getAlertList(m_id);
	}
	// 알림 목록

	// 알림 체크
	@Override
	public void alertCheck(Integer a_no) throws Exception {
		dao.alertCheck(a_no);
	}
	// 알림 체크

	// 알림 전체 체크
	@Override
	public void alertCheckAll(String m_id) throws Exception {
		dao.alertCheckAll(m_id);
	}
	// 알림 전체 체크

}
