package com.kh.oceanclass.store.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.store.model.service.StoreService;
import com.kh.oceanclass.store.model.vo.Product;

/*사용자 스토어 관련 기능 처리하는 controller*/

@Controller
public class StoreController {
	
	@Autowired
	private StoreService sService;
	
	@RequestMapping(value="storeList.st")
	public String selectList(@RequestParam(value="cpage",defaultValue="1") int currentPage, Model model) {
		 
		//System.out.println(currentPage);
		int listCount = sService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 8);
		ArrayList<Product> list = sService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		// 포워딩할 뷰(/WEB-INF/views/ store/storeContent .jsp)
		return "store/storeContent";
		
	}
	
	@RequestMapping(value="storeSearchList.st")
	public String selectSearchList(@RequestParam(value="cpage",defaultValue="1") int currentPage, Model model) {
		 
		//System.out.println(currentPage);
		int listCount = sService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 8);
		ArrayList<Product> list = sService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		// 포워딩할 뷰(/WEB-INF/views/ store/storeContent .jsp)
		return "store/storeSearchList";
		
	}
	
	@RequestMapping(value="productMain.pr")
	public String selectProduct() {
		return "store/productDetailMain";
	}
}
