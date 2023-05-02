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
import com.google.protobuf.TextFormat.ParseException;
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
	public Map<String, Object> getUserInfo(String access_token) throws Exception {
		String host = "https://kapi.kakao.com/v2/user/me";
		Map<String, Object> result = new HashMap<>();
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
			
			String id = obj.get("id").toString();
			String nickname = properties.get("nickname").toString();
            Object email = kakao_account.get("email");
            if(email != null) result.put("email", email.toString());
            
			result.put("id", id);
			result.put("nickname", nickname);
			
			
			br.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 카카오 - 다빈
	@Override
	public String getAgreementInfo(String access_token) throws Exception {
		String result = "";
		String host = "https://kapi.kakao.com/v2/user/scopes";
		try {
			URL url = new URL(host);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
			urlConnection.setRequestMethod("GET");
			urlConnection.setRequestProperty("Authorization", "Bearer " +access_token);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			String line = "";
			while((line=br.readLine()) != null) {
				result += line;
			}
			int responseCode = urlConnection.getResponseCode();
			logger.info("responseCode : "+responseCode);
			
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
	
	
}