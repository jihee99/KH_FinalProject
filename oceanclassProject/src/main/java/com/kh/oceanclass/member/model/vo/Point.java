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
public class Point {

	private int pointNo;			//회원에게 발급된 쿠폰 번호
	private int memNo;
	private String type;			// 1.스토어 | 2.클래스
	private String orderNo;			// 스토어|클래스 주문번호		
	private String pointDate;		// 지급일
	private int pointPrice;			// 지급금액
	private String reason;			// 사유
	private String deadLine;		// 사용기한
	
}
