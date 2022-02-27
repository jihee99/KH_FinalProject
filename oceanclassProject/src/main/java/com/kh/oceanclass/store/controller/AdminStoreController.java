package com.kh.oceanclass.store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oceanclass.store.model.vo.StoreReview;

/*관리자 스토어 관련 기능 처리하는 controller*/

@Controller
public class AdminStoreController {
	
	@RequestMapping(value="orderManager.st")
	public String orderManager(HttpSession session, Model model) {
		
		
		return "store/storeOrderManager";	
	}
	
	@RequestMapping(value="productManager.st")
	public String productManager(HttpSession session, Model model) {
		
		
		return "store/storeProductManager";	
	}
	
	@RequestMapping(value="qnaManager.st")
	public String qnaManager(HttpSession session, Model model) {
		
		
		return "store/storeQnaManager";	
	}
	
	@RequestMapping(value="reviewManager.st")
	public String reviewManager(HttpSession session, Model model) {
		
		
		return "store/storeReviewManager";	
	}
	

}
