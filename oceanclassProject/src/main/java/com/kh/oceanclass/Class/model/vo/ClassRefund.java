package com.kh.oceanclass.Class.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ClassRefund {
	
	private String clRefundNo;
	private String coNo;
	private String reason;
	private String requestDate;
	private String status;
}
