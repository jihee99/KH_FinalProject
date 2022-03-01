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
	
	private int productNo;		// DB COULUMN pno
	private int qnaCount;		// DB COULUMN qna_count
	private int answerCount;	// DB COULUMN answer_count
	private String createDate;	// DB COULUMN create_date
}
