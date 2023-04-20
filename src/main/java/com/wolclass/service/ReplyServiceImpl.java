package com.wolclass.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.persistance.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO dao;

}
