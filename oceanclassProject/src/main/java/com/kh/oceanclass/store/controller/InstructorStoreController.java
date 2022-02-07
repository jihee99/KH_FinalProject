package com.kh.oceanclass.store.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.store.model.service.InstructorStoreService;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.ProductOption;

/*강사 스토어 관련 기능 처리하는 controller*/

@Controller
public class InstructorStoreController {
	
	@Autowired
	private InstructorStoreService inStoreService;
	
	@RequestMapping("stlist.in")
	public String selectList(@RequestParam(value="cpage",defaultValue="1") int currentPage, Model model){
		
		int listCount = inStoreService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 1);
		ArrayList<Product> list = inStoreService.selectList(pi);
		
		//System.out.println("pi = "+pi);
		//System.out.println("list = "+list);
		
		model.addAttribute("pi",pi);
		model.addAttribute("list", list);
		return "store/instructorStoreList";
	};
	
	@RequestMapping("stenrollF.in")
	public String enrollForm() {
		return "store/instructorStoreEnrollPage";
	}
	
	@RequestMapping(value="stenroll.in", produces="application/json; charset=UTF-8")
	public void insertProduct(Product p, ProductOption op, MultipartFile[] upfile, HttpSession session, Model model) {
		System.out.println(p);
		System.out.println(op); 
		System.out.println(upfile);
	}
	
	
	@RequestMapping("stdetail.in")
	public String selectProduct(int pno, Model model) {
		Product p = inStoreService.selectProduct(pno);
		System.out.println(pno);
		System.out.println(p);
		model.addAttribute("p", p);
		return "store/instructorStoreUpdate";
	}
	
	@RequestMapping("stupdateF.in")
	public void updateProduct(int pno, Model model) {
		System.out.println(pno);
	}

}
