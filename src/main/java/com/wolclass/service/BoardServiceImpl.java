package com.wolclass.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.domain.BoardVO;
import com.wolclass.persistance.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO dao;

	@Override
	public List<BoardVO> getNoticeList(Map<String, Object> nmap) throws Exception {
		// 데이터 전처리
		if(!nmap.containsKey("pageNum") || ((String)nmap.get("pageNum")).equals("")) nmap.put("pageNum", "1");
		// 데이터 전처리

		// 페이징 계산
		int count = dao.getNoticeListCnt(nmap);
		int pageSize = 10;
		int pageBlock = 10;
		int currentPage = Integer.parseInt((String)nmap.get("pageNum"));
		int startRow = (currentPage - 1) * pageSize + 1;
		List<BoardVO> list = new ArrayList<>();
		nmap.put("startRow", startRow-1);
		nmap.put("pageSize", pageSize);
		if(count > 0) list = dao.getNoticeList(nmap);
		int pageCount = count/pageSize + (count%pageSize==0? 0:1);
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		// 페이징 계산
		
		// 페이징 처리에 필요한 데이터 셋팅
		nmap.put("count", count);
		nmap.put("pageCount", pageCount);
		nmap.put("pageBlock", pageBlock);
		nmap.put("pageSize", pageSize);
		nmap.put("startPage", startPage);
		nmap.put("endPage", endPage);
		// 페이징 처리에 필요한 데이터 셋팅
		
		return list;
	}

	@Override
	public BoardVO getBoard(Object bno) throws Exception {
		return dao.getBoard(Integer.parseInt(bno.toString()));
	}

}
