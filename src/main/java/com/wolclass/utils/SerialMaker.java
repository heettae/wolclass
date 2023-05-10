package com.wolclass.utils;

public class SerialMaker {
	/**
	 * len 길이의 랜덤한 문자열을 생성하는 메소드
	 * @param len
	 * @return String
	 */
	public static String getString(int len) {
		StringBuilder sb = new StringBuilder();
		for(int i=0; i<len; i++) sb.append((char)(Math.random()*128));
		return sb.toString();
	}
}
