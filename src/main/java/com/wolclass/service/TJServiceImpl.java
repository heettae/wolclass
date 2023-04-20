package com.wolclass.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.persistance.TJDAO;

@Service
public class TJServiceImpl implements TJService{
	
	@Autowired
	TJDAO dao;
}
