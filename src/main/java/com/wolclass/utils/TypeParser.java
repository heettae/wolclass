package com.wolclass.utils;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;

// 데이터 타입 변환 HJ
/**
 * 데이터타입 변환해주는 클래스입니다.
 * 필요 시 기능 추가 예정
 * v1.0.0 - java.lang.String -> java.sql.Time, java.sql.Date 
 * @author bcdc124
 *
 */
public class TypeParser {
	/**
	 * @param timeStr HH:mm
	 * @return java.sql.Time
	 */
	public static Time stringToTime(String timeStr) throws Exception{
		return new Time(new SimpleDateFormat("HH:mm").parse(timeStr).getTime());
	}
	
	/**
	 * @param dateStr yyyy-MM-dd
	 * @return java.sql.Date
	 */
	public static Date stringToDate(String dateStr) throws Exception{
		return new Date(new SimpleDateFormat("yyyy-MM-dd").parse(dateStr).getTime());
	}

}
//데이터 타입 변환 HJ