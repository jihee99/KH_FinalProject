
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.store.model.service.InstructorStoreService;
import com.kh.oceanclass.store.model.vo.InProductOrder;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.ProductOption;
import com.kh.oceanclass.store.model.vo.Stock;

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
		for(int i=0; i<upfile.length; i++) {
			System.out.println(upfile[i]);
		}
		System.out.println();
		
		for(int i=0; i<upfile.length; i++) {
			System.out.println(upfile[i]);
			if(!upfile[i].getOriginalFilename().equals("")) {
				String changeName = saveFile(upfile[i], session);
				if(i==0) {
					p.setProductImg0("resources/uploadFiles/" + changeName);
				} else if(i==1) {
					p.setProductImg1("resources/uploadFiles/" + changeName);
	 			} else if(i==2) {
	 				p.setProductImg2("resources/uploadFiles/" + changeName);
	 			} else {
	 				p.setProductImg3("resources/uploadFiles/" + changeName);
	 			}
			}
		}
		/*
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
		*/
		System.out.println(p);
		
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
		
//		System.out.println(p);
//		System.out.println(option);
	
		for(int i=0; i<reupfile.length; i++) {
			System.out.println(reupfile[i]);	
			System.out.println();
		}
		
		for(int i=0; i<originName.length; i++) {
			System.out.println(originName[i]);	
			System.out.println();
		}

		//옵션수정파트먼저
		int result1 = 1;			// 옵션 개수가 변하지 않거나 작을때 결과
		int result2 = 1;			// 옵션 개수가 변했을 때 결과

		if(option.getOptionNo() != null) {
			String[] opNameArr = option.getOptionName().split(",");
			String[] opNoArr = option.getOptionNo().split(",");
			// 1. 옵션이 원래 있었을 때			
			for(int i=0; i<opNameArr.length; i++) {
				System.out.println(i +" : " + opNameArr[i]);
			}
			
			for(int i=0; i<opNoArr.length; i++) {
				System.out.println(i +" : " + opNoArr[i]);
			}
			
			ArrayList<ProductOption> oplist = new ArrayList<ProductOption>();
			
			for(int i=0; i<opNameArr.length; i++) {
				oplist.add(new ProductOption());
				oplist.get(i).setProductNo(p.productNo);
				oplist.get(i).setOptionName(opNameArr[i]);
				oplist.get(i).setPrice(option.getPrice());
			}
			for(int i=0; i<opNoArr.length; i++) {
				oplist.get(i).setOptionNo(opNoArr[i]);
			}
			//System.out.println("0-----------------옵션수정------------------");
			for(int i=0; i<oplist.size(); i++) {
				if(oplist.get(i).getOptionNo() != null) {
					result1 *= inStoreService.updateProductOption(oplist.get(i));
				}else {
					result1 *= inStoreService.upinsertProductOption(oplist.get(i));
				}
				System.out.println(oplist.get(i));
			}
			//System.out.println("0-----------------옵션수정------------------");
		}
		
		
		// 받아온 originName을 p객체에 삽입
		for(int i = 0; i<originName.length; i++) {
			if(i==0) {
				p.setProductImg0("resources/uploadFiles/" + originName);
			} else if(i==1) {
				p.setProductImg1("resources/uploadFiles/" + originName);
 			} else if(i==2) {
 				p.setProductImg2("resources/uploadFiles/" + originName);
 			} else {
 				p.setProductImg3("resources/uploadFiles/" + originName);
 			}
		}
		
		// 첨부파일 수정 섹션
		for(int j=0; j<reupfile.length; j++) {
			// 첨부파일이 있다면
			if(!reupfile[j].getOriginalFilename().equals("")) {
				System.out.println("re YYYY");
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
		
		for(int i=0; i<reupfile.length; i++) {
			System.out.println(reupfile[i]);
			if(!reupfile[i].getOriginalFilename().equals("")) {
				String changeName = saveFile(reupfile[i], session);
				if(i==0) {
					p.setProductImg0("resources/uploadFiles/" + changeName);
				} else if(i==1) {
					p.setProductImg1("resources/uploadFiles/" + changeName);
	 			} else if(i==2) {
	 				p.setProductImg2("resources/uploadFiles/" + changeName);
	 			} else {
	 				p.setProductImg3("resources/uploadFiles/" + changeName);
	 			}
			}
		}

		result2 = inStoreService.updateProduct(p);
		
		System.out.println(result1);
		System.out.println(result2);
		
		session.setAttribute("alertMsg", "상품 수정이 완료되었습니다.");
		return "redirect:stlist.in";
	}
	

	@RequestMapping(value="stdelete.in")
	public String deleteProduct(int pno, Model model, HttpSession session) {
		int result1 = inStoreService.deleteProduct(pno);
		int result2 = inStoreService.deleteProductOption(pno);
		
		if(result1 * result2 > 0) {
			session.setAttribute("alertMsg", "상품이 성공적으로 삭제되었습니다.");
			return "redirect:stlist.in";
		} else {
			model.addAttribute("errorMsg", "상품삭제에 실패했습니다.");
			return "common/errorPage";
		}
	
	}
	
	//재고 리스트 연결
	@RequestMapping(value="ststock.in")
	public ModelAndView updateStoreStockF(@RequestParam(value="cpage", defaultValue="1") int currentPage, ArrayList<Stock> slist, ModelAndView mv) {
		int listCount = inStoreService.selectStockCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Stock> stlist = inStoreService.selectStockList(pi);
		
		for(int i=0; i<stlist.size(); i++) {
			stlist.get(i).setAvailCount(String.valueOf(stlist.get(i).getStockCount() - stlist.get(i).getOrderCount()));
		}
		mv.addObject("stlist", stlist);
		mv.addObject("pi", pi);
		mv.setViewName("store/instructorStoreStockList");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="stockUp.in")
	public String updateStoreStock(Stock st) {
		System.out.println(st);
		
		int result = inStoreService.updateStockCount(st);
		//System.out.println(result);
		return result>0? "success()" : "fail";
	}
	
	@RequestMapping(value="porder.in")
	public ModelAndView productOrderF(ModelAndView mv) {
		ArrayList<Product> plist = inStoreService.selectProductList();
		System.out.println(plist);
		mv.addObject("plist", plist);
		mv.setViewName("store/instructorStoreOrderForm");
		return mv;
	}
	
	@RequestMapping(value="porderE.in")
	public String productOrder(InProductOrder pOrder, HttpSession session, Model model) {
		System.out.println(pOrder);
		int result = inStoreService.insertProductOrder(pOrder);
		if(result>0) {
			session.setAttribute("alertMsg", "발주신청이 완료되었습니다.");
			return "redirect:ststock.in";
		} else {
			model.addAttribute("errorMsg", "발주신청에 실패했습니다.");
			return "common/errorPage";
		}
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		System.out.println(upfile);
		System.out.println(originName);
		// 20220118103507 =>년월일시분초
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());	// "20220118104009"
		int ranNum = (int)(Math.random() * 90000 + 10000);	//23412 랜덤값
		String ext = originName.substring(originName.lastIndexOf("."));	//".png"
		System.out.println(ext);

		String changeName = currentTime + ranNum + ext;
		System.out.println(changeName);
		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
	/* savefile배열로
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
				
				try {
					upfile[i].transferTo(new File(savePath + changeName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				changeList.add("resources/uploadFiles/store/"+changeName);
			}
		}
		return changeList;
	}
	*/

		
}