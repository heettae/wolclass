package com.wolclass.persistance;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TimetableDAOImpl implements TimetableDAO{
	
	@Autowired
	private SqlSession session;
	
}
