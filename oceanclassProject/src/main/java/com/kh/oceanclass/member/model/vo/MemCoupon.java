package com.kh.oceanclass.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class MemCoupon {
	
	private int memCouponNo;	//회원에게 발급된 쿠폰 번호
	private String memNo;
	private int couponNo;		//해당쿠폰의 목록번호
	private String useYN;		
	private String enDate;
	private String deDate;		//만료일
	
}
