package com.kh.oceanclass.store.model.vo;

import java.sql.Date;

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
public class StoreRefund {
	
	private int refundNo;
	private int orderNo;
	private String refund;
	private Date refundDate;
	private String refundStatus;
}
