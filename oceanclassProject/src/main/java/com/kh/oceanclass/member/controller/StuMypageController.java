package com.kh.oceanclass.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.help.model.vo.Qna;
import com.kh.oceanclass.member.model.service.MypageService;
import com.kh.oceanclass.member.model.vo.Coupon;
import com.kh.oceanclass.member.model.vo.Member;

@Controller
public class StuMypageController {
	
	@Autowired
	private MypageService myService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	// 메인 이동
	@RequestMapping("home.me")
	public String home() {
		return "/main";
	}
	
	// 마이페이지 이동
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/student/mypageMain";
	}
	
	// 프로필 확인
	@RequestMapping("myProfile.me")
	public String myProfile() {
		return "member/student/myProfile";
	}
	
	// 프로필 수정폼
	@RequestMapping("formProfile.me")
	public String formProfile() {
		return "member/student/myProfileChange";
	}
	
	@RequestMapping("changeProfile.me")
	public void changeProfile(Member m, MultipartFile profileImg, HttpSession session, Model model) {
		
		System.out.println(m);
		
		int result = myService.updateProfile(m);
		System.out.println(result);
	}
	
	// 회원 탈퇴폼
	@RequestMapping("myDeleteForm.me")
	public String myDelete() {
		return "member/student/myDelete";
	}
	
	// 회원 탈퇴
	@RequestMapping("myDelete.me")
	public String deleteMem(String userPwd, String userId, HttpSession session, Model model) {
		//System.out.println(userPwd);
		//System.out.println(userId);
		// db 비밀번호 암호문
		String encPwd = ((Member)session.getAttribute("loginUser")).getUserPwd();
		
		if(bcryptPasswordEncoder.matches(userPwd, encPwd)) { 
			int result = myService.deleteMem(userId);
			
			if(result>0) {
				session.removeAttribute("loginUser");
				session.setAttribute("alertMsg", "그동안 오션클래스를 이용해주셔서 감사합니다");
				return "redirect:/";
			}else {
				model.addAttribute("errorMsg", "회원탈퇴실패");
				return "common/errorPage";
			}
		}else {
			session.setAttribute("alertMsg", "잘못된 비밀번호입니다.");
			return "redirect:myDeleteForm.me";
		}
	}
	
	// 포인트/쿠폰페이지
	@RequestMapping("pointCoupon.me")
	public String couponList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		int couponCount = myService.selectCouponCount(memNo);
		
		PageInfo pi = Pagination.getPageInfo(couponCount, currentPage, 5, 5);
		ArrayList<Coupon> list = myService.selectCouponList(pi, memNo);
		//System.out.println(list);
		
		model.addAttribute("pi", pi);
		model.addAttribute("couponCount", couponCount);
		model.addAttribute("list", list);
		return "member/student/myPoint";
		
	}
	
	@RequestMapping("myQna.me")
	public String myQnaList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		int qnaCount = myService.selectQnaCount(memNo);
		//System.out.println(qnaCount);
		
		PageInfo pi = Pagination.getPageInfo(qnaCount, currentPage, 10, 10);
		ArrayList<Qna> list = myService.selectQnaList(pi, memNo);
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).category.equals("C")) {
				list.get(i).category = "클래스";
			}else if(list.get(i).category.equals("S")) {
				list.get(i).category = "스토어";
			}else {
				list.get(i).category = "기타";
			}
		}
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "member/student/myQna";
	}
	
}
