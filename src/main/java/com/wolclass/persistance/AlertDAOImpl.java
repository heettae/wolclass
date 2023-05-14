package com.wolclass.persistance;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.AlertVO;

@Repository
public class AlertDAOImpl implements AlertDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	// 알림 목록
	@Override
	public List<AlertVO> getAlertList(String m_id) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".getAlertList", m_id);
	}
	// 알림 목록

	// 알림 체크
	@Override
	public void alertCheck(Integer a_no) throws Exception {
		sqlSession.update(NAMESPACE+".alertRead", a_no);
	}
	// 알림 체크

	// 알림 전체 체크
	@Override
	public void alertCheckAll(String m_id) throws Exception {
		sqlSession.update(NAMESPACE+".alertReadAll", m_id);
	}
	// 알림 전체 체크
	
}
