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
	private int pointUse;
	private int pcNo;
	private int amount;
	private String paymentDate;
	private int paymentOption;
	private String deposit;
	private int pointSave;
	private String readingCheck;
	
}
