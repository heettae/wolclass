package com.wolclass.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.domain.ClassVO;
import com.wolclass.domain.WishVO;
import com.wolclass.persistance.WishDAO;

@Service
public class WishServiceImpl implements WishService {

	@Autowired
	private WishDAO dao;

	@Override
	public List<Integer> getCnoList(String m_id) {
		return dao.getCnoList(m_id);
	}

	@Override
	public List<ClassVO> getClassList(String m_id) {
		return dao.getClassList(m_id);
	}

	@Override
	public void add(WishVO vo) {
		dao.add(vo);
	}

	@Override
	public void delete(WishVO vo) {
		dao.delete(vo);
	}

}
