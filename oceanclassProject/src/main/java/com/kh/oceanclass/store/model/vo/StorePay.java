package com.kh.oceanclass.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class StorePay {
	
	private String orderNo;
	private int memberNo;
	private String payAmount;
	private String payDate;
	private String payMethod;
	private String orderStatus;
	private String payStatus;
	private String depositCK;
	private String usePoint;
	private String useCoupon;
	private String point;
	private String deliveryFee;
	
	private String address;
	private String title;
	private String img;
	private String userName;
	private String phone;
	
	private String startDate;
	private String endDate;
}
