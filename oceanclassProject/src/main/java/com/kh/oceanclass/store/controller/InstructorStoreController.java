
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
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 3);
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
	public String insertProduct(Product p, ProductOption option, MultipartFile[] upfile, HttpSession session, Model model) {
		
		System.out.println(p);
		System.out.println(option);
		System.out.println(upfile);
		for(int i =0; i<upfile.length; i++) {
			System.out.println("upfile : " + upfile[i]);
		}
		
		String[] strArr = null;
		ArrayList<ProductOption> oplist = new ArrayList<ProductOption>();
		
		// 옵션이 존재할 때
		if(option.getOptionName() != null) {
			// 문자열로 반환된 optionName을 각각의 객체로 분리
			strArr = option.getOptionName().split(",");
			for(int i=0; i<strArr.length; i++) {
				oplist.add(new ProductOption());
				oplist.get(i).setOptionName(strArr[i]);
				oplist.get(i).setPrice(option.getPrice());
			}
		}
				
		
		ArrayList<String> changeList = saveFile(upfile, session);
		//System.out.println(changeList);
		
		for(int i=0; i<changeList.size(); i++) {
			if(i==0) {
				p.productImg0 = changeList.get(i);
			} else if(i==1) {
				p.productImg1 = changeList.get(i);
 			} else if(i==2) {
 				p.productImg2 = changeList.get(i);
 			} else {
 				p.productImg3 = changeList.get(i);
 			}
		}
		//System.out.println(p);
		
		int result1 = inStoreService.insertProduct(p);
		int result2 = 1;
		for(int i=0; i<oplist.size(); i++) {
			result2 = result2 * inStoreService.insertProductOption(oplist.get(i));
		}
		
		//System.out.println("p : " + result1);
		//System.out.println("op : " + result2);
		
		if(result1*result2>0) {
			session.setAttribute("alertMsg", "상품 등록 요청을 완료했습니다.");
			return "redirect:stlist.in";
		} else {
			model.addAttribute("errorMsg", "상품 등록에 실패했습니다.");
			return "common/errorPage";
		}
	}
	

	@RequestMapping("stdetail.in")
	public String selectProduct(int pno, Model model) {
		Product p = inStoreService.selectProduct(pno);
		ArrayList<ProductOption> oplist = inStoreService.selectProductOption(pno);
		int opIndex = oplist.size();
		
		//System.out.println(pno);
		//System.out.println(p);
		//System.out.println("디테일에서 oplist : "+oplist);
		
		model.addAttribute("p", p);
		model.addAttribute("oplist", oplist);
		model.addAttribute("opIndex", opIndex);
		
		return "store/instructorStoreUpdate";
	}
	

	@RequestMapping(value = "stupdate.in")
	public String updateProduct(Product p, ProductOption option, MultipartFile[] reupfile, String[] originName, HttpSession session, Model model) {
		
		// 받아온 originName을 p객체에 삽입
		for(int i = 0; i<originName.length; i++) {
			if(i==0) {
				p.productImg0 = originName[i];
			} else if(i==1) {
				p.productImg1 = originName[i];
			} else if(i==2) {
				p.productImg2 = originName[i];
			} else if(i==3) {
				p.productImg3 = originName[i];
			}
		}
		
		// 첨부파일 수정 섹션
		for(int j=0; j<reupfile.length; j++) {
			// 첨부파일이 있다면
			if(!reupfile[j].getOriginalFilename().equals("")) {
				System.out.println("1111");
				for(int i = 0; i<originName.length; i++) {
					if(i==0) {
						if(p.productImg0 != null) {
							new File(session.getServletContext().getRealPath(p.productImg0)).delete();
						}
					} else if(i==1) {
						if(p.productImg1 != null) {
							new File(session.getServletContext().getRealPath(p.productImg1)).delete();
						}
					} else if(i==2) {
						if(p.productImg2 != null) {
							new File(session.getServletContext().getRealPath(p.productImg2)).delete();
						}
					} else if(i==3) {
						if(p.productImg3 != null) {
							new File(session.getServletContext().getRealPath(p.productImg3)).delete();
						}
					} else {
						// 실패시 에러페이지로 반환
						model.addAttribute("errorMsg", "상품 수정에 실패했습니다.");
						return "common/errorPage";
					}
				}
			}
		}
		ArrayList<String> changeList = saveFile(reupfile, session);
		for(int i=0; i<changeList.size(); i++) {
			if(i==0) {
				p.productImg0 = changeList.get(i);
			} else if(i==1) {
				p.productImg1 = changeList.get(i);
 			} else if(i==2) {
 				p.productImg2 = changeList.get(i);
 			} else {
 				p.productImg3 = changeList.get(i);
 			}
		}
		
		// 옵션수정섹션
		String[] opNameArr = option.getOptionName().split(",");
		String[] opNoArr = option.getOptionNo().split(",");
		ArrayList<ProductOption> oplist = new ArrayList<ProductOption>();
		
		// 옵션이 존재할 때
		if(opNameArr.length>0) {	
			// 문자열로 반환된 optionName을 각각의 객체로 분리
			for(int i=0; i<opNameArr.length; i++) {
				oplist.add(new ProductOption());
				oplist.get(i).setOptionNo(opNoArr[i]);
				oplist.get(i).setProductNo(p.productNo);
				oplist.get(i).setOptionName(opNameArr[i]);
				oplist.get(i).setPrice(option.getPrice());
			}
		}

		int result1 = inStoreService.updateProduct(p);
		int result2 = 1;
		for(int i=0; i<oplist.size(); i++) {
			result2 = result2 * inStoreService.updateProductOption(oplist.get(i));
		}
		
		session.setAttribute("alertMsg", "상품 수정이 완료되었습니다.");
		return "redirect:stlist.in";
	}
	
	//파일명변경 배열로
	@RequestMapping(value="stdelete.in")
	public String deleteProduct() {
		
		return "";
	}
	
	
	
	
	public ArrayList<String> saveFile(MultipartFile[] upfile, HttpSession session) {
		
		ArrayList<String> changeList = new ArrayList();
		
		for(int i=0; i<upfile.length; i++) {
			if(!upfile[i].getOriginalFilename().equals("")) {
				String originName = upfile[i].getOriginalFilename();
				
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());	
				int ranNum = (int)(Math.random() * 90000 + 10000);	
				String ext = originName.substring(originName.lastIndexOf("."));
				String changeName = currentTime + ranNum + ext;
				
				String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/store/");
				
				changeList.add("resources/uploadFiles/store/"+changeName);
				try {
					upfile[i].transferTo(new File(savePath + changeName));
				} catch (IllegalStateException | IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
			}
		}
		return changeList;
	}
	

		
}