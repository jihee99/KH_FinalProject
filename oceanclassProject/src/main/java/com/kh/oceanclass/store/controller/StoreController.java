package com.kh.oceanclass.store.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.oceanclass.common.model.vo.LikeVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.member.model.vo.Report;
import com.kh.oceanclass.store.model.service.StoreService;
import com.kh.oceanclass.store.model.vo.Cart;
import com.kh.oceanclass.store.model.vo.LikeItem;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.ProductOption;
import com.kh.oceanclass.store.model.vo.StoreQna;
import com.kh.oceanclass.store.model.vo.StoreReview;

/*사용자 스토어 관련 기능 처리하는 controller*/

@Controller
public class StoreController {
	
	@Autowired
	private StoreService sService;
	
	// 상품 리스트 조회 ( 스토어 메인 )
	@RequestMapping(value="storeList.st")
	public String selectList(Model model, HttpSession session) {
		
		ArrayList<Product> hlist = sService.storeHotList();
		ArrayList<Product> nlist = sService.storeNewList();
		
		model.addAttribute("hlist", hlist);
		model.addAttribute("nlist", nlist);
		
		return "store/storeContent";
	}
	
	// 스토어 검색
	@RequestMapping(value="storeSearchList.st")
	public String selectSearchList(@RequestParam(value="cpage",defaultValue="1")int currentPage, String keyword, String category, String array, Model model, HttpSession session) {
		 
		HashMap<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("category", category);
		map.put("array", array);
		
		//System.out.println(currentPage);
		int listCount = sService.selectListCount(map);
		
		int memberNo = 0;
		if(session.getAttribute("loginUser") != null) { // 로그인이 되어있을 경우 
			memberNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		}
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 8);
		ArrayList<Product> list = sService.selectList(pi, map);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
		model.addAttribute("array", array);
		
