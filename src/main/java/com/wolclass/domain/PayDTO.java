package com.wolclass.domain;

import lombok.Data;

@Data
public class PayDTO {
	
	private String p_no;
	private Integer t_no;
	private String m_id;
	private String selectedDate;
	private Integer c_no;
    private String t_start;
    private Integer peopleNum;
    private Integer point;
    private boolean subs;
    private Integer c_price;
    private Integer price; // 계산된 가격
    //private String paid_at;
    private String p_rsrvdate;
    private String imp_uid; // p_key 를 바꿀지 고민
    private String merchant_uid;
    private String applyNum;
    private String bankCode;
    private String status;
    

}
