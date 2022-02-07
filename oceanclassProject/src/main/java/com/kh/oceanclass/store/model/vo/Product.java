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
	
	public int productNo;			// 상품번호
	public int memberNo;			// 등록한회원번호(강사)
	public String category;	// 상품카테고리
	public String title;		// 상품명
	public int price;			// 상품가격
	public int stock;			// 창고재고
	public String enDate;		// 등록일(일단은 신청한 날로 insert하되, 관리자가 승인시 해당날짜로 update)
	public String courier;		// 택배회사
	public String soldoutYN;	// 품절여부
	public String status;		// 게시상태(Y-게시/N-승인대기/R-반려/D-내리기)
	public String mainImg;		// 메인이미지 경로
	public String subImg1;		// 상세이미지1 경로
	public String subImg2;		// 상세이미지2 경로
	public String subImg3;		// 상세이미지3 경로

	
}
