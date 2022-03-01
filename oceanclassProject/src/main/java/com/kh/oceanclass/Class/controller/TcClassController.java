package com.kh.oceanclass.Class.controller;

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

import com.kh.oceanclass.Class.model.service.TcClassServiceImpl;
import com.kh.oceanclass.Class.model.vo.ClassQna;
import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.member.model.vo.Member;

@Controller
public class TcClassController {
	
	@Autowired
	private TcClassServiceImpl tcService;
	
	// 강사 내 클래스 조회
	@RequestMapping("myClassList.tc")
	public String myClassList(Model model, HttpSession session) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		//System.out.println(memNo);
		ArrayList<ClassVo> classList = tcService.myClassList(memNo); // 클래스 리스트
		
		for(int i=0; i<classList.size(); i++) {
			if(classList.get(i).getCategory().equals("1")) {
				classList.get(i).setCategory("드로잉");
			}else if(classList.get(i).getCategory().equals("2")) {
				classList.get(i).setCategory("요리");
			}else if(classList.get(i).getCategory().equals("3")) {
				classList.get(i).setCategory("음악");
			}else if(classList.get(i).getCategory().equals("4")) {
				classList.get(i).setCategory("운동");
			}else if(classList.get(i).getCategory().equals("5")) {
				classList.get(i).setCategory("사진,영상");
			}else if(classList.get(i).getCategory().equals("6")) {
				classList.get(i).setCategory("재테크");
			}else if(classList.get(i).getCategory().equals("7")) {
				classList.get(i).setCategory("개발,데이터");
			}else {
				classList.get(i).setCategory("자기계발");
			}
		}
		
		// Y-게시/N-승인대기/R-반려/D-내리기
		for(int i=0; i<classList.size(); i++) {
			if(classList.get(i).getClStatus().equals("Y")) {
				classList.get(i).setClStatus("게시중");
			}else if(classList.get(i).getClStatus().equals("N")) {
				classList.get(i).setClStatus("게시대기");
			}else if(classList.get(i).getClStatus().equals("D")) {
				classList.get(i).setClStatus("게시종료");
			}else {
				classList.get(i).setClStatus("게시반려");
			}
			
		}
		
