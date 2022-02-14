package com.kh.oceanclass.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

	@RequestMapping("adminMain.co")
	public String adminMain() {
		return "common/admin/adminMainPage";
	}
	
	
}
