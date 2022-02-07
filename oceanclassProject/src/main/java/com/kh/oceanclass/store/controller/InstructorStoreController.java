package com.kh.oceanclass.store.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oceanclass.store.model.service.InstructorStoreService;
import com.kh.oceanclass.store.model.vo.Product;

/*강사 스토어 관련 기능 처리하는 controller*/

@Controller
public class InstructorStoreController {
	
	@Autowired
	private InstructorStoreService inStoreServie;
	
	@RequestMapping(value="stlist.in")
	public String selectList(Model model){
		ArrayList<Product> list = inStoreServie.selectList();
		return "store/instructStoreList";
	};

}
