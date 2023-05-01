package com.wolclass.utils;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

// 날씨정보 가져오는 API임 HJ
public class OpenweatherAPI {
	// API 키
	private static String key = "82e953adfeafadc9e3212e9aad777930";
	
	/**
	 * 위도(lat) 경도(lon) 데이터 받아서 날씨정보를 리턴합니다.
	 * 전체 데이터를 받아오지만, 현재는 Clear(맑음), Rain(비) 등 기본값만 활용합니다.
	 * 
	 * @param String lat
	 * @param String lon
	 * @return String weatherMain
	 * @author bcdc124
	 */
	public static String getCurrentWeather(String lat, String lon) {
		if(lat == null) return "";
		
		StringBuilder url = new StringBuilder("https://api.openweathermap.org/data/2.5/weather?lat=");
		url.append(lat);
		url.append("&lon=");
		url.append(lon);
		url.append("&appid=");
		url.append(key);

		String result = "";
        try {
            URL urlObj = new URL(url.toString());
            HttpURLConnection conn = (HttpURLConnection) urlObj.openConnection();
            conn.setRequestMethod("GET");
            conn.connect();
            
            if (conn.getResponseCode() == 200) {
                Scanner sc = new Scanner(conn.getInputStream());
                StringBuffer sb = new StringBuffer();
                while (sc.hasNext()) {
                    sb.append(sc.next());
                }
                sc.close();

                result = sb.toString();
            }
            conn.disconnect();

        } catch (IOException e) {
            e.printStackTrace();
        }
		return result;
	}
}
// 날씨정보 가져오는 API임 HJ