		// 포워딩할 뷰(/WEB-INF/views/ store/storeContent .jsp)
		return "store/storeSearchList";
		
	}
	
	// 상품 상세 메인
	@RequestMapping(value="productMain.pr")
	public String selectProduct(int pno, Model model, HttpSession session) {
		
		int memberNo = 0;
		if(session.getAttribute("loginUser") != null) { // 로그인이 되어있을 경우 
			memberNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		}
		
		Product p = sService.selectProduct(pno, memberNo);
		ArrayList<ProductOption> list = sService.selectProductOption(pno);
		
		// 리뷰 리스트
		ArrayList<StoreReview> srList = sService.selectStoreReviewList(pno);
		// 리뷰 메인 4개 리스트 (도움순)
		if(!srList.isEmpty()) {
			ArrayList<StoreReview> srMainList = sService.selectStoreReviewMainList(pno);
			model.addAttribute("srMainList", srMainList);
		}
		StoreReview counter = sService.selectReviewCount(pno);
		
		// 문의 리스트
		ArrayList<StoreQna> sqList = sService.selectStoreQnaList(pno);
		
		model.addAttribute("c", counter);
		model.addAttribute("p", p);
		model.addAttribute("list", list);
		model.addAttribute("sqList", sqList);
		
		return "store/productDetailMain";
	}
	
	// 찜 컨트롤러
	@ResponseBody
	@RequestMapping(value="likeStore.st", produces="application/json; charset=utf-8")
	public String likeItem(LikeVo li) {
		
		LikeItem lit = new LikeItem();
		
		// 찜한적 있는지
		int result1 = sService.likeCheck(li);
		
		if(result1 > 0) {
			// 찜한적 있음 => 찜 내역 삭제 , 찜 수 조회
			int result2 = sService.deleteLike(li);
			Product p = sService.selectProduct(li.getReferNo(), li.getMemNo());
			
			if(result2 > 0 && p != null) {
				// 삭제완료 및 request에 담기
				lit.setMessage("dd");
				lit.setLikeCount(p.getLike());
				return new Gson().toJson(lit);
			}
		}else {
			// 찜 한 적 없음 
			int result2 = sService.insertLike(li);
			Product p = sService.selectProduct(li.getReferNo(), li.getMemNo());
			
			if(result2 > 0) {
				lit.setMessage("ss");
				lit.setLikeCount(p.getLike());
				return new Gson().toJson(lit);
			}
		}
		lit.setMessage("ff");
		lit.setLikeCount("0");
		return new Gson().toJson(lit);
		
	}
	
	// 장바구니 컨트롤러
	@ResponseBody
	@RequestMapping(value="inCart.st", produces="application/json; charset=utf-8")
	public String inCart(Cart ca) {
		
		String check = "";
		
		// 장바구니에 있는지 확인
		int result1 = sService.cartCheck(ca);
		
		if(result1 > 0) { // 장바구니에 있음
			// 수량 증가
			int result2 = sService.updateCart(ca);
			
			if(result2 > 0 ) {
				// 수량 업데이트 완료 및 request에 담기
				check = "dd";
				return new Gson().toJson(check);
			}
			
		}else { // 장바구니에 없을 경우
			// 장바구니에 insert
			int result2 = sService.insertCart(ca);
			
			if(result2 > 0) {
				check = "ss";
				return new Gson().toJson(check);
			}
			
		}
		
		check = "ff";
		return new Gson().toJson(check);
	}
	/*
	// 장바구니 화면 컨트롤러
	@RequestMapping(value="cart.st")
	public String cart() {
		
		return "store/cart";
	}
	*/
	
	/*
	@RequestMapping(value="cart.st")
	public String selectCart(Model model, HttpSession session) {
		
		int memberNo = 0;
		if(session.getAttribute("loginUser") != null) { // 로그인이 되어있을 경우 
			memberNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		}
		
		ArrayList<Cart> list = sService.selectCart(memberNo);
		
		ArrayList<Product> pList = new ArrayList();
		ArrayList<ProductOption> oList = new ArrayList();
		
		System.out.println(list);
		
		for(Cart c : list) {
			pList = sService.selectCartProduct(c.getProductNo());
			oList = sService.selectCartOption(c.getOptionNo());
		}
		
		model.addAttribute("list", list);
		model.addAttribute("plist", pList);
		model.addAttribute("olist", oList);

		// 포워딩할 뷰(/WEB-INF/views/ store/storeContent .jsp)
		return "store/cart";
		
	}
	*/
	
	
	
	
	// 리뷰 조회 컨트롤러
	@RequestMapping(value="reviewList.st")
	public String reviewList(Model model, int pno, int cpage, HttpSession session) {
		
		int memberNo = 0;
		if(session.getAttribute("loginUser") != null) { // 로그인이 되어있을 경우 
			memberNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		}
		
		int listCount = sService.storeReviewListCount(pno);
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, 5, 3);
		ArrayList<StoreReview> rlist = sService.selectReviewList(pno, pi, memberNo);
		StoreReview counter = sService.selectReviewCount(pno);
		Product p = sService.selectProduct(pno, memberNo);
		ArrayList<ProductOption> olist = sService.selectProductOption(pno);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("reviewPno", pno);
		model.addAttribute("rlist", rlist);
		model.addAttribute("p", p);
		model.addAttribute("olist", olist);
		model.addAttribute("c", counter);
		
		return "store/reviewDetail";
	}
	
	@RequestMapping(value="reviewEnrollForm.st")
	public String reviewEnrollForm(int pno,/*StoreReview review, MultipartFile upfile, */HttpSession session, Model model) {
		
		model.addAttribute("pno", pno);
		
		return "store/reviewEnrollForm";
			
	}
	
	// 리뷰 작성 컨트롤러
	@ResponseBody
	@RequestMapping(value="review.pr")
	public String reviewEnrollForm(StoreReview review, MultipartFile upfile, HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			String originName = upfile.getOriginalFilename();
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/sreview/");
			try {
				upfile.transferTo(new File(savePath + originName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			review.setImg("resources/uploadFiles/sreview/" + originName);
		}

		int result = sService.insertReview(review);
		if(result > 0) {
			//session.setAttribute("alertMsg", "성공적으로 후기가 등록되었습니다!");
		} else {
			//session.setAttribute("alertMsg", "후기 등록에 실패하였습니다.");
		}
		return "<script>window.close();</script>";
	}
	
	// 리뷰 추천
	@ResponseBody
	@RequestMapping(value="recommendStore.st", produces="application/json; charset=utf-8")
	public String recommendStore(StoreReview review, HttpSession session) {
			
			int result1 = sService.checkRecommend(review);
			if(result1 > 0) {
				// 추천 한 적 있음
				int result2 = sService.deleteRecommend(review);
				if(result2 > 0) {
					//session.setAttribute("alertMsg", "해당 리뷰 추천을 제거하였습니다.");
					return new Gson().toJson("dd");
				} else {
					return new Gson().toJson("ss");
					
				}
			} else {
				// 추천 한 적 없음
				int result2 = sService.insertRecommend(review);
				if(result2 > 0) {
					//session.setAttribute("alertMsg", "해당 리뷰를 추천하였습니다!");
					return new Gson().toJson("gg");
				} else {
					//session.setAttribute("alertMsg", "리뷰 추천에 실패하였습니다.");
					return new Gson().toJson("ll");
				}
			}
	}
	
	// 신고 insert
	@ResponseBody
	@RequestMapping(value="sreviewReport.st", produces="application/json; charset=utf-8")
	public String insertReport(Report r) {
		
		int result = sService.insertReport(r);
		
		if(result > 0) { // 성공시
			return new Gson().toJson("gg");
		} else { // 실패시
			return new Gson().toJson("ll");
		}
	}
	
	// 문의상세 페이지
	@RequestMapping(value="qnaList.st")
	public String selectQnaList(int pno, int cpage, Model model, HttpSession session) {
		
		int memberNo = 0;
		int listCount = sService.storeQnaListCount(pno);
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, 5, 3);
		ArrayList<StoreQna> qlist = sService.selectPagingQnaList(pno, pi);
		Product p = sService.selectProduct(pno, memberNo);
		
		model.addAttribute("pi", pi);
		model.addAttribute("qlist", qlist);
		model.addAttribute("p", p);
		model.addAttribute("qnaPno", pno);
		
		return "store/qnaDetail";
			
	}
	
	// 문의등록 페이지 포워딩
	@RequestMapping(value="qnaEnrollForm.st")
	public String qnaEnrollForm(int pno, HttpSession session, Model model) {
		
		int memberNo = 0;
		Product p = sService.selectProduct(pno, memberNo);
		model.addAttribute("p", p);
		model.addAttribute("pno", pno);
		
		return "store/qnaEnrollForm";	
	}
	
	// 문의 insert
	@ResponseBody
	@RequestMapping(value="qna.pr")
	public String qnaEnrollForm(StoreQna qna, HttpSession session) {
		
		//System.out.println(qna);
		
		int result = sService.insertQna(qna);
		if(result > 0) {
			//session.setAttribute("alertMsg", "성공적으로 문의가 등록되었습니다!");
			return "<script>window.close();</script>";
		} else {
			//session.setAttribute("alertMsg", "문의 등록에 실패하였습니다.");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="storeQnaPwdCheck.me")
	public String StoreQnaPwdCheck(StoreQna sq) {
		//System.out.println(sq);
		int result = sService.storeQnaPwdCheck(sq);
		if(result > 0) {
			// 비밀번호 일치
			return "yyyyy";
		} else {
			// 비밀번호 불일치
			return "nnnnn";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="storeHotList.me", produces="application/json; charset=UTF-8")
	public String storeHotList() {
		ArrayList<Product> sHotList = sService.storeHotList();
		return new Gson().toJson(sHotList);
	}
	
	@ResponseBody
	@RequestMapping(value="storeNewList.me", produces="application/json; charset=UTF-8")
	public String storeNewList() {
		ArrayList<Product> sNewList = sService.storeNewList();
		return new Gson().toJson(sNewList);
	}
	
	@RequestMapping(value="storeCourier.st")
	public String selectCourier(int pno) {
		
		return "store/productDetailDelivery";
	}
	
	@RequestMapping(value="payEnrollForm.st")
	public String payEnrollForm(int pno, Model model, HttpSession session) {
		
		int memberNo = 0;
		if(session.getAttribute("loginUser") != null) { // 로그인이 되어있을 경우 
			memberNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		}
		// 상품정보, 회원정보, 옵션정보, 쿠폰정보, 포인트정보
		Product p = sService.selectProduct(pno, memberNo);
		Member m = sService.selectMember(memberNo);
		ProductOption po = sService.selectPo(pno);
		
		model.addAttribute("p", p);
		model.addAttribute("m", m);
		
		return "store/payEnrollForm";
	}
	
	// 리뷰 업데이트 페이지 포워딩
	@RequestMapping(value="reviewUpdateForm.st")
	public String reviewUpdateForm(int rno, HttpSession session, Model model) {
		
		StoreReview sr = sService.selectReview(rno);
		model.addAttribute("sr", sr);
		
		return "store/reviewUpdateForm";	
	}
	
	// 리뷰 업데이트
	@ResponseBody
	@RequestMapping(value="reviewUpdatePage.st")
	public String reviewUpdateForm(StoreReview sr, MultipartFile reupfile, HttpSession session, Model model) {

		// 새로 넘어온 파일이 있을 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			
			// 기존에 첨부파일 있을 경우 지움
			if(sr.getImg() != null) {
				new File(session.getServletContext().getRealPath(sr.getImg())).delete();
			}
			
			String originName = reupfile.getOriginalFilename();
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/sreview/");
			try {
				reupfile.transferTo(new File(savePath + originName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			sr.setImg("resources/uploadFiles/sreview/" + originName);
		}
		
		int result = sService.reviewUpdate(sr);
		if(result > 0) {
			session.setAttribute("alert", "리뷰수정이 완료되었습니다!");
			return "<script>window.close();</script>";
			
		}else { // 수정 실패 => 에러페이지
			session.setAttribute("errorMsg", "리뷰 수정 실패");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="reviewDelete.st", produces="application/json; charset=UTF-8")
	public String reviewDelete(int rno) {
		
		int result = sService.reviewDelete(rno);
		if(result > 0) { //성공
			return new Gson().toJson("ss");
		}else { // 실패
			return new Gson().toJson("ff");
		}
	}
	
	@ResponseBody
	@RequestMapping(value="qnaDelete.st", produces="application/json; charset=UTF-8")
	public String qnaDelete(StoreQna q) {
		
		int result = sService.qnaDelete(q);
		if(result > 0) { //성공
			return new Gson().toJson("ss");
		}else { // 실패
			return new Gson().toJson("ff");
		}
	}
	
	
	
}
