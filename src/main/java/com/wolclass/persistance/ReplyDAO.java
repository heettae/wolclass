package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

import com.wolclass.domain.ReplyVO;

public interface ReplyDAO {
	String NAMESPACE = "com.wolclass.mappers.ReplyMapper";

	//리뷰 리스트
	public int getReviewListCnt(int cno) throws Exception;
	public List<ReplyVO> getReviewList(Map<String, Object> map) throws Exception;
}
