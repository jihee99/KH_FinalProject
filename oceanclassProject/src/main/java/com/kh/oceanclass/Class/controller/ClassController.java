package com.kh.oceanclass.Class.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oceanclass.Class.model.service.ClassServiceImpl;
import com.kh.oceanclass.Class.model.vo.ClassVo;

/*사용자 클래스 관련 기능 처리하는 controller*/

@Controller
public class ClassController {

	@Autowired
	private ClassServiceImpl cService;
	
	@RequestMapping(value="classDetail.me")
	public String classDetail(int clNo, Model model, HttpSession session) {
		// 클래스 상세보기 페이지
		
		int result = cService.increaseCount(clNo);
		
		if(result > 0) {
			// 조회수 증가 성공 -> 정상적인 페이지 -> 내용 넣어서 상세보기 해오기
			ClassVo c = cService.selectClass(clNo);
			model.addAttribute("c", c);
			return "class/classDetail";
		} else {
			session.setAttribute("alertMsg", "조회할 수 없는 클래스입니다.");
			return "redirect:/";
		}
		
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
