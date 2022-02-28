package com.kh.oceanclass.common.model.service;

import java.util.ArrayList;

import com.kh.oceanclass.common.model.vo.InstructorQnaChart;
import com.kh.oceanclass.common.model.vo.InstructorStarChart;
import com.kh.oceanclass.store.model.vo.Product;

public interface InstructorChartService {

	// 00. 해당 회원이 등록한 상품 리스트 불러오기
	ArrayList<Product> productList();
	
	// 1_1. 전체 상품 별점 카운트
	ArrayList<InstructorStarChart> starChartList(String productNo);
	
	// 1_2. 전체 상품 QNA 및 응답 카운트 (group_by pno)
	ArrayList<InstructorQnaChart> qnaChartList(String productNo);
	
	// 2_1. 상품별 별점 카운트
	
	// 2_2. 상품별 QNA 및 응답 카운트(group by create_Date)
	
}
