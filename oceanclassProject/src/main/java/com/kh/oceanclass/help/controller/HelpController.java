package com.kh.oceanclass.help.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelpController {
	
	@RequestMapping(value="helpMain.he")
	public String helpMain() {
		return "help/helpList";
	}
	
	@RequestMapping(value="qnaMain.he")
	public String qnaMain() {
		return "help/qnaChoose";
	}
	
	@RequestMapping(value="qnaList.he")
	public String qnaList() {
		return "help/qnaList";
	}
	
	@RequestMapping(value="faqMain.he")
	public String faqMain() {
		return "help/faqMain";
	}
	
	

}
