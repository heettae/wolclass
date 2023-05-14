package com.wolclass.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.wolclass.domain.BoardVO;
import com.wolclass.domain.MemberVO;
import com.wolclass.domain.RsrvPayVO;
import com.wolclass.domain.SubscriptionVO;

public interface MemberService {
	
	// 회원 정보 조회
	public MemberVO getMemberInfo(String m_id) throws Exception;
	
	// 회원가입 - 다빈
	public void memberJoin(Map<String,Object> map) throws Exception;
	
	// 아이디 중복검사 - 다빈
	public Integer idCheck(String m_id) throws Exception;
	
	// 이메일 중복검사 - 다빈
	public Integer emailCheck(String m_email) throws Exception;
	
	// 전화번호 중복검사 - 다빈
	public Integer phoneCheck(String m_phone) throws Exception;
	
	// 로그인 - 다빈
	public MemberVO memberLogin(MemberVO vo) throws Exception;
	
	// 아이디 찾기 - 다빈
	public MemberVO findId(MemberVO vo) throws Exception;
	
	// 비밀번호 찾기 - 다빈
	public boolean findPw(MemberVO vo) throws Exception;

	// 임시비밀번호 설정 - 다빈
	public void updateTempPw(MemberVO vo);
	
	// 카카오로그인 토큰 - 다빈
	public String getToken(String code) throws Exception;
	public Map<String, String> getUserInfo(String access_token) throws Exception;
	
	// 카카오 로그인, 회원가입 - 다빈
	public void kakaoInsert(MemberVO vo) throws Exception;
	public MemberVO kfindId(MemberVO vo) throws Exception;
	
	// 프로필사진 변경 - 다빈	
	public void updateProfile(MemberVO vo) throws Exception;
	
	// 회원정보 수정 - 다빈
	public void updateMember(Map<String,Object> map) throws Exception;
	
	// 회원탈퇴 - 다빈
	public void deleteMember(String m_id) throws Exception;
	
	// 결제내역 - 다빈
	public List<Map<String,Object>> payList(Map<String, Object> map) throws Exception;
	
	// 내가신청한클래스(예약한클래스) - 다빈
	public List<Map<String,Object>> classList(Map<String, Object> map) throws Exception;
	
	// 내가신청한클래스(지난클래스) - 다빈
	public List<Map<String,Object>> classList2(Map<String, Object> map) throws Exception;
	
	// 메시지(받은) - 다빈
	public List<BoardVO> msgList1(Map<String, Object> map) throws Exception;
	
	// 메시지(보낸) - 다빈
	public List<BoardVO> msgList2(Map<String, Object> map) throws Exception;
	
	// 구독(남은기간) - 다빈
	public SubscriptionVO subscribe(String id) throws Exception;
	
	// 문의하기 - 다빈
	public void myinquiry(RsrvPayVO vo) throws Exception;
	
	// 문의하기 처리 - 다빈
	public void myinquiryPro(Map<String,Object> map) throws Exception;
	
	// 마이페이지(후기등록) - 다빈
	public void myreviewPro(Map<String,Object> map) throws Exception;
	
	// 마이페이지(리뷰등록 완려) - 다빈
	public void myreviewOK(String p_no) throws Exception;
	
	// 반려견 나이 계산
	public Integer calculateAge(Timestamp birth) throws Exception;
	
	// 반려견 생일 1주일 전 계산
	public int oneWeekBeforeBirth(String m_id) throws Exception;
	
}
