package com.kh.oceanclass.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.oceanclass.common.model.service.AdminChartService;
import com.kh.oceanclass.common.model.vo.AdminStatistics;



@Controller
public class AdminChartController {

	@Autowired
	private AdminChartService adService;
	
	@RequestMapping("adminMain.ac")
	public String adminMain(Model model) {
		
		ArrayList<AdminStatistics> list = adService.selectStatistics();
		model.addAttribute("list", list);
		return "common/admin/adminMainPage";
	}
	
	@ResponseBody
	@RequestMapping(value="memChart.ad", produces="application/json; charset=UTF-8")
	public Map<String, Object> ajaxMemChart() {
		Map<String, Object> map = new HashMap();
		
		ArrayList<AdminStatistics> memList = adService.selectMemStatistics();
		ArrayList<AdminStatistics> teacherList = adService.selectTeacherStatistics();
		int classQna = adService.selectClassStatistics("C");
		int storeQna = adService.selectStoreStatistics("S");
		int etcQna = adService.selectEtcStatistics("E");
		
		map.put("memList", memList);
		map.put("teacherList", teacherList);
		map.put("classQna", classQna);
		map.put("storeQna", storeQna);
		map.put("etcQna", etcQna);
		return map;
	}
	

	
}
