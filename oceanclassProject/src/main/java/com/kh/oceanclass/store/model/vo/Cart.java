package com.kh.oceanclass.store.model.vo;

import java.util.ArrayList;

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
	
	private String title;		// 상품명
	private int price;
	private String productImg0;		// 메인이미지 경로
	
	private String optionName;		// 옵션명
	private int opPrice;
	
	private String nickname;
	
	private ArrayList<ProductOption> optionList;
	
}
