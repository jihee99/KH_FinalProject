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
public class StoreBuyList {
	
	private String orderNo;
	private String productNo;
	private String optionNo;
	private String quantity;
	private String price;
	
	private String title;

}
