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
		
		if(result > 0) { // 성공
			session.setAttribute("alertMsg", "성공적으로 이벤트 게시글이 등록 되었습니다.");
			return "redirect:eList.ad";
		}else { // 실패
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
		
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename(); // "flower.png"
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)(Math.random() * 90000 +10000); // 다섯자리 랜덤값
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
	public String endEvent(int eno, String filePath, Model model, HttpSession session) {
		
		int result = aeService.endEvent(eno);
		
		if(result > 0) {
			
			//new File(session.getServletContext().getRealPath(filePath)).delete();
			
			// 게시판 리스트 페이지 list.bo url재요청
			session.setAttribute("alertMsg", "이벤트가 종료 처리 되었습니다.");
			return "redirect:eList.ad";
		}else{
			model.addAttribute("errorMsg", "종료 실패");
			return "common/errorPage";
		}
	}
	@RequestMapping("evUpdate.ad")
	public String updateEvent(Event e, MultipartFile reupfile, HttpSession session, Model model) {
		
		// 새로 넘어온 첨부파일이 있을 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			
			//기존 첨부파일 지우기
			new File(session.getServletContext().getRealPath(e.getImg())).delete();
			
			// 새로넘어온 첨부파일 서버 업로드 시키기
			String changeName = saveFile(reupfile, session);
			// 저장경로 담기
			e.setImg("resources/uploadFiles/event/" + changeName);
			
		}
		
		int result = aeService.updateEvent(e);
		
		if(result > 0) { // 수정 성공 
			session.setAttribute("alertMsg", "이벤트 내용이 수정 되었습니다.");
			return "redirect:eList.ad";
			
		}else { // 수정 실패 
			model.addAttribute("errorMsg", "이벤트 수정 실패");
			return "common/errorPage";
		}
		
	}
	
}
