package com.kh.oceanclass.Class.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ClassOrder {
	
	private String coNo;
	private int clNo;
	private String memNo;
	private int price;
	private Integer pointUse;
	private Integer pcNo;
	private int amount;
	private String paymentDate;
	private int paymentOption;
	private String deposit;
	private int pointSave;
	private String readingCheck;
	
	//관리자 주문내역 조회시 추가로 필요한 데이터
	private String userId;
	private String userName;
	private String requestDate;
	
	//주문내역 상세조회시 필요한 데이터
	private String refundNo;
	private String clName;
	private String clPrice;
	private String phone;
	
	// 마이페이지 내클래스내역에 필요
	private String clImg;
}
