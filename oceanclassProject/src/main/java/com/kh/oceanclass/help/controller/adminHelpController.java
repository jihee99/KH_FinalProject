package com.kh.oceanclass.help.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

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
	
	// 공지사항
	
	@RequestMapping("noticeList.ad")
	public ModelAndView selectNtListCount(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = ahService.selectNtListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Notice> list = ahService.selectNtList(pi);
		//System.out.println(list);
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getCategory().equals("C")) {
				list.get(i).setCategory("클래스");
			}else if(list.get(i).getCategory().equals("S")) {
				list.get(i).setCategory("스토어");
			}else if(list.get(i).getCategory().equals("T")) {
				list.get(i).setCategory("강사");
			}else {
				list.get(i).setCategory("기타");
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
	
	@RequestMapping("noticeSearch.ad")
	public String searchNtList(int cpage, String keyword, String category, Model model, HttpSession session) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("category", category);
		
		int listScCount = ahService.searchNtListCount(map);
		PageInfo pi = Pagination.getPageInfo(listScCount, cpage, 5, 10);
		ArrayList<Notice> list = ahService.searchNtList(pi, map);
		//System.out.println(list);
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getCategory().equals("C")) {
				list.get(i).setCategory("클래스");
			}else if(list.get(i).getCategory().equals("S")) {
				list.get(i).setCategory("스토어");
			}else if(list.get(i).getCategory().equals("T")) {
				list.get(i).setCategory("강사");
			}else {
				list.get(i).setCategory("기타");
			}
		}
		
		model.addAttribute("category",category).addAttribute("keyword",keyword).addAttribute("pi",pi).addAttribute("list",list);
		//System.out.println(category);
		//System.out.println(keyword);
		return "member/admin/adminNoticeList";
	}
	
	
	@RequestMapping("noticeDateSearch.ad")
	public String dateSearchNtList(int cpage, String toDate, String fromDate, Model model, HttpSession session) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("toDate", toDate);
		map.put("fromDate", fromDate);
		
		int listScCount = ahService.dateSearchNtListCount(map);
		PageInfo pi = Pagination.getPageInfo(listScCount, cpage, 5, 10);
		ArrayList<Notice> list = ahService.dateSearchNtList(pi, map);
		//System.out.println(list);
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getCategory().equals("C")) {
				list.get(i).setCategory("클래스");
			}else if(list.get(i).getCategory().equals("S")) {
				list.get(i).setCategory("스토어");
			}else if(list.get(i).getCategory().equals("T")) {
				list.get(i).setCategory("강사");
			}else {
				list.get(i).setCategory("기타");
			}
		}
		
		model.addAttribute("toDate",toDate).addAttribute("fromDate",fromDate).addAttribute("pi",pi).addAttribute("list",list);
		//System.out.println(toDate);
		//System.out.println(fromDate);
		return "member/admin/adminNoticeList";
	}
	// faq 
	
	@RequestMapping("faqList.ad")
	public ModelAndView selectFaqListCount(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = ahService.selectFaqListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Faq> list = ahService.selectFaqList(pi);
		//System.out.println(list);
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getCategory().equals("C")) {
				list.get(i).setCategory("클래스");
			}else if(list.get(i).getCategory().equals("S")) {
				list.get(i).setCategory("스토어");
			}else {
				list.get(i).setCategory("기타");
			}
		}
		
		mv.addObject("pi",pi).addObject("list",list).setViewName("member/admin/adminFAQList");
		
		return mv;
	}
	@RequestMapping("faqEnrollForm.ad")
	public String faqEnrollForm() {
		
		return "member/admin/adminFAQEnroll";
	}
	@RequestMapping("insertFaq.ad")
	public String insertFaq(Faq f, HttpSession session, Model model) {
		
		int result = ahService.insertFaq(f);
		
		if(result > 0) { // 성공
			session.setAttribute("alertMsg", "성공적으로 FAQ 게시글이 등록 되었습니다.");
			return "redirect:faqList.ad";
		}else { // 실패
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
		
	}
	@RequestMapping("faqDetail.ad")
	public String selectFaq(int fno, Model model) {
		
			Faq f = ahService.selectFaq(fno);
			model.addAttribute("f", f);
			//System.out.println(n);
			return "member/admin/adminFAQUpdate";
		
	}
	@RequestMapping("faqDelete.ad")
	public String deleteFaq(int fno, Model model, HttpSession session) {
		
		int result = ahService.deleteFaq(fno);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "FAQ 게시글이 삭제 되었습니다.");
			return "redirect:faqList.ad";
		}else{
			model.addAttribute("errorMsg", "삭제 실패");
			return "common/errorPage";
		}
	}
	@RequestMapping("faqUpdate.ad")
	public String updateFaq(Faq f, HttpSession session, Model model) {
		
		int result = ahService.updateFaq(f);
		
		if(result > 0) { // 수정 성공 
			session.setAttribute("alertMsg", "FAQ 내용이 수정 되었습니다.");
			return "redirect:faqList.ad";
			
		}else { // 수정 실패 
			model.addAttribute("errorMsg", "공지사항 수정 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("faqSearch.ad")
	public String searchFaqList(int cpage, String keyword, String category, Model model, HttpSession session) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("category", category);
		
		int listCount = ahService.searchFaqListCount(map);
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, 5, 10);
		ArrayList<Faq> list = ahService.searchFaqList(pi, map);
		//System.out.println(list);
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getCategory().equals("C")) {
				list.get(i).setCategory("클래스");
			}else if(list.get(i).getCategory().equals("S")) {
				list.get(i).setCategory("스토어");
			}else {
				list.get(i).setCategory("기타");
			}
		}
		
		model.addAttribute("category",category).addAttribute("keyword",keyword).addAttribute("pi",pi).addAttribute("list",list);
		System.out.println(category);
		System.out.println(keyword);
		return "member/admin/adminFAQList";
	}
	
	@RequestMapping("faqDateSearch.ad")
	public String dateSearchFaqList(int cpage, String toDate, String fromDate, Model model, HttpSession session) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("toDate", toDate);
		map.put("fromDate", fromDate);
		
		int listScCount = ahService.dateSearchFaqListCount(map);
		PageInfo pi = Pagination.getPageInfo(listScCount, cpage, 5, 10);
		ArrayList<Faq> list = ahService.dateSearchFaqList(pi, map);
		//System.out.println(list);
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getCategory().equals("C")) {
				list.get(i).setCategory("클래스");
			}else if(list.get(i).getCategory().equals("S")) {
				list.get(i).setCategory("스토어");
			}else {
				list.get(i).setCategory("기타");
			}
		}
		
		model.addAttribute("toDate",toDate).addAttribute("fromDate",fromDate).addAttribute("pi",pi).addAttribute("list",list);
		//System.out.println(toDate);
		//System.out.println(fromDate);
		return "member/admin/adminFAQList";
	}
	
	// Qna

	@RequestMapping("qnaList.ad")
	public ModelAndView selectQnaListCount(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = ahService.selectQnaListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Qna> list = ahService.selectQnaList(pi);
		//System.out.println(list);
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getCategory().equals("C")) {
				list.get(i).setCategory("클래스");
			}else if(list.get(i).getCategory().equals("S")) {
				list.get(i).setCategory("스토어");
			}else {
				list.get(i).setCategory("기타");
			}
		}
		
		mv.addObject("pi",pi).addObject("list",list).setViewName("member/admin/admin1to1List");
		
		return mv;
	}
	@RequestMapping("qnaEnrollForm.ad")
	public String qnaEnrollForm() {
		
		return "member/admin/admin1to1Enroll";
	}
	@RequestMapping("insertQna.ad")
	public String insertQna(Qna q, HttpSession session, Model model) {
		
		int result = ahService.insertQna(q);
		
		if(result > 0) { // 성공
			session.setAttribute("alertMsg", "성공적으로 답변이 등록/수정 되었습니다.");
			return "redirect:qnaList.ad";
		}else { // 실패
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
		
	}
	@RequestMapping("qnaDetail.ad")
	public String selectQna(int qno, Model model) {
		
			Qna q = ahService.selectQna(qno);
			if(q.getCategory().equals("C")) {
				q.setCategory("클래스");
			}else if(q.getCategory().equals("S")) {
				q.setCategory("스토어");
			}else {
				q.setCategory("기타");
			}
			model.addAttribute("q", q);
			return "member/admin/admin1to1Enroll";
		
	}
	@RequestMapping("qnaDelete.ad")
	public String deleteQna(int qno, Model model, HttpSession session) {
		
		int result = ahService.deleteQna(qno);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "문의글이 삭제 되었습니다.");
			return "redirect:faqList.ad";
		}else{
			model.addAttribute("errorMsg", "삭제 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("qnaSearch.ad")
	public String searchQnaList(int cpage, String keyword, String category, Model model, HttpSession session) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("category", category);
		
		int listCount = ahService.searchQnaListCount(map);
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, 5, 10);
		ArrayList<Qna> list = ahService.searchQnaList(pi, map);
		//System.out.println(list);
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getCategory().equals("C")) {
				list.get(i).setCategory("클래스");
			}else if(list.get(i).getCategory().equals("S")) {
				list.get(i).setCategory("스토어");
			}else {
				list.get(i).setCategory("기타");
			}
		}
		
		model.addAttribute("category",category).addAttribute("keyword",keyword).addAttribute("pi",pi).addAttribute("list",list);
		//System.out.println(category);
		//System.out.println(keyword);
		return "member/admin/admin1to1List";
	}
	
	@RequestMapping("qnaDateSearch.ad")
	public String dateSearchQnaList(int cpage, String toDate, String fromDate, Model model, HttpSession session) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("toDate", toDate);
		map.put("fromDate", fromDate);
		
		int listScCount = ahService.dateSearchQnaListCount(map);
		PageInfo pi = Pagination.getPageInfo(listScCount, cpage, 5, 10);
		ArrayList<Qna> list = ahService.dateSearchQnaList(pi, map);
		//System.out.println(list);
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getCategory().equals("C")) {
				list.get(i).setCategory("클래스");
			}else if(list.get(i).getCategory().equals("S")) {
				list.get(i).setCategory("스토어");
			}else {
				list.get(i).setCategory("기타");
			}
		}
		
		model.addAttribute("toDate",toDate).addAttribute("fromDate",fromDate).addAttribute("pi",pi).addAttribute("list",list);
		//System.out.println(toDate);
		//System.out.println(fromDate);
		return "member/admin/admin1to1List";
	}

} 