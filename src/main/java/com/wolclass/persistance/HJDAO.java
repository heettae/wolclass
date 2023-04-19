package com.wolclass.persistance;

import java.util.List;

import com.wolclass.domain.PopularSearchVO;

public interface HJDAO {
	String NAMESPACE = "com.wolclass.mappers.HJMapper.";
	
	List<PopularSearchVO> getPSList() throws Exception;

}
