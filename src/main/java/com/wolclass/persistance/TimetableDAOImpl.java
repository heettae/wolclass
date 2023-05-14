package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.TimetableVO;

@Repository
public class TimetableDAOImpl implements TimetableDAO {
	private static final Logger logger = LoggerFactory.getLogger(TimetableDAOImpl.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	// 클래스 시간 등록
	@Override
	public void addTime(Map<String, Object> map) throws Exception {
		sqlSession.insert(NAMESPACE+".addTime", map);
	}
	// 클래스 시간 등록
	
	// 시간 중복 체크
	@Override
	public int timeOverlapCheck(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".timeOverlapCheck", map);
	}
	// 시간 중복 체크
	
	@Override
	public List<TimetableVO> getTimetable(Integer c_no) throws Exception {
		List resultVO = sqlSession.selectList(NAMESPACE+".getTimetable",c_no);
		logger.info("dao-resultVO: "+resultVO);
		return resultVO;
	}

	@Override
	public List<TimetableVO> getTime(TimetableVO vo) throws Exception {
		logger.info("dao 도착");
		List resultVO = sqlSession.selectList(NAMESPACE+".getTime",vo);
		logger.info("dao-resultVO: "+resultVO);
		System.out.println(resultVO.size());
		return resultVO;
	}

	@Override
	public TimetableVO getRemainNum(TimetableVO vo) throws Exception {
		logger.info("dao 도착");
		TimetableVO resultVO = sqlSession.selectOne(NAMESPACE+".getRemainNum",vo);
		logger.info("dao-resultVO: "+resultVO);
		System.out.println(resultVO);
		return resultVO;
	}
	
}
