package com.wolclass.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AlertVO {
	private Integer a_no;
	private String m_id;
	private String a_content;
	private Integer category;
	private String cate_no;
	private Timestamp a_senddate;
	private String a_check;
}
