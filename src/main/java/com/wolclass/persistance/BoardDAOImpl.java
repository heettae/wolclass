package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Autowired
	private SqlSession session;

	@Override
	public Integer getNoticeListCnt(Map<String, Object> nmap) throws Exception {
		return session.selectOne(NAMESPACE+".getNoticeListCnt");
	}

	@Override
	public List<BoardVO> getNoticeList(Map<String, Object> nmap) throws Exception {
		return session.selectList(NAMESPACE+".getNoticeList",nmap);
	}

	@Override
	public BoardVO getBoard(int bno) throws Exception {
		return session.selectOne(NAMESPACE+".getBoard",bno);
	}
	
}
