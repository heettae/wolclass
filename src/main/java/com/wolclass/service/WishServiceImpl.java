package com.wolclass.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.persistance.WishDAO;

@Service
public class WishServiceImpl implements WishService {

	@Autowired
	private WishDAO dao;

}
