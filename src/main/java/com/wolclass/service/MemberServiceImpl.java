package com.wolclass.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.wolclass.domain.BoardVO;
import com.wolclass.domain.MemberVO;
import com.wolclass.domain.RsrvPayVO;
import com.wolclass.domain.SubscriptionVO;
import com.wolclass.persistance.MemberDAO;
import com.wolclass.utils.SerialMaker;

@Service
public class MemberServiceImpl implements MemberService {

private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	private MemberDAO dao;
	
	@Override
	public MemberVO getMemberInfo(String m_id) throws Exception {
		return dao.getMemberInfo(m_id);
	}

	// 회원가입 - 다빈
	@Override
	public void memberJoin(Map<String,Object> map) throws Exception {
		dao.memberJoin(map);
	}
	// 아이디 중복검사 - 다빈
	@Override
	public Integer idCheck(String m_id) throws Exception {
		return dao.idCheck(m_id);
	}
	// 이메일 중복검사 - 다빈
	@Override
	public Integer emailCheck(String m_email) throws Exception {
		return dao.emailCheck(m_email);
	}
	// 전화번호 중복검사 - 다빈
	@Override
	public Integer phoneCheck(String m_phone) throws Exception {
		return dao.phoneCheck(m_phone);
	}
	// 로그인 - 다빈
	@Override
	public MemberVO memberLogin(MemberVO vo) throws Exception {
		MemberVO loginResultVO = dao.memberLogin(vo);
		return loginResultVO;
	}
	// 아이디 찾기 - 다빈
	@Override
	public MemberVO findId(MemberVO vo) throws Exception {
		MemberVO findIdVO = dao.findId(vo);
		return findIdVO;
	}
	
	// 비밀번호 찾기 - 다빈
	@Override
	public boolean findPw(MemberVO vo) throws Exception {
		return dao.findPw(vo) > 0;
	}
	// 임시비밀번호 설정 - 다빈
	@Override
	public void updateTempPw(MemberVO vo) {
		dao.updateTempPw(vo);
	}
	
