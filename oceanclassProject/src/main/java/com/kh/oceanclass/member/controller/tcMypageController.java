package com.kh.oceanclass.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oceanclass.member.model.service.TcMypageService;

@Controller
public class tcMypageController {
	
	@Autowired
	private TcMypageService tcmyService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 마이페이지 이동
	@RequestMapping("myPage.tc")
	public String tcPage() {
		return "member/teacher/tcMyPage";
	}
	
}
