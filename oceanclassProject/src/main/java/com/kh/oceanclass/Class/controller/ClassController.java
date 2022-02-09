package com.kh.oceanclass.Class.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*사용자 클래스 관련 기능 처리하는 controller*/

@Controller
public class ClassController {

	@RequestMapping(value="classDetail.me")
	public String classDetail() {
		// 클래스 상세보기 페이지 이동용(뷰 확인용) 메소드
		return "class/classDetail";
	}
	
	@RequestMapping(value="classPay.me")
	public String classPay() {
		// 클래스 결제 페이지 이동용(뷰 확인용) 메소드
		return "class/classPay";
	}
	
	@RequestMapping(value="classPayComplate.me")
	public String classPayComplate() {
		// 클래스 결제 완료 페이지 이동용(뷰 확인용) 메소드
		return "class/classPayComplate";
	}
	
	@RequestMapping(value="classReviewList.me")
	public String classReviewList() {
		// 클래스 리뷰 리스트 이동용(뷰 확인용) 메소드
		return "class/classReviewList";
	}
	
	@RequestMapping(value="classReviewDetail.me")
	public String classReviewDetail() {
		// 클래스 리뷰 디테일 이동용(뷰 확인용) 메소드
		return "class/classReviewDetail";
	}
	
}
