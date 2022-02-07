package com.kh.oceanclass.store.controller;

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

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.store.model.service.InstructorStoreService;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.ProductOption;

/*강사 스토어 관련 기능 처리하는 controller*/

@Controller
public class InstructorStoreController {
	
	@Autowired
	private InstructorStoreService inStoreService;
	
	@RequestMapping("stlist.in")
	public String selectList(@RequestParam(value="cpage",defaultValue="1") int currentPage, Model model){
		
		int listCount = inStoreService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 1);
		ArrayList<Product> list = inStoreService.selectList(pi);
		
		//System.out.println("pi = "+pi);
		//System.out.println("list = "+list);
		
		model.addAttribute("pi",pi);
		model.addAttribute("list", list);
		return "store/instructorStoreList";
	};
	
	@RequestMapping("stenrollF.in")
	public String enrollForm() {
		return "store/instructorStoreEnrollPage";
	}
	
	@RequestMapping(value="stenroll.in", produces="application/json; charset=UTF-8")
	public void insertProduct(Product p, ProductOption op, MultipartFile[] upfile, HttpSession session, Model model) {
		System.out.println(p);
		System.out.println(op); 
		/*for(int i=0; i<upfile.length; i++) {
			System.out.println(upfile[i]);
		}*/
		
		ArrayList<String> changeList = saveFile(upfile, session);
		//String changeName = saveFile(upfile, session);
		System.out.println(changeList);
		
		// 배열에 저장된 값을 어떻게 하나씩 객체에 넣어야할지 모르겠음..

		
		
		System.out.println(p);
	}
	

	@RequestMapping("stdetail.in")
	public String selectProduct(int pno, Model model) {
		Product p = inStoreService.selectProduct(pno);
		System.out.println(pno);
		System.out.println(p);
		model.addAttribute("p", p);
		return "store/instructorStoreUpdate";
	}
	
	
	@RequestMapping("stupdateF.in")
	public void updateProduct(int pno, Model model) {
		System.out.println(pno);
	}

	
	
	//파일명변경
	public ArrayList<String> saveFile(MultipartFile[] upfile, HttpSession session) {
		
		ArrayList<String> changeList = new ArrayList();
		//String reName = "";
		for(int i=0; i<upfile.length; i++) {
			if(!upfile[i].getOriginalFilename().equals("")) {
				String originName = upfile[i].getOriginalFilename();
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());	
				int ranNum = (int)(Math.random() * 90000 + 10000);	
				String ext = originName.substring(originName.lastIndexOf("."));
				String changeName = currentTime + ranNum + ext;
				
				String savePath = session.getServletContext().getRealPath("/resources/images/store/");
				
				changeList.add(changeName);
				//reName += changeName + "-";
				try {
					upfile[i].transferTo(new File(savePath + changeName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
		return changeList;
	}
		
}
