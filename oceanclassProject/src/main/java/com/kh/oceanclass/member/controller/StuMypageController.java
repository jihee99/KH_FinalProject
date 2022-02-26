package com.kh.oceanclass.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
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
import com.kh.oceanclass.Class.model.vo.ClassOrder;
import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.CsQna;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.help.model.vo.Qna;
import com.kh.oceanclass.member.model.service.MypageService;
import com.kh.oceanclass.member.model.vo.Coupon;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.StorePay;
import com.kh.oceanclass.store.model.vo.StoreReview;

@Controller
public class StuMypageController {
	
	@Autowired
	private MypageService myService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	// 메인 이동
	@RequestMapping("home.me")
	public String home() {return "/main";}


//프로필 관련	
	// 마이페이지 이동
	@RequestMapping("myPage.me")
	public String myPage(HttpSession session, Model model) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		ArrayList<ClassOrder> list = myService.selectMainMyClass(memNo);
		ArrayList<ClassVo> classLikeList = myService.selectMainLikeClass(memNo);
		ArrayList<Product> storeLikeList = myService.selectMainLikeProduct(memNo);
		
		model.addAttribute("list", list);
		model.addAttribute("classLikeList", classLikeList);
		model.addAttribute("storeLikeList", storeLikeList);
		return "member/student/mypageMain";
	}
	
	// 프로필 확인
	@RequestMapping("myProfile.me")
	public String myProfile() {return "member/student/myProfile";}
	
	// 프로필 수정폼
	@RequestMapping("formProfile.me")
	public String formProfile() {return "member/student/myProfileChange";}
	
	// 프로필 변경
	@RequestMapping("changeProfile.me")
	public String changeProfile(Member m, MultipartFile upfile, HttpSession session, Model model) {
		if(!upfile.getOriginalFilename().equals("")) {		
			String changeName = saveFile(upfile, session);
			m.setProfileImg("resources/uploadFiles/" + changeName);
		}else {				// 프로필 사진 없을 경우
			m.setProfileImg("");
		}
		int result = myService.updateProfile(m);
		Member loginUser = myService.selectUser(m);
		if(result>0) {
			session.setAttribute("loginUser", loginUser);
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
		String encPwd = ((Member)session.getAttribute("loginUser")).getUserPwd(); // db 비밀번호 암호문
		
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

	// 닉네임 중복검사
	@ResponseBody
	@RequestMapping("checkNick.me")
	public int checkNick(String nickName) {
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
	
	
	
//포인트/쿠폰페이지
	@RequestMapping("pointCoupon.me")
	public String couponList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		int couponCount = myService.selectCouponCount(memNo);
		
		PageInfo pi = Pagination.getPageInfo(couponCount, currentPage, 5, 5);
		ArrayList<Coupon> list = myService.selectCouponList(pi, memNo);
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getDedate() == null) {
				list.get(i).setDedate("무제한");
			}
		}		
		model.addAttribute("pi", pi);
		model.addAttribute("couponCount", couponCount);
		model.addAttribute("list", list);
		return "member/student/myPoint";
		
	}
	
	
	
//1:1문의 내역
	@RequestMapping("myQna.me")
	public String myQnaList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		int qnaCount = myService.selectQnaCount(memNo);
		
		PageInfo pi = Pagination.getPageInfo(qnaCount, currentPage, 10, 10);
		ArrayList<Qna> list = myService.selectQnaList(pi, memNo);
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getCategory().equals("C")) {
				list.get(i).setCategory("클래스");
			}else if(list.get(i).getCategory().equals("S")) {
				list.get(i).setCategory("스토어");
			}else {
				list.get(i).setCategory("기타");
			}
		}		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "member/student/myQna";
	}
	
	// 1:1 문의 검색
	@ResponseBody
	@RequestMapping(value="ajaxMyQna.me", produces="application/json; charset=UTF-8")
	public Map<String, Object> ajaxMyQna(@RequestParam(value="cpage", defaultValue="1") int currentPage, Qna q, Model model) {
		Map<String, Object> map = new HashMap();		
		int qnaCount = myService.myQnaCount(q);
		
		PageInfo pi = Pagination.getPageInfo(qnaCount, currentPage, 5, 5);
		ArrayList<Qna> list = myService.selectMyQnaList(pi, q);
	
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getCategory().equals("C")) {
				list.get(i).setCategory("클래스");
			}else if(list.get(i).getCategory().equals("S")) {
				list.get(i).setCategory("스토어");
			}else {
				list.get(i).setCategory("기타");
			}
		}
		map.put("pi", pi);
		map.put("list", list);
		return map;
	}
	
	
	
