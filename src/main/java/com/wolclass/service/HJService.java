package com.wolclass.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.wolclass.domain.PopularSearchVO;

public interface HJService {

	public List<PopularSearchVO> getPSList() throws Exception;
}