		//System.out.println(classList);
		model.addAttribute("classList", classList);
		return "member/teacher/myClassList";
	}
	@RequestMapping("endClass.tc")
	public String endClass(int clNo,HttpSession session, Model model) {
		
		int result = tcService.endClass(clNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "클래스가 게시 상태에서 내려 갑니다.");
			return "redirect:myClassList.tc";
		}else{
			model.addAttribute("errorMsg", "실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("enrollClassForm.tc")
	public String enrollClass() {
		return "member/teacher/myClassEnroll";
	}
	
	@RequestMapping(value="enrollClass.tc", produces="application/json; charset=UTF-8")
	public String insertClass(ClassVo c, MultipartFile[] upfile, HttpSession session, Model model) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		for(int i=0; i<upfile.length; i++) {
			System.out.println(upfile[i]);
			if(!upfile[i].getOriginalFilename().equals("")) {
				
				String changeName = saveFile(upfile[i], session);
				
				if(i==0) {
					c.setClImg("resources/uploadFiles/class/" + changeName);
				} else if(i==1) {
					c.setClImg2("resources/uploadFiles/class/" + changeName);
	 			} else if(i==2) {
	 				c.setClImg3("resources/uploadFiles/class/" + changeName);
	 			} else {
	 				c.setClKitImg("resources/uploadFiles/class/" + changeName);
	 			}
		
			}
		}
		int result = tcService.insertClass(c);
		
		if(result>0) {
			session.setAttribute("alertMsg", "클래스 등록 요청을 완료했습니다.");
			return "redirect:myClassList.tc";
		} else {
			model.addAttribute("errorMsg", "클래스 등록에 실패했습니다.");
			return "common/errorPage";
		}
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {

		String originName = upfile.getOriginalFilename(); 
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); 
		int ranNum = (int)(Math.random() * 90000 + 10000); 
		String ext = originName.substring(originName.lastIndexOf(".")); 
		
		String changeName = currentTime + ranNum + ext;
				
		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/class/");

		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	@RequestMapping("updateClassForm.tc")
	public String updateClassForm(int clNo,Model model) {
		ClassVo c = tcService.updateClassForm(clNo);
		
		model.addAttribute("c", c);
		System.out.println(c);
		return "member/teacher/myClassUpdate";
	}
	
	@RequestMapping(value = "updateClass.tc")
	public String updateClass(ClassVo c, MultipartFile[] reupfile, String[] originName, HttpSession session, Model model) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		for(int j=0; j<reupfile.length; j++) {
			if(!reupfile[j].getOriginalFilename().equals("")) {
				
				for(int i = 0; i<originName.length; i++) {
					if(i==0) {
						if(c.getClImg() != null) {
							new File(session.getServletContext().getRealPath(c.getClImg())).delete();
						}
					} else if(i==1) {
						if(c.getClImg2() != null) {
							new File(session.getServletContext().getRealPath(c.getClImg2())).delete();
						}
					} else if(i==2) {
						if(c.getClImg3() != null) {
							new File(session.getServletContext().getRealPath(c.getClImg3())).delete();
						}
					} else if(i==3) {
						if(c.getClKitImg() != null) {
							new File(session.getServletContext().getRealPath(c.getClKitImg())).delete();
						}
					} 
				}
			}
		}
		
		for(int i=0; i<reupfile.length; i++) {
			System.out.println(reupfile[i]);
			if(!reupfile[i].getOriginalFilename().equals("")) {
				String changeName = saveFile(reupfile[i], session);
				if(i==0) {
					c.setClImg("resources/uploadFiles/class/" + changeName);
				} else if(i==1) {
					c.setClImg2("resources/uploadFiles/class/" + changeName);
	 			} else if(i==2) {
	 				c.setClImg3("resources/uploadFiles/class/" + changeName);
	 			} else {
	 				c.setClKitImg("resources/uploadFiles/class/" + changeName);
	 			}
			}
		}
		int result = tcService.updateClass(c);
		System.out.println(c);
		
		if(result > 0) { // 수정 성공 
			session.setAttribute("alertMsg", "클래스 수정이 완료되었습니다.");
			return "redirect:myClassList.tc";
			
		}else { // 수정 실패 
			model.addAttribute("errorMsg", "수정 실패");
			return "common/errorPage";
		}
	}
	
	// 강사 내 클래스 리뷰 조회
	@RequestMapping("myClassReviewList.tc")
	public String myClassReviewList(Model model, HttpSession session) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		//ArrayList<ClassReview> tcClassName = tcService.myClassNameList(clNo);
		ArrayList<ClassReview> tcReviewList = tcService.myClassReviewList(memNo); // 클래스 리스트
		
		//model.addAttribute("clNo", clNo);
		//model.addAttribute("tcClassName", tcClassName);
		model.addAttribute("tcReviewList", tcReviewList);
		return "member/teacher/classReviewList";
	}
	
	// 강사 내 문의 리뷰 조회
	@RequestMapping("myClassQnaList.tc")
	public ModelAndView myClassQnaList(@RequestParam(value="cpage", defaultValue="1")int currentPage, ModelAndView mv, HttpSession session) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		int tcQnaListCount = tcService.tcQnaListCount(memNo);
		//System.out.println(tcQnaListCount);
		PageInfo pi = Pagination.getPageInfo(tcQnaListCount, currentPage, 5, 10);
		
		ArrayList<ClassQna> tcQnaList = tcService.myClassQnaList(memNo, pi); // 문의 리스트
		
		mv.addObject("pi", pi).addObject("tcQnaList", tcQnaList).setViewName("member/teacher/classQnAList");
		return mv;
	}
	// 강사 문의 상세보기
	@RequestMapping("tcQnaDetail.tc")
	public String selectTcQnaDetail(int csQnaNo, Model model) {
		
			ClassQna cq = tcService.selectTcQnaDetail(csQnaNo);
			model.addAttribute("cq", cq);
			return "member/teacher/classQnaDetailForm";
		
	}
	
	@RequestMapping("qnaInsertRf.tc")
	public String qnaInsertRf(ClassQna cq, HttpSession session, Model model) {
		
		int result = tcService.qnaInsertRf(cq);
		//System.out.println(result);
		if(result > 0) { // 성공
			session.setAttribute("alertMsg", "성공적으로 문의 답변이 등록/수정 되었습니다.");
			return "redirect:tcQnaDetail.tc?csQnaNo=" + cq.getCsQnaNo();
		}else { // 실패
			model.addAttribute("errorMsg", "실패");
			return "common/errorPage";
		}
		
	}

}
