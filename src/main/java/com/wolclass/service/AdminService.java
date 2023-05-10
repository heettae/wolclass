package com.wolclass.service;

import java.util.List;
import java.util.Map;

import com.wolclass.domain.BoardVO;
import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;
import com.wolclass.domain.ReplyVO;
import com.wolclass.domain.RsrvPayVO;

public interface AdminService {

	//커뮤니티 목록
	//1:1 문의 리스트 (관리자 메인)
	public List<BoardVO> getBoardList(Map<String, Object> map, int type) throws Exception;
	
	//공지사항 등록
	//1:1  문의 답신
	public void writeBoard(BoardVO vo) throws Exception;
	
	//커뮤니티 읽기
	//1:1  문의 읽기
	public BoardVO getBoard(int bno) throws Exception;
	
	//커뮤니티 글 삭제
	public void deleteBoard(int bno) throws Exception;
	
	//회원목록 출력
	public List<MemberVO> getMemberList(Map<String, Object> map) throws Exception;
	
	//회원 정보 수정
	public void updateMember(MemberVO vo) throws Exception;
	
	//회원 정보 삭제
	public void deleteMember(String id) throws Exception;
	
	//클래스 등록대기 목록 출력
	public List<ClassVO> getClassList(Map<String, Object> map) throws Exception;
	
	//클래스 상세정보
	public ClassVO getClass(int cno) throws Exception;
	
	//클래스 등록 승인
	public void confirmClass(int cno) throws Exception;
	
	//클래스 등록 승인 거부
	public void deleteClass(int cno) throws Exception;
	
	//수강후기 리스트
	public List<ReplyVO> getReviewList(Map<String, Object> map) throws Exception;
	
	//수강후기 삭제
	public void deleteReview(int rno) throws Exception;
	
	//결제 리스트
	public List<RsrvPayVO> getPayList(Map<String, Object> map) throws Exception;

}
