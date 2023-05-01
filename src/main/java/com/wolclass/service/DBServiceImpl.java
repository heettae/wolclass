package com.wolclass.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.wolclass.domain.MemberVO;
import com.wolclass.persistance.DBDAO;

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
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        
        try {
			URL url = new URL(reqURL);
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=c6c8f231f2997186bfd65955c7b8f1ab");
			sb.append("&redirect_uri=http://localhost:8080/db/kakao");
			sb.append("&code="+authorize_code);
			bw.write(sb.toString());
			bw.flush();
			
			// 결과 코드가 200이라면 성공	
			int responseCode = conn.getResponseCode();
			logger.info("responseCode : "+responseCode);
			
			// 요청을 통해 얻은 JSON타입의 response 메시지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			logger.info("response bode : "+result);
			
			// Gson 라이브러리에 포함된 클래스로 JSON 파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
            logger.info("access_token : " + access_Token);
            logger.info("refresh_token : " + refresh_Token);
            
            br.close();
            bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}
	// 카카오 - 다빈
	@Override
	public HashMap<String, Object> getUserInfo(String access_Token) {
		HashMap<String, Object> userInfo = new HashMap();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			
			// 요청에 필요한 header 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer"+access_Token);
			
			int responseCode = conn.getResponseCode();
			logger.info("responseCode : "+responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			logger.info("response body : "+result);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();
              
            userInfo.put("nickname", nickname);
            userInfo.put("email", email);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}
	
	
}