//클래스	
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
		int qnaCount = myService.classQnaCount(memNo);
		
		PageInfo rpi = Pagination.getPageInfo(reviewCount, currentPage, 5, 6);
		ArrayList<ClassReview> reviewList = myService.classReviewList(rpi, memNo);
		
		PageInfo qpi = Pagination.getPageInfo(reviewCount, currentPage, 5, 6);
		ArrayList<CsQna> qnaList = myService.classQnaList(qpi, memNo);

		model.addAttribute("reviewList", reviewList);
		model.addAttribute("qnaList", qnaList);
		return "member/student/myClassReview";
	}
	
	// 클래스 리뷰 디테일
	@RequestMapping("myClassReviewDetail.me")
	public String myClassReviewDetail(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();		
		int reviewCount = myService.classReviewCount(memNo);
		
		PageInfo pi = Pagination.getPageInfo(reviewCount, currentPage, 5, 5);
		ArrayList<ClassReview> list = myService.classReviewList(pi, memNo);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "member/student/myClassReviewDetail";
	}

	// 클래스 문의 디테일
	@RequestMapping("myClassQnaDetail.me")
	public String myClassQnaDetail(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();		
		int reviewCount = myService.classReviewCount(memNo);

		PageInfo pi = Pagination.getPageInfo(reviewCount, currentPage, 5, 10);
		ArrayList<CsQna> list = myService.classQnaList(pi, memNo);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "member/student/myClassQnaDetail";
	}
	
	// 내 클래스 메인
	@RequestMapping("myClass.me")
	public String myClass(HttpSession session, Model model) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		ArrayList<ClassOrder> list = myService.selectMyClass(memNo);
		
		model.addAttribute("list", list);
		return "member/student/myClass";
	}
	
	// 내 클래스 전체
	@RequestMapping("myAllClass.me")
	public String myAllClass(HttpSession session, Model model) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		ArrayList<ClassOrder> list = myService.selectMyClass(memNo);
		
		model.addAttribute("list", list);
		return "member/student/myClassDetail";
	}
	
	
	
	
