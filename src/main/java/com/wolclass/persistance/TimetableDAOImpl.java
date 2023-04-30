package com.wolclass.persistance;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.TimetableVO;

@Repository
public class TimetableDAOImpl implements TimetableDAO {
	private static final Logger logger = LoggerFactory.getLogger(THDAOImpl.class);
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<TimetableVO> getTimetable(Integer c_no) throws Exception {
		List resultVO = session.selectList(NAMESPACE+".getTimetable",c_no);
		logger.info("dao-resultVO: "+resultVO);
		return resultVO;
	}
	
}
