package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Autowired
	private SqlSession session;

	@Override
	public int getReviewListCnt(int cno) throws Exception {
		return session.selectOne(NAMESPACE+".getReviewListCnt",cno);
	}

	@Override
	public List<ReplyVO> getReviewList(Map<String, Object> map) throws Exception {
		return session.selectList(NAMESPACE+".getReviewList",map);
	}
	
}
