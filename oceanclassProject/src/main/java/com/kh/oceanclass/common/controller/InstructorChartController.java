package com.kh.oceanclass.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.oceanclass.common.model.service.InstructorChartService;
import com.kh.oceanclass.common.model.vo.InstructorQnaChart;
import com.kh.oceanclass.common.model.vo.InstructorStarChart;
import com.kh.oceanclass.store.model.vo.Product;

@Controller
public class InstructorChartController {

	@Autowired
	private InstructorChartService inService;
	
	//-------------------chart 
	@RequestMapping(value="schart.in")
	public String storeChartForm(Model model) {
		ArrayList<Product> list = inService.productList();
		System.out.println(list);
		model.addAttribute("list", list);
		return "store/instructorChartPage";
	}
	
	@ResponseBody
	@RequestMapping(value="chartMain.in", produces="application/json; charset=UTF-8")
	public Map<String, Object> mainStarChartList() {
		Map<String, Object> map = new HashMap();
		

		ArrayList<InstructorStarChart> starlist = inService.mainStarChart();
		ArrayList<InstructorQnaChart> qnalist = inService.mainQnaChart();
		System.out.println("--------------------");
		System.out.println(starlist);
		System.out.println(qnalist);
		System.out.println("--------------------");
		map.put("starlist", starlist);
		map.put("qnalist", qnalist);
		
		return map;
	}
	
	
	@ResponseBody
	@RequestMapping(value="chartAjax.in", produces="application/json; charset=UTF-8")
	public Map<String, Object> ChartList(@RequestParam(value="pno",defaultValue="0") String productNo) {
		Map<String, Object> map = new HashMap();
		System.out.println(productNo);

		ArrayList<InstructorStarChart> starlist = inService.starChartList(productNo);
		ArrayList<InstructorQnaChart> qnalist = inService.qnaChartList(productNo);
		System.out.println("--------------------");
		System.out.println(starlist);
		System.out.println(qnalist);
		System.out.println("--------------------");
		map.put("pno", productNo);
		map.put("starlist", starlist);
		map.put("qnalist", qnalist);

		
		
		return map;
	}
	
	
}
