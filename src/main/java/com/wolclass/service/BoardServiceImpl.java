package com.wolclass.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.domain.BoardVO;
import com.wolclass.domain.ReplyVO;
import com.wolclass.persistance.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	private BoardDAO dao;
	
	// 글쓰기 
	@Override
	public void writeBoard(BoardVO vo) throws Exception {
		dao.createBoard(vo);
	}

	// 전체 글목록 조회
	@Override
	public List<BoardVO> getBoardListAll(Map<String, Object> map) throws Exception {
		
		return dao.getBoardListAll(map);
	}

	// 페이징 처리 및 검색
	@Override
	public List<BoardVO> selectPageNumBoTotal(Map<String, Object> map) throws Exception{
		
		if(!map.containsKey("b_category")) map.put("b_category", "");
		if(!map.containsKey("search")) map.put("search", "");
		if(!map.containsKey("pageNum")) map.put("pageNum", "1");
		
		// 리스트 총 개수
		int count = dao.selectPNBT(map);
		int pageSize = 10;
		int pageBlock = 10;
		int currentPage = Integer.parseInt((String)map.get("pageNum"));
		logger.info("cnt {}",count);
		logger.info("currentPage {}",currentPage);
		List<BoardVO> list = new ArrayList<>();
		map.put("pageSize", pageSize);
		if(count > 0) 	list = dao.getBoardListAll(map);
		int pageCount = (count/pageSize) + (count % pageSize==0 ? 0:1);
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage + pageBlock - 1;
		logger.info("pageNum"+map.get("pageNum"));
		logger.info("endPage{}",endPage);
		logger.info("startPage{}",startPage);
		logger.info("pageCount{}",pageCount);
		if(endPage > pageCount) endPage = pageCount;
		// 페이징 계산
		logger.info("endPage{}",endPage);
		
		// 페이징 처리에 필요한 데이터 셋팅
		map.put("count", count);             // 전체리스트 개수
		map.put("pageCount", pageCount);	 // 전체페이지 개수
		map.put("pageBlock", pageBlock);	 // 보여지는 페이지 최대개수
		map.put("pageSize", pageSize);		 // 페이지하나에 들어가는 리스트 개수
		map.put("startPage", startPage);	 // 시작페이지
		map.put("endPage", endPage);		 // 끝페이지
		// 페이징 처리에 필요한 데이터 셋팅
		return list;
	}
	
	
	// 특정글 정보 확인
	@Override
	public BoardVO getBoard(Integer b_no) throws Exception {
		return dao.getBoard(b_no);
	}
	
	// 조회수 1씩 증가
	@Override
	public void incrementViewCnt(Integer b_no) throws Exception {
		dao.updateViewcnt(b_no);
	}
	
	// 특정글의 댓글 목록 가져오기
	@Override
	public List<ReplyVO> getReplyList(Map<String, Object> map) throws Exception{
		if(!map.containsKey("cPageNum")) map.put("cPageNum", "1");
		
		// 리스트 총 개수
		int count = dao.selectPNRT(map);
		int pageSize = 10;
		int pageBlock = 10;
		int currentPage = Integer.parseInt((String)map.get("cPageNum"));
		logger.info("cnt {}",count);
		logger.info("currentPage {}",currentPage);
		List<ReplyVO> list = new ArrayList<>();
		map.put("pageSize", pageSize);
		if(count > 0) 	list = dao.getReplyList(map);
		int pageCount = (count/pageSize) + (count % pageSize==0 ? 0:1);
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage + pageBlock - 1;
		logger.info("cPageNum"+map.get("cPageNum"));
		logger.info("endPage{}",endPage);
		logger.info("startPage{}",startPage);
		logger.info("pageCount{}",pageCount);
		if(endPage > pageCount) endPage = pageCount;
		// 페이징 계산
		logger.info("endPage{}",endPage);
		
		// 페이징 처리에 필요한 데이터 셋팅
		map.put("count", count);             // 전체리스트 개수
		map.put("cPageNum", map.get("cPageNum")); // 페이지번호
		map.put("pageCount", pageCount);	 // 전체페이지 개수
		map.put("pageBlock", pageBlock);	 // 보여지는 페이지 최대개수
		map.put("pageSize", pageSize);		 // 페이지하나에 들어가는 리스트 개수
		map.put("startPage", startPage);	 // 시작페이지
		map.put("endPage", endPage);		 // 끝페이지
		// 페이징 처리에 필요한 데이터 셋팅
		return list;
	}
	
	// 글 수정하기 
	@Override
	public Integer modifyBoard(BoardVO uvo) throws Exception {
		return dao.updateBoard(uvo);	
	}

	// 글 삭제하기 
	@Override
	public Integer removeBoard(Integer b_no) throws Exception {
		return dao.deleteBoard(b_no);
	}
	
	// 댓글쓰기
	public void writeComment (Map<String, Object> cmap) throws Exception{
		
		
		dao.createComment(cmap);
	}

	// 댓글 수정하기 
	@Override
	public Integer modifyComment(ReplyVO ruvo) throws Exception {
		return dao.updateComment(ruvo);	
	}
	
	// 댓글 삭제하기 
	@Override
	public Integer removeComment(Integer r_no) throws Exception {
		return dao.deleteComment(r_no);
	}

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

}
