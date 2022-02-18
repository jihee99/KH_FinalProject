package com.kh.oceanclass.help.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.help.model.service.HelpService;
import com.kh.oceanclass.help.model.vo.Faq;
import com.kh.oceanclass.help.model.vo.Notice;
import com.kh.oceanclass.help.model.vo.Qna;
import com.kh.oceanclass.member.model.vo.Member;


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
			if(list.get(i).getCategory().equals("C")) {
				list.get(i).setCategory("클래스");
			}else if(list.get(i).getCategory().equals("S")) {
				list.get(i).setCategory("스토어");
			}else {
				list.get(i).setCategory("기타");
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
			if(n.getCategory().equals("C")) {
				n.setCategory("클래스");
			}else if(n.getCategory().equals("S")) {
				n.setCategory("스토어");
			}else {
				n.setCategory("기타");
			}
			//System.out.println(n);
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
	@RequestMapping("faqMain.he")
	public String faqMain(Model model) {
		ArrayList<Faq> list = hService.selectFaqList();
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getCategory().equals("C")) {
				list.get(i).setCategory("클래스");
			}else if(list.get(i).getCategory().equals("S")) {
				list.get(i).setCategory("스토어");
			}else {
				list.get(i).setCategory("기타");
			}
		}
		model.addAttribute("list", list);
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
			if(list.get(i).getCategory().equals("C")) {
				list.get(i).setCategory("클래스");
			}else if(list.get(i).getCategory().equals("S")) {
				list.get(i).setCategory("스토어");
			}else {
				list.get(i).setCategory("기타");
			}
		}
		//System.out.println(list);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "help/qnaList";
	}
	
	@RequestMapping("qnaDetail.he")
	public String selectQna(int qno, Model model) {
		Qna q = hService.selectQna(qno);
		if(q.getCategory().equals("C")) {
			q.setCategory("클래스");
		}else if(q.getCategory().equals("S")) {
			q.setCategory("스토어");
		}else {
			q.setCategory("기타");
		}
		model.addAttribute("q", q);
		return "help/qnaDetail";
	}
	
	@RequestMapping("qnaForm.he")
	public String qnaForm() {
		return "help/qnaForm";
	}
	
	@RequestMapping("insertQna.he")
	public String insertQna(Qna q, HttpSession session, Model model) {
		
		if(q.getPwd() == null) {
			q.setPwd("");
		}
		//System.out.println(q);
		
		int result = hService.insertQna(q);
		
		if(result>0) {
			session.setAttribute("alertMsg", "게시글이 등록되었습니다");
			return "redirect:qnaList.he";
		}else {
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("searchQnaList.he")		//qna객체에 한번에 넘기는 것 보다 따로 넘기는게 깔끔
	public String searchQnaList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String option, String nickName, String category, Model model) {
		//System.out.println(q);
		if(option.equals("category")) {
			int qnaCategoryCount = hService.selectCategoryCount(category);
			//System.out.println(qnaCategoryCount);
			PageInfo pi = Pagination.getPageInfo(qnaCategoryCount, currentPage, 10, 10);
			ArrayList<Qna> list = hService.selectCategoryQnaList(pi, category);
			//System.out.println(list);
			for(int i=0; i<list.size(); i++) {
				if(list.get(i).getCategory().equals("C")) {
					list.get(i).setCategory("클래스");
				}else if(list.get(i).getCategory().equals("S")) {
					list.get(i).setCategory("스토어");
				}else {
					list.get(i).setCategory("기타");
				}
			}
			//System.out.println(list);
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("option", option);
			model.addAttribute("category", category);
			return "help/qnaList";
		}else {
			int qnaNickCount = hService.selectNickCount(nickName);
			//System.out.println(qnaNickCount);
			PageInfo pi = Pagination.getPageInfo(qnaNickCount, currentPage, 10, 10);
			ArrayList<Qna> list = hService.selectNickQnaList(pi, nickName);
			//System.out.println(list);
			for(int i=0; i<list.size(); i++) {
				if(list.get(i).getCategory().equals("C")) {
					list.get(i).setCategory("클래스");
				}else if(list.get(i).getCategory().equals("S")) {
					list.get(i).setCategory("스토어");
				}else {
					list.get(i).setCategory("기타");
				}
			}
			//System.out.println(list);
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("option", option);
			model.addAttribute("nickName", nickName);
			return "help/qnaList";
		}
		
	}
	

} // class
