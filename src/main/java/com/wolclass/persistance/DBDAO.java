package com.wolclass.persistance;

import java.util.List;
import java.util.Map;

import com.wolclass.domain.BoardVO;
import com.wolclass.domain.MemberVO;
import com.wolclass.domain.RsrvPayVO;
import com.wolclass.domain.SubscriptionVO;

public interface DBDAO {
	
	// 회원가입 - 다빈
	public void memberJoin(Map<String,Object> map) throws Exception;
	
	// 아이디 중복검사 - 다빈
	public Integer idCheck(String m_id) throws Exception;;
	
	// 이메일 중복검사 - 다빈
	public Integer emailCheck(String m_email) throws Exception;;
	
	// 전화번호 중복검사 - 다빈
	public Integer phoneCheck(String m_phone) throws Exception;;
	
	// 로그인 - 다빈
	public MemberVO memberLogin(MemberVO vo) throws Exception;
	
	// 아이디 찾기 - 다빈
	public MemberVO findId(MemberVO vo) throws Exception;
	
	// 비밀버호 찾기(임시 비밀번호) - 다빈
	public int findPw(MemberVO vo) throws Exception;

	// 임시비밀번호 설정 - 다빈
	public void updateTempPw(MemberVO vo);
	
	// 카카오 로그인 
	public void kakaoInsert(MemberVO vo) throws Exception;
	
	// 카카오아이디  - 다빈
	public MemberVO kfindId(MemberVO vo) throws Exception;
	
	// 특정회원조회 - 다빈 
	public MemberVO selectMember(String id) throws Exception;
	
	// 프로필사진 변경 - 다빈	
	public void updateProfile(MemberVO vo) throws Exception;
		
	// 회원정보 수정 - 다빈
	public void updateMember(Map<String,Object> map) throws Exception;
	
	// 회원탈퇴 - 다빈
	public void deleteMember(MemberVO vo) throws Exception;
	
	// 결제 내역 - 다빈
	public List<Map<String,Object>> payList(Map<String,Object> map) throws Exception;

	// 내가신청한 클래스(예약클래스) - 다빈
	public List<Map<String,Object>> classList(Map<String,Object> map) throws Exception;
	
	// 내가신청한 클래스(지난클래스) - 다빈
	public List<Map<String,Object>> classList2(Map<String,Object> map) throws Exception;
	
	// 메시지(받은) - 다빈
	public List<BoardVO> msgList1(Map<String,Object> map) throws Exception;
	
	// 메시지(보낸) - 다빈
	public List<BoardVO> msgList2(Map<String,Object> map) throws Exception;
	
	// 구독(남은기간) - 다빈 
	public SubscriptionVO subscribe(String id) throws Exception;
	
	// 문의하기 - 다빈
	public void myinquiry(RsrvPayVO vo) throws Exception;
	// 문의하기 - 처리 - 다빈
	public void myinquiryPro(Map<String,Object> map) throws Exception;
	
	// 마이페이지(후기등록) - 다빈
	public void myreviewPro(Map<String,Object> map) throws Exception;
	
	// 마이페이지(리뷰등록 완려) - 다빈
	public void myreviewOk(String p_no) throws Exception;
	
	// 페이징 - 다빈
	public Integer getpayListCnt(Map<String, Object> map) throws Exception;
	public Integer getmsgListCnt(Map<String, Object> map) throws Exception;
	public Integer getmsgList2Cnt(Map<String, Object> map) throws Exception;
	public Integer getclassListCnt(Map<String, Object> map) throws Exception;
	public Integer getclassList2Cnt(Map<String, Object> map) throws Exception;
}