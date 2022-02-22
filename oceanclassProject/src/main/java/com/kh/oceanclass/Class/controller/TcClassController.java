package com.kh.oceanclass.Class.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TcClassController {
	
	@RequestMapping("myClass.tc")
	public String myClassForm(HttpSession session) {
		return "member/teacher/myClassList";
	}
	
	@RequestMapping("myClassList.tc")
	

}
