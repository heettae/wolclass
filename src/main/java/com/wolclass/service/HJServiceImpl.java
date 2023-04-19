package com.wolclass.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.domain.PopularSearchVO;
import com.wolclass.persistance.HJDAO;

@Service
public class HJServiceImpl implements HJService{

	@Autowired
	private HJDAO dao;
	
	@Override
	public List<PopularSearchVO> getPSList() throws Exception {
		return dao.getPSList();
	}

}
