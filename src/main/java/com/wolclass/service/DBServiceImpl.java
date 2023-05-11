package com.wolclass.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
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
import com.wolclass.domain.ClassVO;
import com.wolclass.domain.MemberVO;
import com.wolclass.domain.RsrvPayVO;
import com.wolclass.domain.SubscriptionVO;
import com.wolclass.persistance.DBDAO;
import com.wolclass.utils.TypeParser;

@Service
public class DBServiceImpl implements DBService{
	private static final Logger logger = LoggerFactory.getLogger(DBServiceImpl.class);
	
	@Autowired
	private DBDAO dbdao;
	
	// 회원가입 - 다빈
	@Override
	public void memberJoin(Map<String,Object> map) throws Exception {
		dbdao.memberJoin(map);
	}
	// 아이디 중복검사 - 다빈
	@Override
	public Integer idCheck(String m_id) throws Exception {
		return dbdao.idCheck(m_id);
	}
	// 이메일 중복검사 - 다빈
	@Override
	public Integer emailCheck(String m_email) throws Exception {
		return dbdao.emailCheck(m_email);
	}
	// 전화번호 중복검사 - 다빈
	@Override
	public Integer phoneCheck(String m_phone) throws Exception {
		return dbdao.phoneCheck(m_phone);
	}
	// 로그인 - 다빈
	@Override
	public MemberVO memberLogin(MemberVO vo) throws Exception {
		MemberVO loginResultVO = dbdao.memberLogin(vo);
		return loginResultVO;
	}
	// 아이디 찾기 - 다빈
	@Override
	public MemberVO findId(MemberVO vo) throws Exception {
		MemberVO findIdVO = dbdao.findId(vo);
		return findIdVO;
	}
	
	// 비밀번호 찾기 - 다빈
	@Override
	public boolean findPw(MemberVO vo) throws Exception {
		return dbdao.findPw(vo) > 0;
	}
	// 임시비밀번호 설정 - 다빈
	@Override
	public void updateTempPw(MemberVO vo) {
		dbdao.updateTempPw(vo);
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
			sb.append("&redirect_uri=http://localhost:8080/db/kakao");
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
            Random random = new Random();
    		StringBuilder sb = new StringBuilder();
    		for (int i = 0; i < 8; i++) {
    		    int type = random.nextInt(3);
    		    switch (type) {
    		        case 0:
    		            sb.append(random.nextInt(10));
    		            break;
    		        case 1:
    		            sb.append((char) (random.nextInt(26) + 'A'));
    		            break;
    		        case 2:
    		            sb.append((char) (random.nextInt(26) + 'a'));
    		            break;
    		    }
    		}
    		result.put("password", sb.toString());
			
			br.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 카카오 insert
	@Override
	public void kakaoInsert(MemberVO vo) throws Exception{
		dbdao.kakaoInsert(vo);
	}
	// 카카오 select
	@Override
	public MemberVO kfindId(MemberVO vo) throws Exception {
		MemberVO kfindIdVO = dbdao.kfindId(vo);
		return kfindIdVO;
	}
	
	// 특정회원조회 - 다빈 
	@Override
	public MemberVO selectMember(String m_id) throws Exception {
		return dbdao.selectMember(m_id);
	}
	
	// 프로필사진 변경 - 다빈	
	@Override
	public void updateProfile(MemberVO vo) throws Exception {
		dbdao.updateProfile(vo);
	}
	
	// 회원정보 수정 - 다빈
	@Override
	public void updateMember(Map<String,Object> map) throws Exception {
		dbdao.updateMember(map);
	}
	
	// 회원탈퇴 - 다빈
	@Override
	public void deleteMember(String m_id) throws Exception {
		
		MemberVO vo = new MemberVO();
		// 랜덤한  비밀번호 생성
	    Random random = new Random();
	    String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	    String randomPassword = "";
	    for (int i = 0; i < 20; i++) {
	        randomPassword += characters.charAt(random.nextInt(characters.length()));
	    }
	    String password = randomPassword;

		vo.setM_id(m_id);
	    vo.setM_pw(password);
		dbdao.deleteMember(vo);
	}
	
	// 결제내역 - 다빈
	@Override
	public List<Map<String,Object>> payList(String id) throws Exception {
		return dbdao.payList(id);
	}
	
	// 내가 신청한클래스(예약클래스) - 다빈
	@Override
	public List<Map<String,Object>> classList(String id) throws Exception {
		return dbdao.classList(id);
	}
	
	// 내가 신청한클래스(지난클래스) - 다빈
	@Override
	public List<Map<String,Object>> classList2(String id) throws Exception {
		return dbdao.classList2(id);
	}
	
	// 메시지(받은) - 다빈
	@Override
	public List<BoardVO> msgList1(String id) throws Exception {
		return dbdao.msgList1(id);
	}
	// 메시지(보낸) - 다빈
	@Override
	public List<BoardVO> msgList2(String id) throws Exception {
		return dbdao.msgList2(id);
	}
	
	// 구독(남은기간) - 다빈
	@Override
	public SubscriptionVO subscribe(String id) throws Exception {
		return dbdao.subscribe(id);
	}
	
	
}