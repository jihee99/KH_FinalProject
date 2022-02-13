package com.kh.oceanclass.event.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.event.model.service.AdminEventService;
import com.kh.oceanclass.event.model.vo.Event;

@Controller
public class AdminEventController {

	@Autowired
	private AdminEventService aeService;
	
	@RequestMapping("aeList.bo")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		//System.out.println(currentPage);
		int listCount = aeService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 6, 5);
		ArrayList<Event> list = aeService.selectList(pi);
		
		mv.addObject("pi",pi).addObject("list",list).setViewName("member/admin/adminEventList");
		
		return mv;
	}
	
}
