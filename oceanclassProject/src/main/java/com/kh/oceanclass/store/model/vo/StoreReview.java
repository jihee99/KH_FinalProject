package com.kh.oceanclass.store.model.vo;

import java.sql.Date;

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
public class StoreReview {
	
	private int reviewNo; // 리뷰번호
	private int memberNo; // 회원번호
	private int productNo; // 상품번호
	private String content; // 리뷰내용
	private int rating; // 별점
	private Date reviewDate; // 작성일
	private String status; // 상태값
	
	private String title;//상품명
	private String img;	// 첨부파일 경로 
	
	public String nickname;
	public int totalCount;
	public double starAvg;
	public String profile;
	public int reconum;
	
	
	private int recoCk;
}
