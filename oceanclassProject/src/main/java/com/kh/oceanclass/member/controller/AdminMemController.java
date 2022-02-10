package com.kh.oceanclass.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.member.model.service.AdminMemService;
import com.kh.oceanclass.member.model.vo.Coupon;
import com.kh.oceanclass.member.model.vo.Member;

/*관리자 회원관리 관련 기능*/

@Controller
public class AdminMemController {
	
	@Autowired
	private AdminMemService adMemService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping(value="main.ad")
	public String adminMain() {
		return "common/admin/adminMain";
	}
	
	@RequestMapping(value="loginF.ad")
	public String adminLoginForm() {
		return "common/admin/adminLogin";
	}
	
	@RequestMapping(value="login.ad")
	public ModelAndView adminLogin(Member m, HttpSession session, ModelAndView mv) {
		//System.out.println(m);

		Member loginUser = adMemService.loginAdmin(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) { 
			session.setAttribute("loginUser", loginUser);
			//System.out.println(loginUser);
			mv.setViewName("redirect:main.ad");
		}else{ 
			mv.addObject("errorMsg", "로그인실패");
			mv.setViewName("member/common/logInError");
		}
		return mv;
	}
	
	@RequestMapping(value="memlist.ad")
	public ModelAndView selectMemList(@RequestParam(value="cpage",defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = adMemService.selectMemCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Member> memlist = adMemService.selectMemList(pi);
		
		mv.addObject("pi", pi);
		mv.addObject("memlist", memlist);
		mv.setViewName("member/admin/adminMemberList");
		
		return mv;
	}

	@RequestMapping(value="sMemlist.ad")
	public ModelAndView selectSMemList(@RequestParam(value="cpage",defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = adMemService.selectSMemCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Member> memlist = adMemService.selectSMemList(pi);
		
		mv.addObject("pi", pi);
		mv.addObject("memlist", memlist);
		mv.setViewName("member/admin/adminMemberList");
		
		return mv;
	}
	
	@RequestMapping(value="tMemlist.ad")
	public ModelAndView selectTMemList(@RequestParam(value="cpage",defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = adMemService.selectTMemCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Member> memlist = adMemService.selectTMemList(pi);
		
		mv.addObject("pi", pi);
		mv.addObject("memlist", memlist);
		mv.setViewName("member/admin/adminMemberList");
		
		return mv;
	}

	
	
	@RequestMapping(value="pclist.ad")
	public ModelAndView adminCPList(@RequestParam(value="cpage",defaultValue="1") int currentCPage, @RequestParam(value="cpage",defaultValue="1") int currentPPage, ModelAndView mv) {
		int clistCount = adMemService.selectCouponCount();
		PageInfo cPi = Pagination.getPageInfo(clistCount, currentCPage, 5, 10);
		ArrayList<Coupon> clist = adMemService.selectCouponList(cPi);
		
		/*
		int plistCount = adMemService.selectPointCount();
		PageInfo pPi = Pagination.getPageInfo(plistCount, currentPPage, 5, 10);
		ArrayList<Point> plist = adMemService.selectPointList(pPi);
		*/
		mv.addObject("cPi", cPi);
		mv.addObject("clist", clist);
		
		mv.setViewName("member/admin/adminPointCouponList");
		return mv;
	}
	
	
	@RequestMapping(value="cenrollF.ad")
	public String adminCouponEnroll() {
		// 관리자 쿠폰 지급 페이지 확인용 메소드
		return "member/admin/adminCouponEnrollWindow";
	}

	@ResponseBody
	@RequestMapping(value="cenroll.ad")
	public String insertCoupon(Coupon c) {
		System.out.println(c);
		int result = adMemService.adminEnrollCoupon(c);
		return result>0? "success" : "fail";
	}

	

	@RequestMapping(value="cgive.ad")
	public String adminCouponManager(int cno) {
		// 관리자 쿠폰 발행 페이지 확인용 메소드
		System.out.println(cno);
		return "member/admin/adminCouponWindow";
	}
	
	@RequestMapping(value="pgive.ad")
	public String adminPointManager() {
		// 관리자 포인트 지급 페이지 확인용 메소드
		return "member/admin/adminPointWindow";
	}
}
