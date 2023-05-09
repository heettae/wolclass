package com.wolclass.persistance;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wolclass.domain.PayDTO;

@Repository
public class RsrvPayDAOImpl implements RsrvPayDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(RsrvPayDAOImpl.class);
	
	@Autowired
	private SqlSession sqlSession;

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
