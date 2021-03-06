package com.kh.oceanclass.event.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.event.model.service.AdminEventService;
import com.kh.oceanclass.event.model.vo.Event;

@Controller
public class AdminEventController {

	@Autowired
	private AdminEventService aeService;
	
	@RequestMapping("eList.ad")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		//System.out.println(currentPage);
		int listCount = aeService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 6);
		ArrayList<Event> list = aeService.selectList(pi);
		//System.out.println(list);
		mv.addObject("pi",pi).addObject("list",list).setViewName("member/admin/adminEventList");
		
		return mv;
	}
	
	@RequestMapping("eYList.ad")
	public ModelAndView statusList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = aeService.statusListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 6);
		ArrayList<Event> list = aeService.statusList(pi);
		
		mv.addObject("pi",pi).addObject("list",list).setViewName("member/admin/adminEventListY");
		
		return mv;
	}
	
	@RequestMapping("eNList.ad")
	public ModelAndView statusNList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = aeService.statusNListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 6);
		ArrayList<Event> list = aeService.statusNList(pi);
		
		mv.addObject("pi",pi).addObject("list",list).setViewName("member/admin/adminEventListN");
		
		return mv;
	}
	@RequestMapping("evEnrollForm.ad")
	public String evEnrollForm() {
		
		return "member/admin/adminEventEnroll";
	}
	@RequestMapping("evInsert.ad")
	public String insertEvent(Event e, MultipartFile upfile, HttpSession session, Model model) {
		System.out.println(upfile);
		String changeName = saveFile(upfile, session);
		System.out.println(changeName);
		e.setImg("resources/uploadFiles/event/" + changeName);
		
		int result = aeService.insertEvent(e);
		
		if(result > 0) { // ??????
			session.setAttribute("alertMsg", "??????????????? ????????? ???????????? ?????? ???????????????.");
			return "redirect:eList.ad";
		}else { // ??????
			model.addAttribute("errorMsg", "????????? ?????? ??????");
			return "common/errorPage";
		}
		
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename(); // "flower.png"
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)(Math.random() * 90000 +10000); // ???????????? ?????????
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("resources/uploadFiles/event/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	@RequestMapping("evDetail.ad")
	public String selectEvent(int eno, Model model) {
		
			Event e = aeService.selectEvent(eno);
			model.addAttribute("e", e);
			//System.out.println(e);
			return "member/admin/adminEventUpdate";
		
	}
	@RequestMapping("evEnd.ad")
	public String endEvent(int eventNo, String filePath, Model model, HttpSession session) {
		
		int result = aeService.endEvent(eventNo);
		
		if(result > 0) {
			
			//new File(session.getServletContext().getRealPath(filePath)).delete();
			
			// ????????? ????????? ????????? list.bo url?????????
			session.setAttribute("alertMsg", "???????????? ?????? ?????? ???????????????.");
			return "redirect:eList.ad";
		}else{
			model.addAttribute("errorMsg", "?????? ??????");
			return "common/errorPage";
		}
	}
	@RequestMapping("evUpdate.ad")
	public String updateEvent(Event e, MultipartFile reupfile, HttpSession session, Model model) {
		
		// ?????? ????????? ??????????????? ?????? ??????
		if(!reupfile.getOriginalFilename().equals("")) {
			
			//?????? ???????????? ?????????
			new File(session.getServletContext().getRealPath(e.getImg())).delete();
			
			// ??????????????? ???????????? ?????? ????????? ?????????
			String changeName = saveFile(reupfile, session);
			// ???????????? ??????
			e.setImg("resources/uploadFiles/event/" + changeName);
			
		}
		
		int result = aeService.updateEvent(e);
		
		if(result > 0) { // ?????? ?????? 
			session.setAttribute("alertMsg", "????????? ????????? ?????? ???????????????.");
			return "redirect:eList.ad";
			
		}else { // ?????? ?????? 
			model.addAttribute("errorMsg", "????????? ?????? ??????");
			return "common/errorPage";
		}
		
	}
	
}
