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
public class Coupon {
	private int couponNo;
	private String couponName; 
	private int discount;
	private String dedate;
	private int memNo;
	private String use;
	private String endate;
	private int count;		//현재발급된 쿠폰수
	private int maxCount;	//최대발급 쿠폰수
	private int status;
}	
