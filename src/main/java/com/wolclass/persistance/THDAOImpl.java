package com.wolclass.persistance;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.ClassVO;
import com.wolclass.domain.PayDTO;
import com.wolclass.domain.RsrvPayVO;
import com.wolclass.domain.SubscriptionVO;
import com.wolclass.domain.TimetableVO;

@Repository
public class THDAOImpl implements THDAO{

	
	@Inject
	private SqlSession sqlSession; // 업캐스팅을 통한 약한결합을 만들고 주입을 함
	
	// mapper Namespace정보
	private static final String NAMESPACE = "com.wolclass.mappers.THMapper";

	private static final Logger logger = LoggerFactory.getLogger(THDAOImpl.class);
	
	@Override
	public String getDBTime() {
		logger.info(" 디비연결정보 : "+sqlSession);
		return sqlSession.selectOne(NAMESPACE+".getTime");
	}
	
	
	
	@Override
	public ClassVO selectClass(Integer c_no) throws Exception {
		logger.info("dao-sql호출");
		ClassVO resultVO = sqlSession.selectOne(NAMESPACE+".selectClass",c_no);
		logger.info("dao-resultVO: "+resultVO);
		return resultVO;
	}



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



	@Override
	public SubscriptionVO getSubsInfo(String m_id) throws Exception {
		logger.info("dao.getSubInfo: "+m_id);
		SubscriptionVO resultVO = sqlSession.selectOne(NAMESPACE+".getSubsInfo",m_id);
		logger.info("dao.getSubInfo-resultVO: "+resultVO);
		
		return resultVO;
	}



	@Override
	public int makeP_no() throws Exception {
		int maxPno = sqlSession.selectOne(NAMESPACE+".maxP_no");
		return maxPno+1;
	}



	@Override
	public RsrvPayVO insertPay(PayDTO pdto) throws Exception {
		logger.info("dao.insertPay() 실행");
		RsrvPayVO resultVO = sqlSession.selectOne(NAMESPACE+".insertPay");
		
		logger.info("dao.insertPay()-resultVO"+resultVO);
		return resultVO;
	}
	
	
	
}
