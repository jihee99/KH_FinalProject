package com.kh.oceanclass.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping(value="classEnrollManager.ad")
	public String adminClassEnrollManager() {
		// 관리자 마이페이지 이동용(뷰 확인용) 컨트롤러
		return "member/admin/adminClassEnrollManager";
	}
	
}