//스토어	
	// 찜한 상품
	@RequestMapping("likeProduct.me")
	public String likeProduct(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		int likeProductCount = myService.likeProductCount(memNo);
		
		PageInfo pi = Pagination.getPageInfo(likeProductCount, currentPage, 5, 6);
		ArrayList<Product> list = myService.selectLikeProduct(pi, memNo);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "member/student/myShoppingLike";
	}
	
	// 상품리뷰&Qna
	@RequestMapping("myShoppingReview.me")
	public String myShoppingReview(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		Map<String, Object> map = new HashMap();
		int qnaCount = myService.shoppingQnaCount(memNo);
		int reviewCount = myService.shoppingReviewCount(memNo);
		
		PageInfo qpi = Pagination.getPageInfo(qnaCount, currentPage, 5, 6);
		ArrayList<CsQna> qnaList = myService.shoppingQnaList(qpi, memNo);
		
		PageInfo rpi = Pagination.getPageInfo(reviewCount, currentPage, 5, 6);
		ArrayList<StoreReview> reviewlist = myService.shoppingReviewList(rpi, memNo);

		model.addAttribute("qnaList", qnaList);
		model.addAttribute("reviewlist", reviewlist);
		return "member/student/myShoppingReview";
	}
	
	// 상품 Qna 디테일
	@RequestMapping("myShoppingQnaDetail.me")
	public String myShoppingQnaDetail(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		int QnaCount = myService.shoppingQnaCount(memNo);
		
		PageInfo pi = Pagination.getPageInfo(QnaCount, currentPage, 5, 10);
		ArrayList<CsQna> list = myService.shoppingQnaList(pi, memNo);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "member/student/myShoppingQnaDetail";
	}
	
	// 상품 Review 디테일
	@RequestMapping("myShoppingReviewDetail.me")
	public String myShoppingReviewDetail(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		int reviewCount = myService.shoppingQnaCount(memNo);
		
		PageInfo pi = Pagination.getPageInfo(reviewCount, currentPage, 5, 5);
		ArrayList<StoreReview> list = myService.shoppingReviewList(pi, memNo);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "member/student/myShoppingReviewDetail";
	}
	
	// 상품 주문조회 리스트
	@RequestMapping("myShopping.me")
	public String myShopping(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		int shoppingCount = myService.shoppingCount(memNo);
		
		PageInfo pi = Pagination.getPageInfo(shoppingCount, currentPage, 5, 5);
		ArrayList<StorePay> list = myService.shoppingList(pi, memNo);
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getOrderStatus().equals("1")) {
				list.get(i).setOrderStatus("주문접수");
			}else if(list.get(i).getOrderStatus().equals("2")){
				list.get(i).setOrderStatus("결제완료");
			}else if(list.get(i).getOrderStatus().equals("3")){
				list.get(i).setOrderStatus("상품준비");
			}else if(list.get(i).getOrderStatus().equals("4")){
				list.get(i).setOrderStatus("배송시작");
			}else if(list.get(i).getOrderStatus().equals("5")){
				list.get(i).setOrderStatus("배송중");
			}else if(list.get(i).getOrderStatus().equals("6")){
				list.get(i).setOrderStatus("배송완료");
			}else if(list.get(i).getOrderStatus().equals("7")){
				list.get(i).setOrderStatus("취소접수");
			}
		}
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "member/student/myShopping";
	}
	
	// 상품 주문조회
	@ResponseBody
	@RequestMapping(value="detailShopping.me", produces="application/json; charset=UTF-8")
	public String myShoppingDetail(String orderNo) {
		StorePay pay = myService.selectShopping(orderNo);
		return new Gson().toJson(pay);
	}
	
	// 상품 주문조회 기간검색
	@ResponseBody
	@RequestMapping(value="ajaxMyShopping.me", produces="application/json; charset=UTF-8")
	public String ajaxMyShopping(StorePay pay, Model model) {
		ArrayList<StorePay> list = myService.searchShoppingList(pay);
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getOrderStatus().equals("1")) {
				list.get(i).setOrderStatus("주문접수");
			}else if(list.get(i).getOrderStatus().equals("2")){
				list.get(i).setOrderStatus("결제완료");
			}else if(list.get(i).getOrderStatus().equals("3")){
				list.get(i).setOrderStatus("상품준비");
			}else if(list.get(i).getOrderStatus().equals("4")){
				list.get(i).setOrderStatus("배송시작");
			}else if(list.get(i).getOrderStatus().equals("5")){
				list.get(i).setOrderStatus("배송중");
			}else if(list.get(i).getOrderStatus().equals("6")){
				list.get(i).setOrderStatus("배송완료");
			}else if(list.get(i).getOrderStatus().equals("7")){
				list.get(i).setOrderStatus("취소접수");
			}
		}
		
		return new Gson().toJson(list);
	}
	
	// 상품 주문조회 기간검색
	@ResponseBody
	@RequestMapping(value="ajaxSearchDate.me", produces="application/json; charset=UTF-8")
	public String ajaxSearchDate(String sDate, String eDate, StorePay pay, Model model, HttpSession session) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		pay.setMemberNo(memNo);
		pay.setStartDate(sDate);
		pay.setEndDate(eDate);
		
		ArrayList<StorePay> list = myService.ajaxSearchDate(pay);
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getOrderStatus().equals("1")) {
				list.get(i).setOrderStatus("주문접수");
			}else if(list.get(i).getOrderStatus().equals("2")){
				list.get(i).setOrderStatus("결제완료");
			}else if(list.get(i).getOrderStatus().equals("3")){
				list.get(i).setOrderStatus("상품준비");
			}else if(list.get(i).getOrderStatus().equals("4")){
				list.get(i).setOrderStatus("배송시작");
			}else if(list.get(i).getOrderStatus().equals("5")){
				list.get(i).setOrderStatus("배송중");
			}else if(list.get(i).getOrderStatus().equals("6")){
				list.get(i).setOrderStatus("배송완료");
			}else if(list.get(i).getOrderStatus().equals("7")){
				list.get(i).setOrderStatus("취소접수");
			}
		}
	
		return new Gson().toJson(list);
		
	}
	
	
}
