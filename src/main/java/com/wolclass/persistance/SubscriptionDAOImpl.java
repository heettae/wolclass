package com.wolclass.persistance;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SubscriptionDAOImpl implements SubscriptionDAO{
	
	@Autowired
	private SqlSession session;
	
}
