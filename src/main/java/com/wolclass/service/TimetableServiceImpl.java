package com.wolclass.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.persistance.TimetableDAO;

@Service
public class TimetableServiceImpl implements TimetableService {

	@Autowired
	private TimetableDAO dao;

}
