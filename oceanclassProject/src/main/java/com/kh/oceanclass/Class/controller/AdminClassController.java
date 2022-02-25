package com.kh.oceanclass.Class.controller;

import java.sql.Date;
import java.util.ArrayList;

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
	public String adminClassEnrollManager(int cpage, int array, String category, String keyword, Model model) {
		// 관리자 클래스 등록 관리 페이지
		
		// 키워드랑 카테 생기면서 array String으로 바꿔야하는지?
		
		int listCount = acService.enrollClassListCount(); 				// 조회할 리스트 갯수
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, 5, 5);
		ArrayList<ClassVo> cList = acService.selectEnrollClassList(array, pi);	// 조회할 리스트 목록
		
		model.addAttribute("pi", pi);
		model.addAttribute("cList", cList);
		model.addAttribute("array", array);
		return "class/admin/adminClassEnrollManager";
	}
	
	@RequestMapping(value="dateClassEnrollList.ad")
	public String dateClassEnrollList(Date before, Date after) {
		System.out.println(before);
		System.out.println(after);
		return "gg";
	}
	
	@RequestMapping(value="classManager.ad")
	public String adminClassManager() {
		// 관리자 클래스 관리 페이지 이동용(뷰 확인용) 메소드
		return "class/admin/adminClassManager";
	}
	
}
