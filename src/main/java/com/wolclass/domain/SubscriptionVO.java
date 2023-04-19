package com.wolclass.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SubscriptionVO {
	private Integer s_no;
	private String m_id;
	private Timestamp s_start;
	private Timestamp s_end;
	private Integer s_cnt;
}
