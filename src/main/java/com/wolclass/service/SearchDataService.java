package com.wolclass.service;

import java.util.List;

public interface SearchDataService {
	
	// 인기검색어 조회 hj
	public List<String> getPSList() throws Exception;

	// 검색어 분석 hj
	public void analyze(Object object) throws Exception;
}
