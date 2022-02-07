package com.kh.oceanclass.store.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.store.model.service.InstructorStoreService;
import com.kh.oceanclass.store.model.vo.Product;

/*강사 스토어 관련 기능 처리하는 controller*/

@Controller
public class InstructorStoreController {
	
	@Autowired
	private InstructorStoreService inStoreServie;
	
	@RequestMapping("stlist.in")
	public String selectList(@RequestParam(value="cpage",defaultValue="1") int currentPage, Model model){
		
		int listCount = inStoreServie.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 3);
		ArrayList<Product> list = inStoreServie.selectList(pi);
		
		//System.out.println("pi = "+pi);
		System.out.println("list = "+list);
		
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i).status);
			if(list.get(i).status.equals("Y")) {
				list.get(i).setStatus("게시중");
			}
			else if(list.get(i).status.equals("N")) {
				list.get(i).setStatus("승인대기중");
			}
			System.out.println(i+"번 ="+list.get(i).status);
		}
		model.addAttribute("pi",pi);
		model.addAttribute("list", list);
		return "store/instructorStoreList";
	};

}
