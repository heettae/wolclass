package com.wolclass.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class TimetableVO {
	private Integer t_no;
	private Timestamp t_start;
	private Timestamp t_end;
	private Timestamp t_date;
	private Integer c_no;
}
