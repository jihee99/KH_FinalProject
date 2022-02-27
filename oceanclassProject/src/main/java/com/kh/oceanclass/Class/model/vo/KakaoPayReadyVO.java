package com.kh.oceanclass.Class.model.vo;

import lombok.Data;

@Data
public class KakaoPayReadyVO {

	//response
    private String tid, next_redirect_pc_url;
    //private Date created_at;
    private String created_at;
	
}
