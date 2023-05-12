package com.wolclass.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.domain.BoardVO;
import com.wolclass.domain.ReplyVO;
import com.wolclass.persistance.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyServiceImpl.class);
	
	@Autowired
	private ReplyDAO dao;

	@Override
	public List<ReplyVO> getList(Map<String, Object> map) throws Exception {
		// 데이터 전처리
		if(!map.containsKey("pageNum") || ((String)map.get("pageNum")).equals("")) map.put("pageNum", "1");
		// 데이터 전처리

		// 페이징 계산
		int count = dao.getReviewListCnt(Integer.parseInt(map.get("c_no").toString()));
		int pageSize = 4;
		int pageBlock = 4;
		int currentPage = Integer.parseInt((String)map.get("pageNum"));
		int startRow = (currentPage - 1) * pageSize + 1;
		List<ReplyVO> list = new ArrayList<>();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		if(count > 0) list = dao.getReviewList(map);
		int pageCount = count/pageSize + (count%pageSize==0? 0:1);
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		// 페이징 계산
		
		// 페이징 처리에 필요한 데이터 셋팅
		map.put("count", count);
		map.put("pageCount", pageCount);
		map.put("pageBlock", pageBlock);
		map.put("pageSize", pageSize);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		// 페이징 처리에 필요한 데이터 셋팅
		
		return list;
	}

}
