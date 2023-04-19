package com.wolclass.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PopularSearchVO {
	private Timestamp ps_regdate;
	private String ps_text;
}
