package com.wolclass.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.domain.ClassVO;
import com.wolclass.domain.PopularSearchVO;
import com.wolclass.persistance.HJDAO;

@Service
public class HJServiceImpl implements HJService{

	@Autowired
	private HJDAO dao;
	
	@Override
	public List<PopularSearchVO> getPSList() throws Exception {
		return dao.getPSList();
	}

	public List<ClassVO> getClassList(Map<String, Object> map) throws Exception {
		String search = map.containsKey("search") ? (String)map.get("search") : "";
		// 게시판 전체글 개수
		int count = dao.getClassListCnt(search);
		
		// 페이징처리 1
		// 한 페이지에 출력할 글의 개수
		int pageSize = 12;
		// 한 화면에 출력할 페이지 블럭의 개수
		int pageBlock = 10;

		// 현재 페이지가 몇 페이지인가 판단
		String pageNum = map.containsKey("pageNum") ? (String)map.get("pageNum") : "1";
		
		// 페이지 시작행 번호 계산
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;

		// 페이지 끝행 번호 계산
		int endRow = currentPage * pageSize;

		// 게시판 글 가져오기
		List<ClassVO> list = null;
		map.put("search", search);
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		if(count > 0) list = dao.getClassList(map);
			
		// 페이징처리 2
		// 전체 필요한 페이지 수
		int pageCount = count/pageSize + (count%pageSize==0? 0:1);
		
		// 페이지 블럭 시작번호
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		
		// 페이지 블럭 끝번호
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		
		// 전달할 정보를 map에 저장(글정보 + 페이징처리정보)
		map.put("pageNum", pageNum);
		map.put("count", count);
		map.put("pageCount", pageCount);
		map.put("pageBlock", pageBlock);
		map.put("pageSize", pageSize);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		return list;
	}
}
