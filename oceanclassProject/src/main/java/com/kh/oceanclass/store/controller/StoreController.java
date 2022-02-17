package com.kh.oceanclass.store.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.oceanclass.common.model.vo.LikeVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.store.model.service.StoreService;
import com.kh.oceanclass.store.model.vo.LikeItem;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.ProductOption;

/*사용자 스토어 관련 기능 처리하는 controller*/

@Controller
public class StoreController {
	
	@Autowired
	private StoreService sService;
	
	// 상품 리스트 조회 ( 스토어 메인 )
	@RequestMapping(value="storeList.st")
	public String selectList(@RequestParam(value="cpage",defaultValue="1") int currentPage, Model model, HttpSession session) {
		 
		//System.out.println(currentPage);
		int listCount = sService.selectListCount();
		
		int memberNo = 0;
		if(session.getAttribute("loginUser") != null) { // 로그인이 되어있을 경우 
			memberNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		}
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 8);
		ArrayList<Product> list = sService.selectList(pi, memberNo);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		// 포워딩할 뷰(/WEB-INF/views/ store/storeContent .jsp)
		return "store/storeContent";
		
	}
	
	// 스토어 검색
	@RequestMapping(value="storeSearchList.st")
	public String selectSearchList(@RequestParam(value="cpage",defaultValue="1")int currentPage, Model model, HttpSession session) {
		 
		//System.out.println(currentPage);
		int listCount = sService.selectListCount();
		
		int memberNo = 0;
		if(session.getAttribute("loginUser") != null) { // 로그인이 되어있을 경우 
			memberNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		}
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 8);
		ArrayList<Product> list = sService.selectList(pi, memberNo);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		// 포워딩할 뷰(/WEB-INF/views/ store/storeContent .jsp)
		return "store/storeSearchList";
		
	}
	
	// 상품 상세 메인
	@RequestMapping(value="productMain.pr")
	public String selectProduct(int pno, Model model) {
		
		Product p = sService.selectProduct(pno);
		ArrayList<ProductOption> list = sService.selectProductOption(pno);
		
		model.addAttribute("p", p);
		model.addAttribute("list", list);
		
		return "store/productDetailMain";
	}
	
	// 카테고리, 정렬 컨트롤러
	@ResponseBody
	@RequestMapping(value="categorySearch.cs", produces="application/json; charset=utf-8")
	public String categorySearch(String category, Model model, ModelAndView mv, String memberNo, String sort) {
		
		ArrayList<Product> list = sService.categorySearch(category, memberNo, sort);
		//model.addAttribute("list", list);
		
		//mv.addObject("list", list)
		  //.setViewName("store/storeSearchList");
		
		
		return new Gson().toJson(list);
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
			Product p = sService.selectProduct(li.getReferNo());
			
			if(result2 > 0 && p != null) {
				// 삭제완료 및 request에 담기
				lit.setMessage("dd");
				lit.setLikeCount(p.getLike());
				return new Gson().toJson(lit);
			}
		}else {
			// 찜 한 적 없음 
			int result2 = sService.insertLike(li);
			Product p = sService.selectProduct(li.getReferNo());
			
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
	
	
}
