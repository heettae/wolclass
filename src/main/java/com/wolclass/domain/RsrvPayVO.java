package com.wolclass.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RsrvPayVO {
	private Integer p_no;
	private String m_id;
	private Integer c_no;
	private Timestamp p_paydate;
	private Integer p_price;
	private Timestamp p_rsrvdate;
	private String p_key;
	private Integer p_peoplenum;
	private String p_cancel;
}
