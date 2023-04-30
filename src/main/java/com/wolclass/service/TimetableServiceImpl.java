package com.wolclass.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.domain.TimetableVO;
import com.wolclass.persistance.TimetableDAO;

@Service
public class TimetableServiceImpl implements TimetableService {

	@Autowired
	private TimetableDAO dao;

	@Override
	public List<TimetableVO> getTimetable(Integer c_no) throws Exception {
		List resultVO = dao.getTimetable(c_no);
		return resultVO;
	}
}
