package com.kh.oceanclass.event.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("eList.ad")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		//System.out.println(currentPage);
		int listCount = aeService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 6);
		ArrayList<Event> list = aeService.selectList(pi);
		//System.out.println(list);
		mv.addObject("pi",pi).addObject("list",list).setViewName("member/admin/adminEventList");
		
		return mv;
	}
	
	@RequestMapping("eYList.ad")
	public ModelAndView statusList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = aeService.statusListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 6);
		ArrayList<Event> list = aeService.statusList(pi);
		
		mv.addObject("pi",pi).addObject("list",list).setViewName("member/admin/adminEventListY");
		
		return mv;
	}
	
	@RequestMapping("eNList.ad")
	public ModelAndView statusNList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = aeService.statusNListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 6);
		ArrayList<Event> list = aeService.statusNList(pi);
		
		mv.addObject("pi",pi).addObject("list",list).setViewName("member/admin/adminEventListN");
		
		return mv;
	}
	
	
	
}
