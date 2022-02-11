package com.kh.oceanclass.event.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.event.model.service.EventService;
import com.kh.oceanclass.event.model.vo.Event;

@Controller
public class EventController {
	
	@Autowired
	private EventService eService;

	@RequestMapping(value="eventMain.ev")
	public String eventMain(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = eService.selectEventCount();
		
		PageInfo pi  = Pagination.getPageInfo(listCount, currentPage, 5, 6);
		ArrayList<Event> list = eService.selectEventList(pi);
		//System.out.println(list);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "event/eventMain";
	}
	
	@ResponseBody
	@RequestMapping(value="ajaxSearchEvent.ev", produces="application/json; charset=UTF-8")
	public String ajaxSearchEvent(String category) {
		//System.out.println(category);
		
		ArrayList<Event> list = eService.ajaxSearchEvent(category);
		System.out.println(list);
		return new Gson().toJson(list);
	}
	
	
}
