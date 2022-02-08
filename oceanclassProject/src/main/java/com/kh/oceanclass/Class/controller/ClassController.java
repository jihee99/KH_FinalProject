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
	
}
