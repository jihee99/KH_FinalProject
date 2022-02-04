package com.kh.oceanclass.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemAdminController {

	@RequestMapping(value="pclist.ad")
	public String adminCPList() {
		// 관리자 포인트,쿠폰 리스트 목록 확인용 메소드
		return "member/admin/adminPointCouponList";
	}
	
	@RequestMapping(value="pgive.ad")
	public String adminPointManager() {
		// 관리자 포인트 지급 페이지 확인용 메소드
		return "member/admin/adminPointWindow";
	}
	
	@RequestMapping(value="cenroll.ad")
	public String adminCouponEnroll() {
		// 관리자 포인트 지급 페이지 확인용 메소드
		return "member/admin/adminCouponEnrollWindow";
	}

}
