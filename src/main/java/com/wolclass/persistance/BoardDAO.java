package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

import com.wolclass.domain.BoardVO;

public interface BoardDAO {
	String NAMESPACE = "com.wolclass.mappers.BoardMapper";

	// 공지사항 목록
	public Integer getNoticeListCnt(Map<String, Object> nmap) throws Exception;
	public List<BoardVO> getNoticeList(Map<String, Object> nmap) throws Exception;
	
	// 공지사항 상세
	public BoardVO getBoard(int bno) throws Exception;
}
