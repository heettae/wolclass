package com.wolclass.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class RsrvPayVO {
	private String p_no;
	private String m_id;
	private Integer c_no;
	private Timestamp p_paydate;
	private Integer p_price;
	private Timestamp p_rsrvdate;
	private Integer p_peoplenum;
	private Integer p_subs;
	private Integer p_usedpoint;
	private String imp_uid;
	private String p_status;
	private Timestamp p_canceldate;
}

