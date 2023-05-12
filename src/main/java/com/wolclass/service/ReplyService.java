package com.wolclass.service;

import java.util.List;
import java.util.Map;

import com.wolclass.domain.ReplyVO;

public interface ReplyService {

	// 리뷰 가져오기
	public List<ReplyVO> getList(Map<String, Object> map) throws Exception;
	
}
