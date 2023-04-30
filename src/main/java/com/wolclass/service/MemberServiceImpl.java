package com.wolclass.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.domain.MemberVO;
import com.wolclass.persistance.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;
	
	@Override
	public MemberVO getMemberInfo(String m_id) throws Exception {
		return dao.getMemberInfo(m_id);
	}

}
