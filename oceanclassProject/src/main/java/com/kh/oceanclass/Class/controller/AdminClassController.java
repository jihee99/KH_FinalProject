package com.kh.oceanclass.Class.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oceanclass.Class.model.service.AdminClassServiceImpl;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;

/*관리자 클래스 관련 기능 처리하는 controller*/

@Controller
public class AdminClassController {
	
	@Autowired
	private AdminClassServiceImpl acService;
	
	@RequestMapping(value="classEnrollManager.ad")
	public String adminClassEnrollManager(int cpage, String array, String category, String keyword, String clNo, Model model) {
		// 관리자 클래스 등록 관리 페이지
		
		HashMap<String, String> map = new HashMap();
		map.put("category", category);
		map.put("array", array);
		map.put("keyword", keyword);
		map.put("classNo", clNo);
		
		int listCount = acService.enrollClassListCount(map); 					// 조회할 리스트 갯수
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, 5, 5);
		ArrayList<ClassVo> cList = acService.selectEnrollClassList(map, pi);	// 조회할 리스트 목록
		if(clNo != "" ) {
			ClassVo cl = acService.selectClassDetail(clNo);
			model.addAttribute("cl", cl);
		}
		
		System.out.println("먼데?");
		
		model.addAttribute("pi", pi);
		model.addAttribute("cList", cList);
		model.addAttribute("map", map);
		return "class/admin/adminClassEnrollManager";
	}
	
	/*
	@RequestMapping(value="dateClassEnrollList.ad")
	public String dateClassEnrollList(Date before, Date after) {
		System.out.println(before);
		System.out.println(after);
		return "gg";
	}
	*/
	
	@RequestMapping(value="classApproval.ad")
	public String adminClassApproval(int clNo, int cpage, String array, String category, String keyword, HttpSession session) throws IOException {
		int result = acService.classApproval(clNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "승인 되었습니다!");
		} else {
			session.setAttribute("alertMsg", "승인에 실패하였습니다.");
		}
		return "redirect:classEnrollManager.ad?cpage=" + cpage + "&array=" + array + "&category=" + category + "&keyword=" + URLEncoder.encode(keyword, "UTF-8") + "&clNo=";
	}
	
	@RequestMapping(value="classListApproval.ad")
	public String adminClassListApproval(int[] checkList, int cpage, String array, String category, String keyword, HttpSession session) throws IOException {
		
		int result1 = 0;
		for(int clNo : checkList) {
			int result2 = acService.classApproval(clNo);
			if(result2 < 1) {
				result1 += 1;
			} 
		}
		
		if(result1 < 1) {
			session.setAttribute("alertMsg", "승인 되었습니다!");
		} else {
			session.setAttribute("alertMsg", "승인에 실패하였습니다.");
		}
		
		return "redirect:classEnrollManager.ad?cpage=" + cpage + "&array=" + array + "&category=" + category + "&keyword=" + URLEncoder.encode(keyword, "UTF-8") + "&clNo=";
	}
	
	@RequestMapping(value="classReturn.ad")
	public String classReturn(ClassVo c, int cpage, String array, String category, String keyword, HttpSession session) throws IOException {
		int result = acService.classReturn(c);
		if(result > 0) {
			session.setAttribute("alertMsg", "클래스가 반려되었습니다.");
		} else {
			session.setAttribute("alertMsg", "반려에 실패했습니다.");
		}
		return "redirect:classEnrollManager.ad?cpage=" + cpage + "&array=" + array + "&category=" + category + "&keyword=" + URLEncoder.encode(keyword, "UTF-8") + "&clNo=";
	}
	
	@RequestMapping(value="classManager.ad")
	public String adminClassManager() {
		// 관리자 클래스 관리 페이지 이동용(뷰 확인용) 메소드
		return "class/admin/adminClassManager";
	}
	
}
