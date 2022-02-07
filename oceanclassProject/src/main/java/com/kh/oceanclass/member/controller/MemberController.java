package com.kh.oceanclass.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oceanclass.member.model.service.MemberService;

/*마이페이지 관련 기능*/

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("login.me")
	public void loginMember() {
		
	}
	
	@RequestMapping("insert.me")
	public void insertMember() {
		
	}
	
	@RequestMapping("idCheck.me")
	public void idCheck() {
		
	}
	
	
	
}
