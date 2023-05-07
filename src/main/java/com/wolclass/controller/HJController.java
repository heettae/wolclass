package com.wolclass.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wolclass.service.HJService;

@Controller
@RequestMapping("/hj/*")
public class HJController {
	
	private static final Logger logger = LoggerFactory.getLogger(HJController.class);
	
	@Autowired
	private HJService service;

	// http://localhost:8080/hj/getLatLng
	@RequestMapping("/getLatLng")
	public void getLatLng() {}
	
	// http://localhost:8080/hj/geolocationtest
	@RequestMapping("/geolocationtest")
	public void geolocationtest() {}
	
	// http://localhost:8080/hj/getAddr
	@RequestMapping("/getAddr")
	public void getAddr() {}
}
