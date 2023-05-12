package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

import com.wolclass.domain.BoardVO;
import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;
import com.wolclass.domain.ReplyVO;

public interface AdminDAO {

	String NAMESPACE = "com.wolclass.mappers.AdminMapper";
	
	//커뮤니티 목록
	public Integer getBoardListCnt(Map<String, Object> map) throws Exception;
	public List getBoardList(Map<String, Object> map) throws Exception;
	
	//1:1 문의 리스트 (관리자 메인)
	public Integer getMsgListCnt(Map<String, Object> map) throws Exception;
	public List getMsgList(Map<String, Object> map) throws Exception;

	//회원목록 출력
	public Integer getMemberListCnt(Map<String, Object> map) throws Exception;
	public List getMemberList(Map<String, Object> map) throws Exception;
	
	//클래스 등록대기 목록 출력
	public Integer getClassListCnt(Map<String, Object> map) throws Exception;
	public List getClassList(Map<String, Object> map) throws Exception;
	
	//수강후기 리스트
	public Integer getReviewListCnt(Map<String, Object> map) throws Exception;
	public List getReviewList(Map<String, Object> map) throws Exception;

	//결제 리스트
	public Integer getPayListCnt(Map<String, Object> map) throws Exception;
	public List getPayList(Map<String, Object> map) throws Exception;
	
	//커뮤니티 댓글 조회
	public Integer getCommentListCnt(Map<String, Object> map) throws Exception;
	public List getCommentList(Map<String, Object> map) throws Exception;
	
	//공지사항 등록
	//1:1  문의 답신
	public void writeBoard(BoardVO vo) throws Exception;
	
	//커뮤니티 읽기
	//1:1  문의 읽기
	public BoardVO getBoard(int bno) throws Exception;
	
	//커뮤니티 글 삭제
	public void deleteBoard(int bno) throws Exception;
	
	//커뮤니티 댓글 삭제
	public void deleteReply(int rno) throws Exception;
	
	//회원 정보 수정
	public void updateMember(MemberVO vo) throws Exception;
	
	//회원 정보 삭제
	public void deleteMember(MemberVO vo) throws Exception;
	
	//클래스 상세정보
	public ClassVO getClass(int cno) throws Exception;
	
	//클래스 등록 승인
	public void confirmClass(int cno) throws Exception;
	
	//클래스 등록 승인 거부
	public void deleteClass(int cno) throws Exception;
	
	//수강후기 삭제
	public void deleteReview(int rno) throws Exception;
	
}
