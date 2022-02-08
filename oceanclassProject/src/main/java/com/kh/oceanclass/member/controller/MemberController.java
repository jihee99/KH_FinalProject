package com.kh.oceanclass.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser == null) { 
			mv.addObject("errorMsg", "로그인실패");
			mv.setViewName("member/common/logInError");
		}else{ 
			session.setAttribute("loginUser", loginUser);
			//System.out.println(loginUser);
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	@RequestMapping("logout.me")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
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
