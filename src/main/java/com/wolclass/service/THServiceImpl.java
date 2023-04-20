package com.wolclass.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.wolclass.domain.ClassVO;
import com.wolclass.persistance.THDAO;

@Service
public class THServiceImpl implements THService {
	
	

	private static final Logger logger = LoggerFactory.getLogger(THServiceImpl.class);

	@Inject
	private	THDAO dao;
		
	@Override
	public String getTime() {
		
		return dao.getDBTime();
	}
	
	@Override
	public ClassVO getClassDetail(Integer c_no) throws Exception {
		logger.info("service-dao호출");
		return dao.selectClass(c_no);
	}
	
	
	
}
