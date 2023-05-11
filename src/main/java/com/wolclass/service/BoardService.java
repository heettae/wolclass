package com.wolclass.service;

import java.util.List;
import java.util.Map;

import com.wolclass.domain.BoardVO;

public interface BoardService {

	// 공지사항 조회
	public List<BoardVO> getNoticeList(Map<String, Object> nmap) throws Exception;

	// 공지사항 상세
	public BoardVO getBoard(Object bno) throws Exception;
	
}
