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


@Controller
public class HelpController {
	
	@Autowired
	private HelpService hService;
	
	@RequestMapping(value="helpList.he")
	public String helpMain(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = hService.selectListCount();
		//System.out.println(currentPage);
		//System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Notice> list = hService.selectList(pi);
		// System.out.println(list);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);		
		return "help/helpList";
	}
	
	@RequestMapping(value="qnaMain.he")
	public String qnaMain() {
		return "help/qnaChoose";
	}
	
	@RequestMapping(value="qnaList.he")
	public String qnaList() {
		return "help/qnaList";
	}
	
	@RequestMapping(value="faqMain.he")
	public String faqMain() {
		return "help/faqMain";
	}
	
	

}
