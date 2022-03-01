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
public class InProductOrder {
	
	private int orderNo;
	private int productNo;
	private String title;
	private int stock;		  // 보유재고
	private	int quantity;	  // 주문수량
	private int unitPrice;	  // 상품단가
	private int total;		  // 총가격
	private String orderSite; // 주문사이트
	private String process;	  // '대기' | '완료'
	
	private String productName;
}
