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
public class Product {
	
	private int productNo;			// 상품번호
	private int memberNo;			// 등록한회원번호(강사)
	private String category;	// 상품카테고리
	private String title;		// 상품명
	private int price;			// 상품가격
	private int stock;			// 창고재고
	private String enDate;		// 등록일(일단은 신청한 날로 insert하되, 관리자가 승인시 해당날짜로 update)
	private String courier;		// 택배회사
	private String soldoutYN;	// 품절여부
	private String status;		// 게시상태(Y-게시/N-승인대기/R-반려/D-내리기)
	private String productImg0;		// 메인이미지 경로
	private String productImg1;		// 상세이미지1 경로
	private String productImg2;		// 상세이미지2 경로
	private String productImg3;		// 상세이미지3 경로
	private String nickname;
	private String like;				// 찜 수
	private int likeCk;
	private String sort; // 정렬 번호
	private int quantity;

	
}
