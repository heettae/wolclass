package com.wolclass.service;

import java.util.List;
import java.util.Map;

import com.wolclass.domain.BoardVO;
import com.wolclass.domain.ReplyVO;

public interface BoardService {

	// 게시판 글쓰기
	public void writeBoard(BoardVO vo) throws Exception;
	
	// 모든 게시판 글목록 가져오기
	public List<BoardVO> getBoardListAll(Map<String, Object> map) throws Exception;
	
	// 페이징처리
	public List<BoardVO> selectPageNumBoTotal(Map<String, Object> map) throws Exception;
	
	// 글정보 조회 (특정글)
	public BoardVO getBoard(Integer b_no) throws Exception;
	
	// 게시판 글 조회수 1증가
	public void incrementViewCnt(Integer b_no) throws Exception;
	
	// 특정글의 댓글 목록 가져오기
	public List<ReplyVO> getReplyList(Map<String, Object> map) throws Exception;
		
	// 글정보 수정 
	public Integer modifyBoard(BoardVO uvo) throws Exception;
	
	// 글 정보 삭제 
	public Integer removeBoard(Integer b_no) throws Exception;	
	
	// 댓글 쓰기 
	public void writeComment (Map<String, Object> cmap) throws Exception;
	
	// 댓글 수정하기 
	public Integer modifyComment(ReplyVO ruvo) throws Exception;
		
	// 댓글 삭제하기 
	public Integer removeComment(Integer r_no) throws Exception;
	
	// 공지사항 조회
	public List<BoardVO> getNoticeList(Map<String, Object> nmap) throws Exception;
	
}
