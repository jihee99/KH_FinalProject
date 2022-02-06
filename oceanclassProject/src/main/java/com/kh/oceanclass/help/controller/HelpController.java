package com.kh.oceanclass.help.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.help.model.service.HelpService;
import com.kh.oceanclass.help.model.vo.Notice;
import com.kh.oceanclass.help.model.vo.Qna;


@Controller
public class HelpController {
	
	@Autowired
	private HelpService hService;
	
	/*
	 * 	공지사항 관련 메소드
	 */
	@RequestMapping("helpList.he")
	public String helpMain(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = hService.selectListCount();
		//System.out.println(currentPage);
		//System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Notice> list = hService.selectList(pi);
		// System.out.println(list);
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).category.equals("C")) {
				list.get(i).category = "클래스";
			}else if(list.get(i).category.equals("S")) {
				list.get(i).category = "스토어";
			}else {
				list.get(i).category = "기타";
			}
		}
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);		
		return "help/helpList";
	}
	
	@RequestMapping("detail.he")
	public String selectNotice(int nno, Model model) {
		int result = hService.increaseCount(nno);
		//System.out.println(result);
		
		if(result>0){
			Notice n = hService.selectNotice(nno);
			if(n.category.equals("C")) {
				n.category = "클래스";
			}else if(n.category.equals("S")) {
				n.category = "스토어";
			}else {
				n.category = "기타";
			}
			model.addAttribute("n", n);
			return "help/helpDetail";
		}else {
			model.addAttribute("errorMsg", "게시글 로딩 실패");
			return "common/errorPage";
		}
	}
	
	/*
	 * 	faq 관련 메소드
	 */
	@RequestMapping(value="faqMain.he")
	public String faqMain() {
		return "help/faqMain";
	}
	
	
	/*
	 * 	1:1 문의 관련 메소드
	 */
	@RequestMapping(value="qnaMain.he")
	public String qnaMain() {
		return "help/qnaChoose";
	}
	
	@RequestMapping("qnaList.he")
	public String qnaList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int qnaCount = hService.selectQnaCount();
		//System.out.println(qnaCount);
		
		PageInfo pi = Pagination.getPageInfo(qnaCount, currentPage, 10, 10);
		ArrayList<Qna> list = hService.selectQnaList(pi);
		//System.out.println(list);
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).category.equals("C")) {
				list.get(i).category = "클래스";
			}else if(list.get(i).category.equals("S")) {
				list.get(i).category = "스토어";
			}else {
				list.get(i).category = "기타";
			}
		}
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "help/qnaList";
	}

} // class
