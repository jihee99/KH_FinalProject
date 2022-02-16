package com.kh.oceanclass.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
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
	
	// 프로필 변경
	@RequestMapping("changeProfile.me")
	public String changeProfile(Member m, MultipartFile upfile, HttpSession session, Model model) {
		
		System.out.println(upfile);
		String changeName = saveFile(upfile, session);
		
		m.setProfileImg("resources/uploadFiles/" + changeName);
		
		System.out.println(m);
		int result = myService.updateProfile(m);
		System.out.println(result);
		if(result>0) {
			session.setAttribute("alertMsg", "정보 수정 완료");
			return "redirect:myProfile.me";
		}else {
			model.addAttribute("errorMsg", "정보수정실패");
			return "common/errorPage";
		}
	}
	
	 // 비밀번호 q변경
	@ResponseBody
	@RequestMapping(value="changePwd.me", produces="application/json; charset=UTF-8")
	public String ajaxChangePwd(Member m, HttpSession session, Model model) {
		//System.out.println(newPwd); 
		String newEncPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(newEncPwd);
		int result = myService.updatePwd(m);
		
		return new Gson().toJson(m);
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
	
	// 1:1문의 내역
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
	
	// 1:1 문의 검색
	@ResponseBody
	@RequestMapping(value="ajaxMyQna.me", produces="application/json; charset=UTF-8")
	public Map<String, Object> ajaxMyQna(@RequestParam(value="cpage", defaultValue="1") int currentPage, 
							Qna q, HttpSession session, Model model) {
		//System.out.println(q);
		Map<String, Object> map = new HashMap();
		
		int qnaCount = myService.myQnaCount(q);
		PageInfo pi = Pagination.getPageInfo(qnaCount, currentPage, 5, 5);
		ArrayList<Qna> list = myService.selectMyQnaList(pi, q);
		
		System.out.println(qnaCount);
		//System.out.println(currentPage);
		//System.out.println(list);
	
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).category.equals("C")) {
				list.get(i).category = "클래스";
			}else if(list.get(i).category.equals("S")) {
				list.get(i).category = "스토어";
			}else {
				list.get(i).category = "기타";
			}
		}
		
		//System.out.println(list);
		map.put("pi", pi);
		map.put("list", list);
		return map;
	}
	
	// 닉네임 중복검사
	@ResponseBody
	@RequestMapping("checkNick.me")
	public int checkNick(String nickName) {
		//System.out.println(nickName);
		int result = myService.checkNick(nickName);
		return result;
	}
	
	// 넘어온 첨부파일 그자체를 서버 폴더에 저장
	public String saveFile(MultipartFile upfile, HttpSession session) {

		String originName = upfile.getOriginalFilename(); // "flower.png"
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // 년월일시분초
		int ranNum = (int)(Math.random() * 90000 + 10000); // 5자리 랜덤값
		String ext = originName.substring(originName.lastIndexOf(".")); // ".png"
		
		String changeName = currentTime + ranNum + ext;
				
		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	// 찜한 클래스
	@RequestMapping("likeClass.me")
	public String likeClass(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		int likeClassCount = myService.likeClassCount(memNo);
		
		PageInfo pi = Pagination.getPageInfo(likeClassCount, currentPage, 5, 6);
		ArrayList<ClassVo> list = myService.selectLikeClass(pi, memNo);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "member/student/myClassLike";
	}
	
	// 클래스 후기(리뷰)
	@RequestMapping("myReview.me")
	public String myReview(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		int reviewCount = myService.classReviewCount(memNo);
		
		PageInfo pi = Pagination.getPageInfo(reviewCount, currentPage, 5, 6);
		ArrayList<ClassReview> list = myService.classReviewList(pi, memNo);
		//System.out.println(list);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "member/student/myClassReview";
	}
	
	@RequestMapping("myClassReviewDetail.me")
	public String myClassReviewDetail(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		int reviewCount = myService.classReviewCount(memNo);
		
		PageInfo pi = Pagination.getPageInfo(reviewCount, currentPage, 5, 5);
		ArrayList<ClassReview> list = myService.classReviewList(pi, memNo);
		//System.out.println(list);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "member/student/myClassReviewDetail";
	}
	
}
