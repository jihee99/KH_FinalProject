package com.kh.oceanclass.member.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.member.model.service.TcMypageService;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.member.model.vo.Teacher;

@Controller
public class tcMypageController {
	
	@Autowired
	private TcMypageService tcmyService;
	
	// 마이페이지 내정보 수정 이동
	@RequestMapping("inforPage.tc")
	public String tcinforPage() {
		return "member/teacher/tcMyinfor";
	}
	
	// 강사 내정보 변경
	@RequestMapping("updateInforPage.tc")
	public String updateInforPage(Member m, MultipartFile reupfile, HttpSession session, Model model) {
		
		//System.out.println(reupfile);
		
		if(!reupfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(reupfile, session);
			
			m.setProfileImg("resources/uploadFiles/tcmypage/" + changeName);
		}
		
		//System.out.println(m);
		int result = tcmyService.updateInforPage(m);
		//System.out.println(result);
		if(result>0) {
			session.setAttribute("loginUser", tcmyService.loginMember(m));
			session.setAttribute("alertMsg", "정보 수정 완료");
			return "redirect:inforPage.tc";
		}else {
			model.addAttribute("errorMsg", "정보수정실패");
			return "common/errorPage";
		}
	}

	// 마이페이지 강사정보 수정 이동
	@RequestMapping("myPage.tc")
	public String tcPage() {
		return "member/teacher/tcMyPage";
	}
	
	// 강사 강사정보 변경 
	@RequestMapping(value="myPageUpdate.tc", produces="application/json; charset=UTF-8")
	public String insertProduct(Teacher t, MultipartFile upfile, HttpSession session, Model model) {
		
		String[] strArr = null;
		ArrayList<Teacher> snslist = new ArrayList<Teacher>();
		
		
		if(t.getTcSns() != null) {
			strArr = t.getTcSns().split(",");
			for(int i=0; i<strArr.length; i++) {
				snslist.add(new Teacher());
				snslist.get(i).setTcSns(strArr[i]);
			}
		}	
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			
			t.setHistoryFile("resources/uploadFiles/tcmypage/" + changeName);
		}
		
		System.out.println(t);
		
		int result1 = tcmyService.updateMyPage(t);
		int result2 = 1;
		for(int i=0; i<snslist.size(); i++) {
			result2 = result2 * tcmyService.updateMyPage(snslist.get(i));
		}
		
		if(result1*result2>0) {
			session.setAttribute("alertMsg", "강사정보 수정을 완료했습니다.");
			return "redirect:myPage.tc";
		} else {
			model.addAttribute("errorMsg", "수정 실패");
			return "common/errorPage";
		}
	}
	
	// 첨부파일
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename(); // "flower.png"
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)(Math.random() * 90000 +10000); // 다섯자리 랜덤값
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("resources/uploadFiles/tcmypage/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	@ResponseBody
	@RequestMapping("nickCheck.tc")
	public String tcnickCheck(String nickCheck) {
		int count = tcmyService.nickCheck(nickCheck);
		
		return count > 0 ? "NNNN" : "NNNY";
	}
}
