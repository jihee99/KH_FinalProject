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
public class Cart {
	
	private int cartNo;
	private int memberNo;
	private int productNo;
	private int optionNo;
	private int quantity;
	
}
