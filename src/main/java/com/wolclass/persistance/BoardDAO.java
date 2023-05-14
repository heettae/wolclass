package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

import com.wolclass.domain.BoardVO;
import com.wolclass.domain.ReplyVO;

public interface BoardDAO {
	String NAMESPACE = "com.wolclass.mappers.BoardMapper";
	
	// 글쓰기
	public void createBoard(BoardVO vo) throws Exception;
	
	// 글 전체 목록
	public List<BoardVO> getBoardListAll(Map<String, Object> map) throws Exception;

	// 페이징처리
	public int selectPNBT(Map<String, Object> map) throws Exception;
	
	// 글 정보 조회 (특정글)
	public BoardVO getBoard(Integer b_no) throws Exception;
	
	// 글 조회수 1증가
	public void updateViewcnt(Integer b_no) throws Exception;
	
	// 특정글 댓글 목록 가져오기 
	public List<ReplyVO> getReplyList(Map<String, Object> map) throws Exception;

	// 댓글 페이징처리
	public int selectPNRT(Map<String, Object> map) throws Exception;
	
	// 글 수정
	public Integer updateBoard(BoardVO uvo) throws Exception;
	
	// 글 삭제  
	public Integer deleteBoard(Integer b_no) throws Exception;
	
	// 댓글쓰기
	public void createComment(Map<String, Object> cmap) throws Exception;
	// 댓글 수정
	public Integer updateComment(ReplyVO ruvo) throws Exception;
	
	// 댓글 삭제  
	public Integer deleteComment(Integer r_no) throws Exception;
	
	// 공지사항 목록
	public Integer getNoticeListCnt(Map<String, Object> nmap) throws Exception;
	public List<BoardVO> getNoticeList(Map<String, Object> nmap) throws Exception;

}
