package com.kh.oceanclass.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*관리자 회원관리 관련 기능*/

@Controller
public class AdminMemController {

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
		// 관리자 쿠폰 지급 페이지 확인용 메소드
		return "member/admin/adminCouponEnrollWindow";
	}

	@RequestMapping(value="cgive.ad")
	public String adminCouponManager() {
		// 관리자 포인트 지급 페이지 확인용 메소드
		return "member/admin/adminCouponWindow";
	}
	
}
