package com.kh.oceanclass.Class.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.oceanclass.Class.model.service.ClassServiceImpl;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.LikeVo;
import com.kh.oceanclass.member.model.vo.Member;

/*사용자 클래스 관련 기능 처리하는 controller*/

@Controller
public class ClassController {

	@Autowired
	private ClassServiceImpl cService;
	
	@RequestMapping(value="classDetail.me")
	public String classDetail(int referNo, Model model, HttpSession session) {
		// 클래스 상세보기
		
		int result = cService.increaseCount(referNo);
		
		if(result > 0) {
			// 조회수 증가 성공 -> 정상적인 페이지 -> 내용 넣어서 상세보기 해오기
			if(session.getAttribute("loginUser") != null) {
				// 로그인 한 회원이라면 찜 했는지 안했는지도 확인하기
				int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
				LikeVo li2 = new LikeVo();
				li2.setMemNo(memNo);
				li2.setReferNo(referNo);
				int ckResult = cService.checkClassLike(li2);
				if(ckResult > 0) {
					// 찜 안되어있는 상태
					model.addAttribute("like", "n");
				} else {
					model.addAttribute("like", "y");
				}
			} 
			
			ClassVo c = cService.selectClass(referNo);
			model.addAttribute("c", c);
			return "class/classDetail";
		} else {
			session.setAttribute("alertMsg", "조회할 수 없는 클래스입니다.");
			return "redirect:/";
		}
		
	}

	@RequestMapping(value="classSearchList.me")
	public String classSearchList(String keyword, Model model, HttpSession session) {
		// 클래스 검색 리스트
		
		ArrayList<ClassVo> list = cService.classSearchList(keyword);
		
		model.addAttribute("list", list);
		return "class/classSearchList"; 
	}
	
	@ResponseBody
	@RequestMapping(value="likeClass.me", produces="text/html; charset=UTF-8")
	public String classLike(LikeVo li, String grade) {
		
		//학생인지 아닌지부터 확인
		if(grade.equals("S")) {
			// 이미 찜한적이 있는지 확인
			int result1 = cService.checkClassLike(li);
			
			if(result1 > 0) {
				// 이미 찜한 적 있음 -> 찜 내역 삭제
				int result2 = cService.deleteClassLike(li);
				
				if(result2 > 0) {
					// 삭제 완료
					return "dd";
				} 
			} else {
				// 찜 한 적 없음
				int result2 = cService.insertClassLike(li);
				
				if(result2 > 0) {
					// 찜 성공
					return "ss";
				} 
			}
		} else {
			return "gradeCkNo";
		}
		
		return "ff";
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
