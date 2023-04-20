package com.wolclass.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.persistance.RsrvPayDAO;

@Service
public class RsrvPayServiceImpl implements RsrvPayService {

	@Autowired
	private RsrvPayDAO dao;

}
