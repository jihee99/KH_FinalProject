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
public class StoreOrder {
//스토어 주문 내역 담을 객체
	
	// PAY 테이블 관련 
	private String orderNo;		// 주문번호
	private int memNo;
	private String address;
	private String payAmount;	// (주문별구매내역의 총가격 - 할인금액)
	private String payDate;
	private String payMethod;	// 무통장 | 카드
	private String orderStatus;	// 1 결제완료 | 2 상품준비중 | 3 배송시작 | 4 배송중  | 5 배송완료  | 6 주문취소 | 7 취소완료
	private String payStatus;	//
	private String depositCK;
	private String usePoint;
	private String useCoupon;
	private String point;
	private String delFee;
	
	//S_BUYLIST 테이블 관련 
	private int productNo;	
	private int optionNo;
	private int quantity;
	private int price;
	private String productName;
	private String title;
	private String optionName;
	
	//s_refund
	private int refundNo;
	private String refundDate;
	private String refundStatus;
	
	// 추가로 필요한 요소 
	// 회원아이디, 회원명, ....
	private String userId;
	private String userName;
	private String phone;
}
