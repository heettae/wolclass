package com.wolclass.persistance;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
	public String makeP_no() throws Exception {
		
		logger.info("dao - makiP_no 호출 ");
	    String orderNo = null;
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	    String today = dateFormat.format(new Date());
	    String lastOrderNo = sqlSession.selectOne(NAMESPACE+".lastP_no");
	    
	    logger.info("dao - makiP_no 쿼리 실행 ");
	    if (lastOrderNo != null && lastOrderNo.startsWith(today)) {
	        int lastNo = Integer.parseInt(lastOrderNo.substring(8));
	        orderNo = today + String.format("%03d", lastNo + 1);
	    } else {
	        orderNo = today + "001";
	    }
	    
	    logger.info("주문번호 "+orderNo);
	    return orderNo;		

	}


	//@Transactional(rollbackFor = Exception.class)
	@Override
	public void insertPaymentInfo(PayDTO pdto) throws Exception {
		logger.info("dao.insertPay() 실행");
		logger.info(pdto+"");
		sqlSession.insert(NAMESPACE+".insertPay",pdto);
		
		
		// 결제가 완료된 후 수정
//		cnt += sqlSession.update(NAMESPACE+".updateT_rem_p", pdto);
//		 
//
//		if(pdto.getPoint()!=0) {
//			cnt += sqlSession.update(NAMESPACE+".updatePoint", pdto);
//		}
//		if(pdto.isSubs()) {
//			cnt += sqlSession.update(NAMESPACE+".updateS_cnt", pdto);
//		}
//		logger.info("cnt(실행된 sql 개수) : "+cnt);
//		
		
		
	}



	@Override
	public Integer updatePaymentInfo(PayDTO pdto) throws Exception {
		
		return sqlSession.update(NAMESPACE+".updatePay",pdto);
	}



	@Override
	public Integer selectPrice(String p_no) throws Exception {
		Integer price = sqlSession.selectOne(NAMESPACE+".selectPrice",p_no);
		logger.info("daoPrice"+price);
		return price;
		
		
	}
	
	
	
	
	
}
