package com.wolclass.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.wolclass.domain.ClassVO;
import com.wolclass.domain.PayDTO;
import com.wolclass.domain.SubscriptionVO;
import com.wolclass.domain.TimetableVO;
import com.wolclass.persistance.THDAO;

@Service
public class THServiceImpl implements THService {
	
	

	private static final Logger logger = LoggerFactory.getLogger(THServiceImpl.class);

	@Inject
	private	THDAO dao;
		
	@Override
	public String getTime() {
		
		return dao.getDBTime();
	}
	
	@Override
	public ClassVO getClassDetail(Integer c_no) throws Exception {
		logger.info("service-dao호출");
		return dao.selectClass(c_no);
	}

	@Override
	public List<TimetableVO> getTimetable(Integer c_no) throws Exception {
		List resultVO = dao.getTimetable(c_no);
		return resultVO;
	}

	@Override
	public List<TimetableVO> getTime(TimetableVO vo) throws Exception {
		logger.info("service도착");
		List resultVO = dao.getTime(vo);
		return resultVO;
	}

	@Override
	public TimetableVO getRemainNum(TimetableVO vo) throws Exception {
		logger.info("service도착");
		TimetableVO resultVO = dao.getRemainNum(vo);
		return resultVO;
	}

	@Override
	public SubscriptionVO getSubsInfo(String m_id) throws Exception {
		
		return dao.getSubsInfo(m_id);
	}

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
	
	
	
//	[출처] 아임포트(i'mport) 일반결제 연동하기 - Java/Spring/React (1)|작성자 561
	@Override
	public String getAccessToken(PayDTO paymentsModel) {
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
			 // TODO Auto-generated catch block
	        e.printStackTrace();
	      
		}
		logger.info("토큰"+access_Token);
		return access_Token;
	}
	
	
	@Override
	public PayDTO getPaymentInfo(String accessToken, PayDTO pdto) {
		PayDTO paymentInfo = new PayDTO();
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
	            
	            if(!response.getAsJsonObject().get("amount").isJsonNull()) { paymentInfo.setPrice(response.getAsJsonObject().get("amount").getAsInt()); }
	            //if(!response.getAsJsonObject().get("apply_num").isJsonNull()) { paymentInfo.setApplyNum(response.getAsJsonObject().get("apply_num").getAsString()); }
	            //if(!response.getAsJsonObject().get("bank_code").isJsonNull()) { paymentInfo.setBankCode(response.getAsJsonObject().get("bank_code").getAsString()); }
	            
	            if(!response.getAsJsonObject().get("status").isJsonNull()) { paymentInfo.setStatus(response.getAsJsonObject().get("status").getAsString()); }



	            
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
		
		pdto.setP_rsrvdate(pdto.getSelectedDate()+" "+pdto.getT_start());
		dao.insertPaymentInfo(pdto); 
		
		
	}

	@Override
	public Integer updatePaymentInfo(PayDTO pdto) throws Exception {
		logger.info("service.update"+pdto);
		return dao.updatePaymentInfo(pdto);
	}

	@Override
	public Integer selectPrice(String p_no) throws Exception {
		
		return dao.selectPrice(p_no);
	}
	
	
	

}
