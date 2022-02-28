package com.kh.oceanclass.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class InstructorStarChart {

	// 상품별 만족도
	// 필요컬럼
	// 상품번호, 별점, 수
	private int productNo;		//DB COULUMN pno
	private int star;			//DB COULUMN star
	private int starCount;		//DB COULUMN count
	
}
