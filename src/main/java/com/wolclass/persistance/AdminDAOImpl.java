package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.BoardVO;
import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;

@Repository
public class AdminDAOImpl implements AdminDAO{

	private static final Logger logger = LoggerFactory.getLogger(AdminDAOImpl.class);
	
	@Autowired
	private SqlSession session;

	@Override
	public Integer getBoardListCnt(Map<String, Object> map) throws Exception {
		return session.selectOne(NAMESPACE+".getBoardListCnt");
	}

	@Override
	public List getBoardList(Map<String, Object> map) throws Exception {
		return session.selectList(NAMESPACE+".getBoardList", map);
	}

	@Override
	public Integer getMsgListCnt(Map<String, Object> map) throws Exception {
		return session.selectOne(NAMESPACE+".getMsgListCnt");
	}

	@Override
	public List getMsgList(Map<String, Object> map) throws Exception {
		return session.selectList(NAMESPACE+".getMsgList", map);
	}

	@Override
	public Integer getMemberListCnt(Map<String, Object> map) throws Exception {
		return session.selectOne(NAMESPACE+".getMemberListCnt");
	}

	@Override
	public List getMemberList(Map<String, Object> map) throws Exception {
		return session.selectList(NAMESPACE+".getMemberList", map);
	}

	@Override
	public Integer getClassListCnt(Map<String, Object> map) throws Exception {
		return session.selectOne(NAMESPACE+".getClassListCnt");
	}

	@Override
	public List getClassList(Map<String, Object> map) throws Exception {
		return session.selectList(NAMESPACE+".getClassList", map);
	}

	@Override
	public Integer getReviewListCnt(Map<String, Object> map) throws Exception {
		return session.selectOne(NAMESPACE+".getReviewListCnt");
	}

	@Override
	public List getReviewList(Map<String, Object> map) throws Exception {
		return session.selectList(NAMESPACE+".getReviewList", map);
	}

	@Override
	public Integer getPayListCnt(Map<String, Object> map) throws Exception {
		return session.selectOne(NAMESPACE+".getPayListCnt");
	}

	@Override
	public List getPayList(Map<String, Object> map) throws Exception {
		return session.selectList(NAMESPACE+".getPayList", map);
	}

	@Override
	public void writeBoard(BoardVO vo) throws Exception {
		session.insert(NAMESPACE+".writeBoard", vo);
	}

	@Override
	public BoardVO getBoard(int bno) throws Exception {
		return session.selectOne(NAMESPACE+".getBoard", bno);
	}

	@Override
	public void deleteBoard(int bno) throws Exception {
		session.delete(NAMESPACE+".deleteBoard", bno);
	}

	@Override
	public void updateMember(MemberVO vo) throws Exception {
		session.update(NAMESPACE+".updateMember", vo);
	}

	@Override
	public void deleteMember(MemberVO vo) throws Exception {
		session.update(NAMESPACE+".deleteMember", vo);
	}

	@Override
	public ClassVO getClass(int cno) throws Exception {
		return session.selectOne(NAMESPACE+".getClass", cno);
	}

	@Override
	public void confirmClass(int cno) throws Exception {
		session.update(NAMESPACE+".confirmClass", cno);
	}

	@Override
	public void deleteClass(int cno) throws Exception {
		session.delete(NAMESPACE+".deleteClass", cno);
	}

	@Override
	public void deleteReview(int rno) throws Exception {
		session.update(NAMESPACE+".deleteReview", rno);
	}
	
}
