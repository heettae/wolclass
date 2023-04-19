package com.wolclass.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	private String m_id;
	private String m_pw;
	private String m_email;
	private String m_name;
	private String m_nick;
	private Timestamp m_regdate;
	private String m_phone;
	private String m_dogtype;
	private Timestamp m_dogbirth;
	private String m_profile;
	private Integer m_point;
}
