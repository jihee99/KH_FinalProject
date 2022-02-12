package com.kh.oceanclass.member.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.oceanclass.member.model.service.MemberService;
import com.kh.oceanclass.member.model.service.SmsService;
import com.kh.oceanclass.member.model.vo.Member;

/*마이페이지 관련 기능*/

@Controller
public class MemberController {

	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("loginForm.me")
	public String loginForm(HttpSession session) {
		
		return "member/common/logIn";
	}
	
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) { 
			session.setAttribute("loginUser", loginUser);
			//System.out.println(loginUser);
			mv.setViewName("redirect:/");
		}else{ 
			mv.addObject("errorMsg", "로그인실패");
			mv.setViewName("member/common/logInError");
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
	public String insertMember(Member m, Model model, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPwd);
		
		int result = mService.insertMember(m);
		
		if(result > 0) { // 성공=> 메인페이지 url재요청
					
			//session.setAttribute("alertMsg", "회원가입 성공");
			return "member/common/joinSuccess";
					
		}else {// 실패=> 에러문구 담아서 에러페이지 포워딩
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage";
		}
	}
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		int count = mService.idCheck(checkId);
		
		return count > 0 ? "NNNNN" : "NNNNY";
	}
	@ResponseBody
	@RequestMapping("nickCheck.me")
	public String nickCheck(String nickCheck) {
		int count = mService.nickCheck(nickCheck);
		
		return count > 0 ? "NNNN" : "NNNY";
	}
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET) 
	@ResponseBody 
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기 
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성 
		
		SmsService.certifiedPhoneNumber(userPhoneNumber,randomNumber); 
		
		return Integer.toString(randomNumber); 
		
	}
	@RequestMapping("findIDForm.me")
	public String findIDForm(HttpSession session) {
		
		return "member/common/findlogin";
	}

	@RequestMapping("findID.me")
	public ModelAndView findID(Member m, ModelAndView mv, HttpSession session) {
		Member loginUser = mService.findId(m);
		System.out.println(loginUser);
		if(loginUser != null) { 
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("member/common/findloginSuccess");
		}else{ 
			mv.setViewName("member/common/findloginError");
		}
		return mv;
	}
	@RequestMapping("findPwdForm.me")
	public String findPwdForm(HttpSession session) {
		
		return "member/common/findPassword";
	}
	
	@RequestMapping("findPwd.me")
	public void findPwd() {
		
	}
	
}
