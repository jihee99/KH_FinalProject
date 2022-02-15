package com.kh.oceanclass.Class.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.oceanclass.Class.model.service.ClassServiceImpl;
import com.kh.oceanclass.Class.model.vo.ClassLikeCk;
import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.LikeVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.member.model.vo.Member;

/*사용자 클래스 관련 기능 처리하는 controller*/

@Controller
public class ClassController {

	@Autowired
	private ClassServiceImpl cService;
	
	@RequestMapping(value="classDetail.me")
	public String classDetail(LikeVo li, Model model, HttpSession session) {
		// 클래스 상세보기
		
		// 조회수 증가
		int result = cService.increaseCount(li.getReferNo());
		
		if(result > 0) {
			if(session.getAttribute("loginUser") != null) {
				// 로그인 한 회원이라면 찜 했는지 안했는지도 확인하기
				int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
				li.setMemNo(memNo);
				int ckResult = cService.checkClassLike(li);
				if(ckResult > 0) {
					model.addAttribute("likeCk", "Y");
				} else {
					model.addAttribute("likeCk", "N");
				}
			} 
			// 클래스 정보
			ClassVo c = cService.selectClass(li.getReferNo());
			// 클래스 리뷰 리스트
			ArrayList<ClassReview> crList = cService.selectClassReviewList(li.getReferNo());
			// 리뷰 메인 4개 리스트 (도움순) + 리뷰 top5 (이미지)
			if(!crList.isEmpty()) {
				ArrayList<ClassReview> crMainList = cService.selectClassReviewMainList(li.getReferNo());
				model.addAttribute("crMainList", crMainList);
				
				ArrayList<ClassReview> crTopList = cService.selectClassReviewTopList(li.getReferNo());
				if(!crTopList.isEmpty()) {
					model.addAttribute("crTopList", crTopList);
				}
			}
			
			model.addAttribute("c", c);
			model.addAttribute("crList", crList);
			return "class/classDetail";
		} else {
			session.setAttribute("alertMsg", "잘못 된 접근입니다.");
			return "redirect:/";
		}
		
	}

	@RequestMapping(value="classSearchList.me")
	public String classSearchList(int cpage, String keyword, String category, String array, Model model, HttpSession session) {
		// 클래스 검색 리스트

		HashMap<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("category", category);
		map.put("array", array);
		
		int listCount = cService.classSearchListCount(map); // 조회할 리스트 갯수
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, 5, 6);
		ArrayList<ClassVo> list = cService.classSearchList(map, pi); // 조회할 리스트 목록

		/*
		if(session.getAttribute("loginUser") != null) {
			int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
			model.addAttribute("memNo", memNo);
		}
		*/
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
		model.addAttribute("array", array);
		return "class/classSearchList"; 
	}
	
	@ResponseBody
	@RequestMapping(value="likeClass.me", produces="application/json; charset=UTF-8")
	public String classLike(LikeVo li, String grade) {

		ClassLikeCk lck = new ClassLikeCk();
		
		//학생인지 아닌지부터 확인
		if(grade.equals("S")) {
			// 이미 찜한적이 있는지 확인
			int result1 = cService.checkClassLike(li);
			
			if(result1 > 0) {
				// 이미 찜한 적 있음 -> 찜 내역 삭제 후 찜 수 다시 조회
				int result2 = cService.deleteClassLike(li);
				ClassVo c = cService.selectClass(li.getReferNo());
				
				if(result2 > 0 && c != null) {
					// 삭제 완료 및 request에 담기
					lck.setMessage("dd");
					lck.setLikeCount(c.getLike());
					return new Gson().toJson(lck);
				} 
			} else {
				// 찜 한 적 없음 -> 찜 내역 추가 후 찜 수 다시 조회
				int result2 = cService.insertClassLike(li);
				ClassVo c = cService.selectClass(li.getReferNo());

				if(result2 > 0) {
					// 찜 성공 및 request에 담기
					lck.setMessage("ss");
					lck.setLikeCount(c.getLike());
					return new Gson().toJson(lck);
				} 
			}
		} else {
			lck.setMessage("gradeCkNo");
			lck.setLikeCount("0");
			return new Gson().toJson(lck);
		}
		
		lck.setMessage("ff");
		lck.setLikeCount("0");
		return new Gson().toJson(lck);
	}
	
	@RequestMapping(value="classReviewList.me")
	public String classReviewList(int cpage, int clNo, Model model) {
		// 클래스 리뷰 리스트 페이지
		
		int listCount = cService.classReviewListCount(clNo); // 조회할 리뷰 갯수
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, 5, 3);
		ArrayList<ClassReview> reviewList = cService.selectClassReviewListPaging(clNo, pi); // 클래스 리뷰 리스트(페이징 처리)
		
		model.addAttribute("pi", pi);
		model.addAttribute("reviewClNo", clNo);
		model.addAttribute("reviewList", reviewList);
		return "class/classReviewList";
	}
	
	@RequestMapping(value="classReviewDetail.me")
	public String classReviewDetail() {
		// 클래스 리뷰 디테일 이동용(뷰 확인용) 메소드
		return "class/classReviewDetail";
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
	
	
	
}
