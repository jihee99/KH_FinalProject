package com.kh.oceanclass.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oceanclass.member.model.service.MemberService;
import com.kh.oceanclass.member.model.vo.Member;

/*마이페이지 관련 기능*/

@Controller
public class MemberController {

	
	@Autowired
	private MemberService mService;
	/*
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	*/
	
	@RequestMapping("loginForm.me")
	public String loginForm(HttpSession session) {
		
		return "member/common/logIn";
	}
	
	@RequestMapping("login.me")
	public String loginMember(Member m) {
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser == null) { 
		    System.out.println("로그인 실패");
		}else{ 
		    System.out.println("로그인 성공");
		}
		return "logIn";
	}
	
	@RequestMapping("joinUsForm.me")
	public String joinUsForm(HttpSession session) {
		
		return "member/common/joinUs";
	}
	
	@RequestMapping("insert.me")
	public void insertMember() {
		
	}
	
	@RequestMapping("idCheck.me")
	public void idCheck() {
		
	}
	
	@RequestMapping("findID.me")
	public void findID() {
		
	}
	
	@RequestMapping("findPwd.me")
	public void findPwd() {
		
	}
	
}
