package com.wolclass.service;

import java.util.List;
import java.util.Map;

public interface SearchDataService {
	
	// 인기검색어 조회 HJ
	public List<String> getPSList(String userAddr) throws Exception;

	// 검색어 분석 HJ
	public void analyze(Map<String,Object> srchMap) throws Exception;
}
