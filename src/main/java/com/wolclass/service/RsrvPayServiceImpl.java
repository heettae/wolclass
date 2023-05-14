package com.wolclass.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.wolclass.domain.PayDTO;
import com.wolclass.domain.RsrvPayVO;
import com.wolclass.persistance.RsrvPayDAO;

@Service
public class RsrvPayServiceImpl implements RsrvPayService {
	private static final Logger logger = LoggerFactory.getLogger(RsrvPayServiceImpl.class);
	
	@Autowired
	private RsrvPayDAO dao;
	
	@Override
	public String makeP_no() throws Exception {
		logger.info("service - makeP_no 호출 ");
		String pno = dao.makeP_no();
		return pno;
	}

	@Override
	public Integer totalPrice(PayDTO pdto) throws Exception {
		logger.info("service도착");
		double subs = (double) (pdto.isSubs() ? 0.5 : 1);
		int totalPrice = (int) ((pdto.getC_price()*subs))+(pdto.getC_price()*(pdto.getPeopleNum()-1))-pdto.getPoint();
		logger.info("totalPrice : "+totalPrice);
		return totalPrice;
	}
	
	@Override
	public String getAccessToken() {
		String access_Token = "";
		String reqURL = "https://api.iamport.kr/users/getToken";
		String data = "{ \"imp_key\" : \"1717204851848125\", \"imp_secret\" : \"cswNoO2YaVfwNdU0PfSHc9bMil9ziUaQ0gHgAt8LhiPBSB8avP44YrwEjC3JqC9gVOEdNGNntWWGALfD\"}";
		try {
			URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        
	        // POST 요청
	        conn.setDoOutput(true);
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Content-Type", "application/json");
	   
	        // data 넣기
	        try (OutputStream os = conn.getOutputStream()){
				byte request_data[] = data.getBytes("utf-8");
				os.write(request_data);
				os.close();
			} catch(Exception e) {
				e.printStackTrace();
			}	
	        
	        int responseCode = conn.getResponseCode();
	        if(responseCode == 200) { // 결과 코드가 200이면 성공
	        	// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";
	            
	            while ((line = br.readLine()) != null) {
	                result += line;
	            }

	            // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);
	            
	            access_Token = element.getAsJsonObject().get("response").getAsJsonObject().get("access_token").getAsString();
	            br.close();	
	        }
		}catch(Exception e) {
	        e.printStackTrace();
		}
		logger.info("토큰"+access_Token);
		return access_Token;
	}
	
	@Override
	public RsrvPayVO getPaymentInfo(String accessToken, PayDTO pdto) {
		RsrvPayVO paymentInfo = new RsrvPayVO(); // payDTO에서 수정
		paymentInfo.setP_no(pdto.getP_no());
		String reqURL = "https://api.iamport.kr/payments/" + pdto.getImp_uid();
		try {
			URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        
	        // GET 요청
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Authorization", accessToken);
	        
	        int responseCode = conn.getResponseCode();
	        if(responseCode == 200) { // 결과 코드가 200이면 성공
	        	// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";
	            
	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	     
	            // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);
	            
	            JsonObject response = element.getAsJsonObject().get("response").getAsJsonObject();
	            
	            if(!response.getAsJsonObject().get("amount").isJsonNull()) { paymentInfo.setP_price(response.getAsJsonObject().get("amount").getAsInt()); }
	            if(!response.getAsJsonObject().get("status").isJsonNull()) { paymentInfo.setP_status(response.getAsJsonObject().get("status").getAsString()); }
	            
	            br.close();	
	        }
		}catch(Exception e) {
	        e.printStackTrace();
		}
		logger.info("paymentInfo"+paymentInfo);
		return paymentInfo;
	}

	
	
	@Override
	public void insertPaymentInfo(PayDTO pdto) throws Exception{
		if(pdto.getSelectedDate()!=null) {
			pdto.setP_rsrvdate(pdto.getSelectedDate()+" "+pdto.getT_start());
		}
		dao.insertPaymentInfo(pdto); 
	}

	@Override
	public Integer updatePaymentInfo(RsrvPayVO rvo) throws Exception {
		logger.info("service.update"+rvo);
		return dao.updatePaymentInfo(rvo);
	}

	@Override
	public Integer selectPrice(String p_no) throws Exception {
		logger.info("service.selectPrice 호출, p_no : "+p_no);
		return dao.selectPrice(p_no);
	}

	@Override
	public Integer modifyOrder(String p_no) throws Exception{
		logger.info("service.selectPrice"+p_no);
		return dao.modifyOrder(p_no);
	}

	@Override
	public RsrvPayVO selectPayInfo(String p_no) throws Exception {
		return dao.selectPayInfo(p_no);
	}

	@Override
	public RsrvPayVO getCancelInfo(String accessToken, RsrvPayVO rvo) throws Exception {
		RsrvPayVO cancelInfo = new RsrvPayVO();
		cancelInfo.setP_no(rvo.getP_no());
		
		String reqURL = "https://api.iamport.kr/payments/cancel";
		String data = "{ \"reason\" : \"사용자 요청\", "
				+ "\"imp_uid\" : \"" + rvo.getImp_uid() + "\"} ";
		try {
			URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        
	        // POST 요청을 위해 기본값이 false인 setDoOutput을 true로
	        conn.setDoOutput(true);
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Content-Type", "application/json");
	        conn.setRequestProperty("Authorization", accessToken);
	        
	        //data 넣기
	        try (OutputStream os = conn.getOutputStream()){
				byte request_data[] = data.getBytes("utf-8");
				os.write(request_data);
				os.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}	
	        
	        // 결과 코드가 200이라면 성공
	        int responseCode = conn.getResponseCode();
	        if(responseCode == 200) {
	        	// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";
	            
	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);
	            
	            if(!element.getAsJsonObject().get("code").getAsString().equals("0")) { 
	            	return null;
	            }else {
	            	JsonObject response = element.getAsJsonObject().get("response").getAsJsonObject();
	            	
	            	if(!response.getAsJsonObject().get("amount").isJsonNull()) { cancelInfo.setP_price(response.getAsJsonObject().get("amount").getAsInt()); }
	                if(!response.getAsJsonObject().get("status").isJsonNull()) { cancelInfo.setP_status(response.getAsJsonObject().get("status").getAsString()); }
	            	
	            }
	            br.close();	
	        }
		}catch(Exception e) {
	        e.printStackTrace();
		}
		
		return cancelInfo;
	}

}
