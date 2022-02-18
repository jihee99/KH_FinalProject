package com.kh.oceanclass.event.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.model.vo.Reply;
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
		//System.out.println(list);
		return new Gson().toJson(list);
	}
	
	@RequestMapping("detailEvent.ev")
	public String selectEvent(int eno, Model model) {
		//System.out.println(eno);
		Event e = eService.selectEvent(eno);
		//System.out.println(e);
		//System.out.println(list);
		model.addAttribute("e", e);
		return "event/eventDetail";
	}
	
	
	@ResponseBody
	@RequestMapping(value="replyList.ev", produces="application/json; charset=utf-8")
	public String ajaxSelectReplyList(int contentNo) {
		ArrayList<Reply> list = eService.selectReplyList(contentNo);
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("replyInsert.ev")
	public String ajaxreplyInsert(Reply r) {
		int result = eService.insertReply(r);
		//System.out.println(result);
		return result>0 ? "1" : "0";
	}
	
	@RequestMapping("tagSelect.ev")
	public String tagSelect(@RequestParam(value="cpage", defaultValue="1") int currentPage, String hashtag, Model model) {
//		System.out.println(hashtag);
		String selectTag = hashtag;
		int listCount = eService.tagSelectCount(hashtag);
		PageInfo pi  = Pagination.getPageInfo(listCount, currentPage, 5, 6);
		ArrayList<ClassVo> list = eService.tagSelectList(pi, hashtag);
//		System.out.println(listCount);
//		System.out.println(list);
		
		model.addAttribute("selectTag", selectTag);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "event/tagSelectResult";
	}
	
	
}
