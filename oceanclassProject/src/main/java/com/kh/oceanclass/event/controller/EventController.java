package com.kh.oceanclass.event.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
import com.kh.oceanclass.member.model.vo.Coupon;

@Controller
public class EventController {
	
	@Autowired
	private EventService eService;

	@RequestMapping(value="eventMain.ev")
	public String eventMain(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		int listCount = eService.selectEventCount();
		PageInfo pi  = Pagination.getPageInfo(listCount, currentPage, 5, 6);
		ArrayList<Event> list = eService.selectEventList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "event/eventMain";
	}
	
	@ResponseBody
	@RequestMapping(value="ajaxSearchEvent.ev", produces="application/json; charset=UTF-8")
	public String ajaxSearchEvent(String category) {
		ArrayList<Event> list = eService.ajaxSearchEvent(category);
		return new Gson().toJson(list);
	}
	
	@RequestMapping("detailEvent.ev")
	public String selectEvent(int eno, Model model) {
		Event e = eService.selectEvent(eno);
		return "event/eventDetail";
	}
	
	@ResponseBody
	@RequestMapping("getCoupon.ev")
	public int ajaxCouponInsert(int memNo, int couponNo) {
		Coupon c = eService.selectCoupon(couponNo);	
		if(c.getCount() == c.getMaxCount()) {
			return -1;			// 쿠폰 소진일 경우
		}else {
			c.setMemNo(memNo);
			int couponHistoryMem = eService.couponHistoryMem(c);
			if(couponHistoryMem > 0) {
				return 0;		// 이미 발급받은 쿠폰일 경우
			}else {
				int result = eService.insertCoupon(c);
				if(result>0) {
					int countCouponResult = eService.countCoupon(couponNo);
					return 1;	// 쿠폰 발급된 경우
				} else {
					return -2;	// 쿠폰 발급 실패한 경우
				}
			}
		}
		
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
		return result>0 ? "1" : "0";
	}
	
	@RequestMapping("tagSelect.ev")
	public String tagSelect(@RequestParam(value="cpage", defaultValue="1") int currentPage, String hashtag, Model model) {
		String selectTag = hashtag;
		int listCount = eService.tagSelectCount(hashtag);
		PageInfo pi  = Pagination.getPageInfo(listCount, currentPage, 5, 6);
		ArrayList<ClassVo> list = eService.tagSelectList(pi, hashtag);
		
		model.addAttribute("selectTag", selectTag);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "event/tagSelectResult";
	}
	
	
}
