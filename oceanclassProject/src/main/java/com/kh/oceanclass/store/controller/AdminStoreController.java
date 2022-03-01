package com.kh.oceanclass.store.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oceanclass.store.model.service.AdminStoreService;
import com.kh.oceanclass.store.model.vo.InProductOrder;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.StoreQna;
import com.kh.oceanclass.store.model.vo.StoreReview;



/*관리자 스토어 관련 기능 처리하는 controller*/

@Controller
public class AdminStoreController {
	
	@Autowired
	private AdminStoreService asService;
	
	@RequestMapping(value="orderManager.st")
	public String orderManager(HttpSession session, Model model) {
		ArrayList<InProductOrder> list = asService.selectInProductOrderList();
		model.addAttribute("list", list);
		return "store/admin/storeOrderManager";	
	}
	
	@RequestMapping(value="productManager.st")
	public String productManager(HttpSession session, Model model) {
		ArrayList<Product> list = asService.selectProductList();
		
		model.addAttribute("list", list);
		return "store/admin/storeProductManager";	
	}
	
	@RequestMapping(value="qnaManager.st")
	public String qnaManager(HttpSession session, Model model) {
		ArrayList<StoreQna> list = asService.selectStoreQnaList();
		
		model.addAttribute("list", list);
		
		return "store/admin/storeQnaManager";	
	}
	
	@RequestMapping(value="reviewManager.st")
	public String reviewManager(HttpSession session, Model model) {
		ArrayList<StoreReview> list = asService.selectStoreReviewList();
		model.addAttribute("list", list);
		
		return "store/admin/storeReviewManager";	
	}
	

}
