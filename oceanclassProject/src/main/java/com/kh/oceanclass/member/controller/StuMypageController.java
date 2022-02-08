package com.kh.oceanclass.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StuMypageController {

	/*
	 * 	마이페이지 기능
	 */
	
	@RequestMapping("home.me")
	public String home() {
		return "/main";
	}
	
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/student/mypageMain";
	}
	
	@RequestMapping("myProfile.me")
	public String myProfile() {
		return "member/student/myProfile";
	}
	
	@RequestMapping("myDelete.me")
	public String myDelete() {
		return "member/student/myDelete";
	}
	
}
