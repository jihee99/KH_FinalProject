
package com.kh.oceanclass.store.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.help.model.vo.Notice;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.member.model.vo.Report;
import com.kh.oceanclass.store.model.service.InstructorStoreService;
import com.kh.oceanclass.store.model.vo.InProductOrder;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.ProductOption;
import com.kh.oceanclass.store.model.vo.Stock;
import com.kh.oceanclass.store.model.vo.StoreBuyList;
import com.kh.oceanclass.store.model.vo.StoreOrder;
import com.kh.oceanclass.store.model.vo.StoreQna;
import com.kh.oceanclass.store.model.vo.StoreReview;

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
		
		System.out.println("pi = "+pi);
		System.out.println("list = "+list);
		
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
			if(!upfile[i].getOriginalFilename().equals("")) {
				
				String changeName = saveFile(upfile[i], session);
				
				if(i==0) {
					p.setProductImg0("resources/uploadFiles/store/" + changeName);
				} else if(i==1) {
					p.setProductImg1("resources/uploadFiles/store/" + changeName);
	 			} else if(i==2) {
	 				p.setProductImg2("resources/uploadFiles/store/" + changeName);
	 			} else {
	 				p.setProductImg3("resources/uploadFiles/store/" + changeName);
	 			}
		
			}
		}

		int result1 = inStoreService.insertProduct(p);
		int result2 = 1;
		for(int i=0; i<oplist.size(); i++) {
			result2 = result2 * inStoreService.insertProductOption(oplist.get(i));
		}
		
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
		
		model.addAttribute("p", p);
		model.addAttribute("oplist", oplist);
		model.addAttribute("opIndex", opIndex);
		
		return "store/instructorStoreUpdate";
	}
	

	@RequestMapping(value = "stupdate.in")
	public String updateProduct(Product p, String originOpNo, ProductOption option, MultipartFile[] reupfile, HttpSession session, Model model) {
		
		//옵션수정 관련
		int result1 = 1;			// 옵션 개수가 변하지 않거나 많을때 결과
		int result2 = 0;			// 상품 정보 수정 결과
		int opresult = 1;

		if(option != null) {
			
			String[] opNameArr = option.getOptionName().split(",");
			String[] opNoArr = originOpNo.split(",");

			ArrayList<ProductOption> oplist = new ArrayList<ProductOption>();
			if(opNameArr.length == opNoArr.length) {
				// 원래 옵션수와 수정된 옵션수가 동일할 때
				for(int i=0; i<opNoArr.length; i++) {
					oplist.add(new ProductOption());
					oplist.get(i).setOptionNo(opNoArr[i]);
					oplist.get(i).setProductNo(p.getProductNo());
					oplist.get(i).setOptionName(opNameArr[i]);
				}
			} else if(opNameArr.length < opNoArr.length) {
				// 원래 옵션수보다 수정된 옵션 수가 적을 때
				for(int i=0; i<opNoArr.length; i++) {
					oplist.add(new ProductOption());
					oplist.get(i).setOptionNo(opNoArr[i]);
					oplist.get(i).setProductNo(p.getProductNo());
				}		
				for(int i=0; i<opNameArr.length; i++) {
					oplist.get(i).setOptionName(opNameArr[i]);
				}
			} else if(opNameArr.length > opNoArr.length) {
				// 원래 옵션 수보다 수정된 옵션 수가 많을 때
				for(int i=0; i<opNameArr.length; i++) {
					oplist.add(new ProductOption());
					oplist.get(i).setOptionName(opNameArr[i]);
					oplist.get(i).setProductNo(p.getProductNo());
					oplist.get(i).setPrice(p.getPrice());
				}
				for(int i=0; i<opNoArr.length; i++) {
					oplist.get(i).setOptionNo(opNoArr[i]);	
				}
			}
			
			System.out.println(oplist);
			
			for(int i=0; i<oplist.size(); i++) {
				if(oplist.get(i).getOptionNo() != null && oplist.get(i).getOptionName() != null) {
					result1 *= inStoreService.updateProductOption(oplist.get(i));
				} else if(oplist.get(i).getOptionNo() != null && oplist.get(i).getOptionName() == null) {
					result1 *= inStoreService.updeleteProductOption(oplist.get(i));
				} else if(oplist.get(i).getOptionNo() == null && oplist.get(i).getOptionName() != null) {
					result1 *= inStoreService.upinsertProductOption(oplist.get(i));
				}
			}
		}

		// 첨부파일 수정
		for(int i=0; i<reupfile.length; i++) {
			if(!reupfile[i].getOriginalFilename().equals("")) {
				String changeName = saveFile(reupfile[i], session);
				if(i==0) {
					new File(session.getServletContext().getRealPath(p.productImg0)).delete();
					p.setProductImg0("resources/uploadFiles/store/" + changeName);
				} else if(i==1) {
					new File(session.getServletContext().getRealPath(p.productImg1)).delete();
					p.setProductImg1("resources/uploadFiles/store/" + changeName);
				} else if(i==2) {
					new File(session.getServletContext().getRealPath(p.productImg2)).delete();
	 				p.setProductImg2("resources/uploadFiles/store/" + changeName);
				} else if(i==3) {
					new File(session.getServletContext().getRealPath(p.productImg3)).delete();
	 				p.setProductImg3("resources/uploadFiles/store/" + changeName);
				} else {
					model.addAttribute("errorMsg", "상품 수정에 실패했습니다.");
					return "common/errorPage";
				}
			}
		}
		
		result2 = inStoreService.updateProduct(p);
		
		session.setAttribute("alertMsg", "상품 수정이 완료되었습니다.");
		return "redirect:stlist.in";
	}
	

	@RequestMapping(value="stdelete.in")
	public String deleteProduct(int pno, Model model, HttpSession session) {
		int result1 = inStoreService.deleteProduct(pno);
		int result2 = 1;
		result2 += inStoreService.deleteProductOption(pno);
		
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
		//System.out.println(st);
		
		int result = inStoreService.updateStockCount(st);
		//System.out.println(result);
		return result>0? "success()" : "fail";
	}
	
	@RequestMapping(value="porder.in")
	public ModelAndView productOrderF(ModelAndView mv) {
		ArrayList<Product> plist = inStoreService.selectProductList();
		//System.out.println(plist);
		mv.addObject("plist", plist);
		mv.setViewName("store/instructorStoreOrderForm");
		return mv;
	}
	
	@RequestMapping(value="porderE.in")
	public String productOrder(InProductOrder pOrder, HttpSession session, Model model) {
		//System.out.println(pOrder);
		int result = inStoreService.insertProductOrder(pOrder);
		if(result>0) {
			session.setAttribute("alertMsg", "발주신청이 완료되었습니다.");
			return "redirect:ststock.in";
		} else {
			model.addAttribute("errorMsg", "발주신청에 실패했습니다.");
			return "common/errorPage";
		}
	}
	
	
	//주문내역 연결
	@RequestMapping(value="solist.in")
	public String storeOrderList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		int listCount = inStoreService.selectStoreDeliveryCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<StoreOrder> list = inStoreService.selectStoreDeliveryList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "store/instructorStoreDeliveryOrderList";
	}
	
	@RequestMapping(value="sodetail.in")
	public String storeOrderDetail(String ono, Model model) {
		StoreOrder so = inStoreService.selectStoreDelivery(ono);
		ArrayList<StoreBuyList> buylist = inStoreService.selectStoreBuyList(ono);

		model.addAttribute("so", so);
		model.addAttribute("buylist", buylist);
		return "store/instructorStoreOrderDetail";
	}
	
	@RequestMapping(value="soupdate.in")
	public String storeOrderUpdate(StoreOrder so, Model model, HttpSession session) {

		int result = inStoreService.storeOrderUpdate(so);
		if(result>0) {
			session.setAttribute("alertMsg", "주문상태변경에 성공했습니다.");
			return "redirect:solist.in";
		}else {
			model.addAttribute("errorMsg", "주문상태 변경에 실패했습니다.");
			return "common/errorPage";
		}

	}
	
	@ResponseBody
	@RequestMapping(value="sosearchF.in", produces="application/json; charset=UTF-8")
	public Map<String, Object> searchStoreOrder(@RequestParam(value="cpage", defaultValue="1") int currentPage, String orderStatus) {
//		HashMap<String, Object> map = new HashMap<>();
		Map<String, Object> map = new HashMap();
		
		int listCount = inStoreService.searchStoreOrderCount(orderStatus);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<StoreOrder> list = inStoreService.searchStoreOrderList(orderStatus, pi);

		map.put("pi", pi.toString());
		map.put("list", list);

		return map;

	}
	
	@ResponseBody
	@RequestMapping(value="sodelete.in", produces="application/json; charset=UTF-8")
	public String deleteStoreOrder(String hiddenList) {
		
		String[] list = hiddenList.split(",");

		int result = 1;
		for(int i=0; i<list.length; i++) {
			String orderNo = list[i];
			result *= inStoreService.deleteStoreOrder(orderNo);
		}
		
		return result>0? "success" : "fail";
	}
	
	@RequestMapping(value="sosearch.in")
	public String searchKeyStoreOrderList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String type, String key, Model model) {
		HashMap<String, String> map = new HashMap<>();
		
		map.put("type", type);
		map.put("key", key);
		
		model.addAttribute("type", type);
		model.addAttribute("key", key);

		int listCount = inStoreService.searchKeyStoreOrderCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<StoreOrder> list = inStoreService.searchKeyStoreOrderList(map, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "store/instructorStoreDeliveryOrderSearchList";
	}
	
	@RequestMapping(value="sostatusUp.in")
	public String storeOrderStatusUpdate(String ono, String status, HttpSession session) {
		StoreOrder so = new StoreOrder();
		so.setOrderNo(ono);
		so.setOrderStatus(Integer.parseInt(status));
		System.out.println(so);
		int result = inStoreService.storeOrderStatusUpdate(so);
		if (result>0) {
			session.setAttribute("alertMsg", "배송상태 수정이 완료되었습니다.");
		} else {
			session.setAttribute("alertMsg", "배송상태 수정에 실패했습니다.");
		}
		return "redirect:solist.in";
		
	}
	
	@RequestMapping(value="srlist.in")
	public String storeReviceList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		int listCount = inStoreService.selectStoreReviewCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);

		Member loginUser = (Member) session.getAttribute("loginUser");

		if(loginUser != null) {
			int userNo = loginUser.getMemNo();
			
			ArrayList<Product> plist = inStoreService.selectReviewProductList(userNo);
			ArrayList<StoreReview> slist = inStoreService.selectStoreReviewList(pi, userNo);
			
			model.addAttribute("pi",pi);
			model.addAttribute("plist", plist);
			model.addAttribute("slist", slist);
			
			return "store/instructorStoreReviewList";
		} else {
			session.setAttribute("alertMsg", "접근 권한이 없습니다.");
			return "redirect:/";
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="pReviewAjax.in", produces="application/json; charset=UTF-8" )
	public String productReviewAjax(String pno) {
		ArrayList<StoreReview> list = inStoreService.selectStoreProductReview(pno);
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="pReviewCountAjax.in", produces="application/json; charset=UTF-8" )
	public String productReviewCountAjax(String pno) {
		StoreReview sr = inStoreService.selectStoreProductReviewCount(pno);
		
		return new Gson().toJson(sr);
	}
	
	
	@RequestMapping(value="sqlist.in")
	public String selectStoreQnaList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		int listCount = inStoreService.selectStoreQnaCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		Member loginUser = (Member) session.getAttribute("loginUser");

		if(loginUser != null) {
			int userNo = loginUser.getMemNo();
			
			ArrayList<Product> plist = inStoreService.selectReviewProductList(userNo);
			ArrayList<StoreQna> list = inStoreService.selectStoreQnaList(pi);
			
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("plist", plist);
			
			return "store/instructorStoreQnaList";
		}else {
			session.setAttribute("alertMsg", "접근 권한이 없습니다.");
			return "redirect:/";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="pQnaCountAjax.in", produces="application/json; charset=UTF-8" )
	public String productQnaCountAjax(@RequestParam(value="cpage", defaultValue="1") int currentPage, String pno) {
		int listCount = inStoreService.selectStoreProductQnaCount(pno);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);

		return new Gson().toJson(pi);
	}
	
	@ResponseBody
	@RequestMapping(value="pQnaListAjax.in", produces="application/json; charset=UTF-8" )
	public String productQnaListAjax(@RequestParam(value="cpage", defaultValue="1") int currentPage, String pno) {
		int listCount = inStoreService.selectStoreProductQnaCount(pno);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<StoreQna> list = inStoreService.selectStoreProductQnaList(pi, pno);

		return new Gson().toJson(list);
	}
	
	@RequestMapping(value="sqdetail.in")
	public String productQnaDetailF(String qno, Model model) {
		
		StoreQna sq = inStoreService.selectStoreQnaDetail(qno);

		model.addAttribute("sq", sq);
		return "store/instructorStoreQnaDetail";
	}
	
	
	@RequestMapping(value="sqanswer.in")
	public String productQnaAnswer(StoreQna sq, HttpSession session) {
		System.out.println(sq);
		int result = inStoreService.storeQnaAnswer(sq);
		if(result>0) {
			session.setAttribute("alertMsg", "답변 등록이 완료되었습니다.");
		}else {
			session.setAttribute("alertMsg", "답변 등록에 실패하였습니다.");
		}
		return "redirect:sqlist.in";
	}
	
	@RequestMapping(value="sqreport.in")
	public String reportForm(String qno, Model model) {
		StoreQna sq = inStoreService.selectStoreQnaDetail(qno);
		
		Report rp = new Report();
		
		rp.setReportMemNo(sq.getMemNo());
		rp.setRefCategory("SQ");
		rp.setRefBNo(Integer.toString(sq.getCsQno()));
		rp.setRpContent(sq.getContent());

		model.addAttribute("rp",rp);
		
		return "member/common/reportWindow";
	}
	
	@RequestMapping(value="srreport.in")
	public String reviewReportForm(String rno, Model model) {
		StoreReview sr = inStoreService.selectStoreReviewDetail(rno);
		Report rp = new Report();

		rp.setReportMemNo(Integer.toString(sr.getMemberNo()));
		rp.setRefCategory("SR");
		rp.setRefBNo(Integer.toString(sr.getReviewNo()));
		rp.setRpContent(sr.getContent());

		model.addAttribute("rp", rp);
		return "member/common/reportWindow";
	}
	
	@RequestMapping(value="nlist.in")
	public String instructorNoticeList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = inStoreService.selectinstructorNoticeCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Notice> list = inStoreService.selectTcNoticeList(pi);
		model.addAttribute("pi", pi);
		model.addAttribute("list",list);
		return "store/instructorNoticeList";
	}
	
	@RequestMapping(value="ndetail.in")
	public String instructorNoticeDetail(int nno, Model model) {

		int upCount = inStoreService.updateNoticeCount(nno);
		if(upCount > 0) {
			Notice n = inStoreService.selectinstructorNoticeDetail(nno);
			model.addAttribute("n", n);
			return "store/instructorNoticeDetail";			
		}else {
			return "redirect:/";
		}

	}
	
	
	// 첨부파일
	public String saveFile(MultipartFile upfile, HttpSession session) {

		String originName = upfile.getOriginalFilename(); 
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); 
		int ranNum = (int)(Math.random() * 90000 + 10000); 
		String ext = originName.substring(originName.lastIndexOf(".")); 
		
		String changeName = currentTime + ranNum + ext;
				
		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/store/");

		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}

	
	
	
	
	//savefile배열로
	/*
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
				System.out.println(session.getServletContext().getRealPath("/resources/uploadFiles/store/"));
				try {
					upfile[i].transferTo(new File(savePath + changeName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				changeList.add(changeName);
			}
		}
		return changeList;
	}
	*/
		
}