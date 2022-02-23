package com.kh.oceanclass.Class.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.oceanclass.Class.model.service.TcClassServiceImpl;
import com.kh.oceanclass.Class.model.vo.ClassVo;

@Controller
public class TcClassController {
	
	@Autowired
	private TcClassServiceImpl tcServicce;
	
	@RequestMapping("myClass.tc")
	public String myClassForm(HttpSession session) {
		return "member/teacher/myClassList";
	}
	
	// 강사 내 클래스 조회
	@RequestMapping("myClassList.tc")
	public String myClassList(Model model) {
		
		ArrayList<ClassVo> classList = tcServicce.myClassList(); // 클래스 리스트
		
		model.addAttribute("classList", classList);
		return "member/teacher/myClassList";
	}

}
