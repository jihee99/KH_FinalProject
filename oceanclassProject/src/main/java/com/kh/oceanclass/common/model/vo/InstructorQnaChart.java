package com.kh.oceanclass.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class InstructorQnaChart {

	// 상품별 문의 응답 추이
	// 필요컬럼
	// 상품번호 , 문의 수, 응답수, 문의날짜
	
	private int productNo;
	private int qnaCount;
	private int answerCount;
	private String createDate;
}
