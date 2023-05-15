package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

public interface SearchDataDAO {
	String NAMESPACE = "com.wolclass.mappers.PSMapper";
	
	// 인기검색어 조회 hj
	public List<String> getPSList(String userAddr) throws Exception;

	// 키워드에 해당하는 클래스가 있는지 조회 hj
	public boolean getClassCount(String word) throws Exception;

	// 인기검색어 등록 hj
	public void insert(Map<String, Object> map) throws Exception;
}
