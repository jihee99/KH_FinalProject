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

	private int orderCount;	//주문수량
	private int stockCount;	//창고재고
	private int availCount;	//가용재고
}
