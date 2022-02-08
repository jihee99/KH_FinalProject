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
public class ProductOption {
	
	private int opNo;			// 옵션번호
	private int pNo;			// 상품번호(참조)
	private String opName;		// 옵션명
	private int price;			// 가격
}
