package com.wolclass.domain;

import lombok.Data;

@Data
public class PayDTO2 {
	
	private Integer p_no;
	private Integer t_no;
	private String m_id;
	private String selectedDate;
	private Integer c_no;
    private String t_start;
    private Integer pNum;
    private Integer point;
    private boolean subs;
    private Integer c_price;
    private Integer price; // 계산된 가격
    private String p_key;
    
    private String p_rsrvdate;
    
    private int merchant_uid;
    private int cancel_request_amount;

    
    

}
