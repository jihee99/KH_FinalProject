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
	private int count;
	private int memNo;
	private String use;
	private String endate;
}	
