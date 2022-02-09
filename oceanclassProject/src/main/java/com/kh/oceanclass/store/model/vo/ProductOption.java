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
	
	private String optionNo;		// 옵션번호
	private int productNo;			// 상품번호(참조)
	private String optionName;		// 옵션명
	private int price;			// 가격
}
