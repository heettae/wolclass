package com.wolclass.utils;

import java.util.Random;

public class SerialMaker {
	private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	/**
	 * len 길이의 랜덤한 문자열을 생성하는 메소드
	 * @param len
	 * @return String
	 */
	public static String getString(int len) {
		Random random = new Random();
		StringBuilder sb = new StringBuilder();
		for(int i=0; i<len; i++) sb.append(CHARACTERS.charAt(random.nextInt(CHARACTERS.length())));
		return sb.toString();
	}
}
