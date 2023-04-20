package com.wolclass.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.persistance.AlertDAO;

@Service
public class AlertServiceImpl implements AlertService {

	@Autowired
	private AlertDAO dao;

}