	// 카카오 로그인 토큰 - 다빈
	@Override
	public String getToken(String code) throws Exception{
		String host = "https://kauth.kakao.com/oauth/token";
		URL url = new URL(host);
		HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
		String token = "";
		try {
			urlConnection.setRequestMethod("POST");
			urlConnection.setDoOutput(true); // 데이터 기록 알려주기
			
			BufferedWriter bw =  new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=c6c8f231f2997186bfd65955c7b8f1ab");
			sb.append("&redirect_uri=http://localhost:8080/member/kakao");
			sb.append("&code=" + code);
			
			bw.write(sb.toString());
			bw.flush();
			
			int responseCode = urlConnection.getResponseCode();
			logger.info("responseCode : "+responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			String line = "";
			String result = "";
			while((line = br.readLine()) != null) {
				result += line;
			}
			logger.info("result : "+result);
			// json 파싱
			JsonParser parser = new JsonParser();
			JsonObject elem = (JsonObject) parser.parse(result);
			
			String access_token = elem.get("access_token").toString();
			String refresh_token = elem.get("refresh_token").toString();
			logger.info("refresh_token : "+refresh_token);
			logger.info("access_token : "+access_token);
			
			token = access_token;
			br.close();
			bw.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
				
		return token;
	}
	
	// 카카오 - 다빈
	@Override
	public Map<String, String> getUserInfo(String access_token) throws Exception {
		String host = "https://kapi.kakao.com/v2/user/me";
		Map<String, String> result = new HashMap<>();
		try {
			URL url = new URL(host);
			
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
			urlConnection.setRequestProperty("Authorization", "Bearer " + access_token);
			urlConnection.setRequestMethod("GET");
			
			int responseCode = urlConnection.getResponseCode();
			logger.info("responseCode : "+responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			String line = "";
			String res = "";
			while((line=br.readLine()) != null) {
				res+=line;
			}
			logger.info("res : "+res);
			
			JsonParser parser = new JsonParser();
			JsonObject obj = (JsonObject) parser.parse(res);
			JsonObject kakao_account = (JsonObject) obj.get("kakao_account");
			JsonObject properties = (JsonObject) obj.get("properties");
			result.put("id", obj.get("id").toString());
			result.put("name", properties.get("nickname").toString().replaceAll("\"", ""));
            Object email = kakao_account.get("email");
            if(email != null) result.put("email", email.toString().replaceAll("\"", ""));
            
            // 비밀번호 random
    		result.put("password", SerialMaker.getString(8));
			
			br.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 카카오 insert
	@Override
	public void kakaoInsert(MemberVO vo) throws Exception{
		dao.kakaoInsert(vo);
	}
	// 카카오 select
	@Override
	public MemberVO kfindId(MemberVO vo) throws Exception {
		MemberVO kfindIdVO = dao.kfindId(vo);
		return kfindIdVO;
	}
	
	// 프로필사진 변경 - 다빈	
	@Override
	public void updateProfile(MemberVO vo) throws Exception {
		dao.updateProfile(vo);
	}
	
	// 회원정보 수정 - 다빈
	@Override
	public void updateMember(Map<String,Object> map) throws Exception {
		dao.updateMember(map);
	}
	
	// 회원탈퇴 - 다빈
	@Override
	public void deleteMember(String m_id) throws Exception {
		MemberVO vo = new MemberVO();
		// 랜덤한  비밀번호 생성
		vo.setM_id(m_id);
	    vo.setM_pw(SerialMaker.getString(20));
		dao.deleteMember(vo);
	}
	
	// 결제내역 - 다빈
	@Override
	public List<Map<String,Object>> payList(Map<String,Object> map) throws Exception {
		return getListByType(map, 4);
	}
	
	// 내가 신청한클래스(예약클래스) - 다빈
	@Override
	public List<Map<String,Object>> classList(Map<String,Object> map) throws Exception {
		return getListByType(map, 0);
	}
	
	// 내가 신청한클래스(지난클래스) - 다빈
	@Override
	public List<Map<String,Object>> classList2(Map<String,Object> map) throws Exception {
		return getListByType(map, 1);
	}
	
	// 메시지(받은) - 다빈
	@Override
	public List<BoardVO> msgList1(Map<String,Object> map) throws Exception {
		return getListByType(map, 2);
	}
	// 메시지(보낸) - 다빈
	@Override
	public List<BoardVO> msgList2(Map<String,Object> map) throws Exception {
		return getListByType(map, 3);
	}
	
	// 구독(남은기간) - 다빈
	@Override
	public SubscriptionVO subscribe(String id) throws Exception {
		return dao.subscribe(id);
	}
	
	// 문의하기 - 다빈
	@Override
	public void myinquiry(RsrvPayVO vo) throws Exception {
		dao.myinquiry(vo);
	}
	
	// 문의하기 처리 - 다빈
	@Override
	public void myinquiryPro(Map<String, Object> map) throws Exception {
		dao.myinquiryPro(map);
	}
	
	// 마이페이지(후기등록) - 다빈
	@Override
	public void myreviewPro(Map<String, Object> map) throws Exception {
		dao.myreviewPro(map);
	}
	
	// 마이페이지(리뷰등록 완려) - 다빈
	@Override
	public void myreviewOK(String p_no) throws Exception {
		dao.myreviewOk(p_no);
	}
	
	// 페이징 처리 - 다빈
	private List getListByType(Map<String, Object> map, int type) throws Exception {
		// 데이터 전처리
		if(!map.containsKey("pageNum")) map.put("pageNum", "1");
		// 데이터 전처리
		
		// 페이징 계산
		int pageSize = 5;
		int pageBlock = 10;
		int currentPage = Integer.parseInt((String)map.get("pageNum"));
		int startRow = (currentPage - 1) * pageSize + 1;
		int count = 0;
		switch (type) {
		case 0: count = dao.getclassListCnt(map); break;
		case 1: count = dao.getclassList2Cnt(map); break;
		case 2: count = dao.getmsgListCnt(map); break;
		case 3: count = dao.getmsgList2Cnt(map); break;
		case 4: count = dao.getpayListCnt(map); break;
		}
		List list = new ArrayList<>();
		map.put("startRow", startRow-1);
		map.put("pageSize", pageSize);
		if(count > 0) {    
			switch (type) {
			case 0: list = dao.classList(map); break;
			case 1: list = dao.classList2(map); break;
			case 2: list = dao.msgList1(map); break;
			case 3: list = dao.msgList2(map); break;
			case 4: list = dao.payList(map); break;
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
	
	// 생일 1주일 전
	@Override
	public int oneWeekBeforeBirth(String m_id) throws Exception {
		return dao.oneWeekBeforeBirth(m_id);
	}
	// 생일 1주일 전

	// 반려견 나이 계산
	@Override
	public Integer calculateAge(Timestamp m_dogbirth) throws Exception {
		LocalDate birthDate = m_dogbirth.toLocalDateTime().toLocalDate();
		logger.info("Service - birthDate @@@@@@@@@@@@ " + m_dogbirth);
		LocalDate now = LocalDate.now();
		return Period.between(birthDate, now).getYears();
	}
	// 반려견 나이 계산
}
