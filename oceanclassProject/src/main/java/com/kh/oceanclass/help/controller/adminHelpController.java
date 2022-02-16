package com.kh.oceanclass.help.controller;

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
import com.kh.oceanclass.event.model.vo.Event;
import com.kh.oceanclass.help.model.service.adminHelpService;
import com.kh.oceanclass.help.model.vo.Faq;
import com.kh.oceanclass.help.model.vo.Notice;
import com.kh.oceanclass.help.model.vo.Qna;


@Controller
public class adminHelpController {
	
	@Autowired
	private adminHelpService ahService;
	
	@RequestMapping("noticeList.ad")
	public ModelAndView selectNtListCount(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = ahService.selectNtListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Notice> list = ahService.selectNtList(pi);
		//System.out.println(list);
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).category.equals("C")) {
				list.get(i).category = "클래스";
			}else if(list.get(i).category.equals("S")) {
				list.get(i).category = "스토어";
			}else if(list.get(i).category.equals("T")) {
				list.get(i).category = "강사";
			}else {
				list.get(i).category = "기타";
			}
		}
		
		mv.addObject("pi",pi).addObject("list",list).setViewName("member/admin/adminNoticeList");
		
		return mv;
	}
	@RequestMapping("noticeEnrollForm.ad")
	public String noticeEnrollForm() {
		
		return "member/admin/adminNoticeEnroll";
	}
	@RequestMapping("insertNotice.ad")
	public String insertNotice(Notice n, MultipartFile upfile, HttpSession session, Model model) {
		
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			
			n.setImg("resources/uploadFiles/help/" + changeName);
		}
		
		int result = ahService.insertNotice(n);
		
		if(result > 0) { // 성공
			session.setAttribute("alertMsg", "성공적으로 공지사항 게시글이 등록 되었습니다.");
			return "redirect:noticeList.ad";
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
		
		String savePath = session.getServletContext().getRealPath("resources/uploadFiles/help/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	@RequestMapping("noticeDetail.ad")
	public String selectNotice(int nno, Model model) {
		
			Notice n = ahService.selectNotice(nno);
			model.addAttribute("n", n);
			//System.out.println(n);
			return "member/admin/adminNoticeUpdate";
		
	}
	@RequestMapping("noticeDelete.ad")
	public String deleteNotice(int nno, String filePath, Model model, HttpSession session) {
		
		int result = ahService.deleteNotice(nno);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "공지사항이 삭제 되었습니다.");
			return "redirect:noticeList.ad";
		}else{
			model.addAttribute("errorMsg", "삭제 실패");
			return "common/errorPage";
		}
	}
	@RequestMapping("noticeUpdate.ad")
	public String updateNotice(Notice n, MultipartFile reupfile, HttpSession session, Model model) {
		
		// 새로 넘어온 첨부파일이 있을 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			
			//기존 첨부파일 지우기
			new File(session.getServletContext().getRealPath(n.getImg())).delete();
			
			// 새로넘어온 첨부파일 서버 업로드 시키기
			String changeName = saveFile(reupfile, session);
			// 저장경로 담기
			n.setImg("resources/uploadFiles/help/" + changeName);
			
		}
		
		int result = ahService.updateNotice(n);
		
		if(result > 0) { // 수정 성공 
			session.setAttribute("alertMsg", "공지사항 내용이 수정 되었습니다.");
			return "redirect:noticeList.ad";
			
		}else { // 수정 실패 
			model.addAttribute("errorMsg", "공지사항 수정 실패");
			return "common/errorPage";
		}
		
	}

} 