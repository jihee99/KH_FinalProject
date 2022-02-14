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
public class Stock {
	
	private String productNo;	//상품번호
	private String productName; 
	private int orderCount;	//주문수량
	private int stockCount;	//창고재고
	private String availCount;	//가용재고
	private String inValue;	//사용자가 입력한 값
	private String soldout;	//품절여부 (품절 : Y / 판매중 : N)

}
