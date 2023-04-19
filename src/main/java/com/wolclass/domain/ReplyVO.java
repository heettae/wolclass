package com.wolclass.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReplyVO {
	private Integer r_no;
	private Integer b_no;
	private String m_id;
	private String r_content;
	private Timestamp r_regdate;
	private Integer c_no;
	private Integer r_score;
}
