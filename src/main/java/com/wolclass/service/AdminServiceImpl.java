package com.wolclass.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolclass.domain.BoardVO;
import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;
import com.wolclass.domain.ReplyVO;
import com.wolclass.domain.RsrvPayVO;
import com.wolclass.persistance.AdminDAO;
import com.wolclass.utils.SerialMaker;

@Service
public class AdminServiceImpl implements AdminService {
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);
	
	@Autowired
	private AdminDAO dao;

	@Override
	public List<BoardVO> getBoardList(Map<String, Object> map, int type) throws Exception {
		return getListByType(map, type);
	}

	@Override
	public void writeBoard(BoardVO vo) throws Exception {
		dao.writeBoard(vo);
	}

	@Override
	public BoardVO getBoard(int bno) throws Exception {
		return dao.getBoard(bno);
	}

	@Override
	public void deleteBoard(int bno) throws Exception {
		dao.deleteBoard(bno);
	}

	@Override
	public List<MemberVO> getMemberList(Map<String, Object> map) throws Exception {
		return getListByType(map, 2);
	}

	@Override
	public void updateMember(MemberVO vo) throws Exception {
		dao.updateMember(vo);
	}
	
	@Override
	public void deleteMember(String id) throws Exception {
		MemberVO vo = new MemberVO();
		vo.setM_id(id);
		vo.setM_pw(SerialMaker.getString(20));
		dao.deleteMember(vo);
	}

	@Override
	public List<ClassVO> getClassList(Map<String, Object> map) throws Exception {
		return getListByType(map, 3);
	}

	@Override
	public ClassVO getClass(int cno) throws Exception {
		return dao.getClass(cno);
	}

	@Override
	public void confirmClass(int cno) throws Exception {
		dao.confirmClass(cno);
	}

	@Override
	public void deleteClass(int cno) throws Exception {
		dao.deleteClass(cno);		
	}

	@Override
	public List<ReplyVO> getReviewList(Map<String, Object> map) throws Exception {
		return getListByType(map, 4);
	}

	@Override
	public void deleteReview(int rno) throws Exception {
		dao.deleteReview(rno);
	}

	@Override
	public List<Map<String,Object>> getPayList(Map<String, Object> map) throws Exception {
		return getListByType(map, 5);
	}

	private List getListByType(Map<String, Object> map, int type) throws Exception {
		// 데이터 전처리
		if(!map.containsKey("pageNum")) map.put("pageNum", "1");
		// 데이터 전처리
		
		// 페이징 계산
		int pageSize = 10;
		int pageBlock = 10;
		int currentPage = Integer.parseInt((String)map.get("pageNum"));
		int startRow = (currentPage - 1) * pageSize + 1;
		int count = 0;
		switch (type) {
		case 0: count = dao.getBoardListCnt(map); break;// 커뮤니티 글 조회
		case 1: count = dao.getMsgListCnt(map); break;// 1:1 문의 조회
		case 2: count = dao.getMemberListCnt(map); break;// 회원목록 조회
		case 3: count = dao.getClassListCnt(map); break;// 등록대기 클래스 조회
		case 4: count = dao.getReviewListCnt(map); break;// 수강후기 조회
		case 5: count = dao.getPayListCnt(map); break;// 결제리스트 조회
		}
		List list = new ArrayList<>();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		if(count > 0) {
			switch (type) {
			case 0: list = dao.getBoardList  (map); break;// 커뮤니티 글 조회
			case 1: list = dao.getMsgList(map); break;// 1:1 문의 조회
			case 2: list = dao.getMemberList(map); break;// 회원목록 조회
			case 3: list = dao.getClassList(map); break;// 등록대기 클래스 조회
			case 4: list = dao.getReviewList(map); break;// 수강후기 조회
			case 5: list = dao.getPayList(map); break;// 결제리스트 조회
			}
		}
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
