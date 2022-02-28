package com.kh.oceanclass.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.oceanclass.Class.model.vo.ClassOrder;
import com.kh.oceanclass.Class.model.vo.ClassRefund;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.template.Pagination;
import com.kh.oceanclass.member.model.service.AdminMemService;
import com.kh.oceanclass.member.model.vo.Coupon;
import com.kh.oceanclass.member.model.vo.MemCoupon;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.member.model.vo.Point;
import com.kh.oceanclass.member.model.vo.Report;
import com.kh.oceanclass.store.model.vo.StoreBuyList;
import com.kh.oceanclass.store.model.vo.StoreOrder;
import com.kh.oceanclass.store.model.vo.StoreRefund;

/*관리자 회원관리 관련 기능*/

@Controller
public class AdminMemController {
	
	@Autowired
	private AdminMemService adMemService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping(value="main.ad")
	public String adminMain() {
		return "common/admin/adminMainPage";
	}
	
	@RequestMapping(value="loginF.ad")
	public String adminLoginForm() {
		return "common/admin/adminLogin";
	}
	
	@RequestMapping(value="login.ad")
	public ModelAndView adminLogin(Member m, HttpSession session, ModelAndView mv) {
		//System.out.println(m);

		Member loginUser = adMemService.loginAdmin(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) { 
			session.setAttribute("loginUser", loginUser);
			//System.out.println(loginUser);
			mv.setViewName("redirect:main.ad");
		}else{ 
			mv.addObject("errorMsg", "로그인실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="memlist.ad")
	public ModelAndView selectMemList(@RequestParam(value="cpage",defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = adMemService.selectMemCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Member> memlist = adMemService.selectMemList(pi);
		
		mv.addObject("pi", pi);
		mv.addObject("memlist", memlist);
		mv.setViewName("member/admin/adminMemberList");
		
		return mv;
	}

	@RequestMapping(value="memsearch.ad")
	public ModelAndView selectSMemList(@RequestParam(value="cpage",defaultValue="1") int currentPage, String type, String key, ModelAndView mv) {
		HashMap<String, String> map = new HashMap<>();
		
		map.put("type", type);
		map.put("key",key);
		
		int listCount = adMemService.selectSearchMemCount(map);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Member> memlist = adMemService.selectSearchMemList(pi, map);

		
		mv.addObject("key", key);
		mv.addObject("type", type);
		mv.addObject("pi", pi);
		mv.addObject("memlist", memlist);
		mv.setViewName("member/admin/adminMemberSearchList");
		
		return mv;
	}
	
	
	
	@RequestMapping(value="pclist.ad")
	public ModelAndView adminCPList(@RequestParam(value="cpage",defaultValue="1") int currentCPage, @RequestParam(value="cpage",defaultValue="1") int currentPPage, ModelAndView mv) {
		int clistCount = adMemService.selectCouponCount();
		PageInfo cPi = Pagination.getPageInfo(clistCount, currentCPage, 5, 10);
		ArrayList<Coupon> clist = adMemService.selectCouponList(cPi);
		
		
		int plistCount = adMemService.selectPointCount();
		PageInfo pPi = Pagination.getPageInfo(plistCount, currentPPage, 5, 10);
		ArrayList<Point> plist = adMemService.selectPointList(pPi);
		
		mv.addObject("pPi", pPi);
		mv.addObject("plist", plist);
		
		System.out.println(pPi);
		System.out.println(plist);
		
		mv.addObject("cPi", cPi);
		mv.addObject("clist", clist);
		
		mv.setViewName("member/admin/adminPointCouponList");
		return mv;
	}
	
	@RequestMapping(value="pcsearch.ad")
	public String adminCPSearchList(@RequestParam(value="cpage",defaultValue="1") int currentPage, String key, String type, Model model) {
		HashMap<String, String> map = new HashMap<>();
		
		if(!type.equals("")) {
			map.put("type", type);	
			model.addAttribute("type", type);
		}
		//if(!key.equals("")) {
			map.put("key", key);
			model.addAttribute("key", key);
		//}

		System.out.println(map);
		if(type.equals("p")) {
			int listCount = adMemService.selectPointSearchCount(map);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
			ArrayList<Point> list = adMemService.selectPointSearchList(pi, map);	
			System.out.println(list);
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
		}
		if(type.equals("c")) {
			int listCount = adMemService.selectCouponSearchCount(map);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
			ArrayList<Coupon> list = adMemService.selectCouponSearchList(pi, map);		
			System.out.println(list);
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
		}
		
		return "member/admin/adminPointCouponSearchList";
	}
	
	@RequestMapping(value="cenrollF.ad")
	public String adminCouponEnroll(HttpSession session, Model model) {
		return "member/admin/adminCouponEnrollWindow";
	}

	@ResponseBody
	@RequestMapping(value="cenroll.ad")
	public String insertCoupon(Coupon c) {
		//System.out.println(c);
		int result = adMemService.adminEnrollCoupon(c);
		return result>0? "success" : "fail";
	}

	@RequestMapping(value="cdelete.ad")
	public String deleteCoupon(int cno, HttpSession session, Model model) {
		// System.out.println(cno);
		int result = adMemService.deleteCoupon(cno);
		if(result > 0) {
			session.setAttribute("alertMsg", "쿠폰 삭제가 완료되었습니다.");
			return "redirect:pclist.ad";
		} else {
			model.addAttribute("errorMsg", "쿠폰 삭제에 실패했습니다.");
			return "common/errorPage.jsp";
		}
	}

	@RequestMapping(value="cgiveF.ad")
	public String adminCouponManager(int cno, Model model, HttpSession session) {
		// 관리자 쿠폰 발행 페이지 확인용 메소드
		//System.out.println(cno);

		Coupon c = adMemService.selectCoupon(cno);
		ArrayList<Member> mlist = adMemService.selectAllMember();
		model.addAttribute("c", c);
		model.addAttribute("mlist", mlist);
		return "member/admin/adminCouponWindow";

	}
	
	@ResponseBody
	@RequestMapping(value="cgive.ad")
	public String adminCouponGive(MemCoupon memC, String hiddenList, HttpSession session, Model model) {
		//System.out.println(memC);
		//System.out.println(hiddenList);
		Member m = (Member) session.getAttribute("loginUser");
		model.addAttribute("m", m);
		String[] memlist = hiddenList.split(",");
		int result = 1;
		for(int i=0; i<memlist.length; i++) {
			memC.setMemNo(memlist[i]);
			//System.out.println(memC);			
			result += adMemService.insertMemCoupon(memC);
		}
		//System.out.println(result);
		return result>0? "success" : "fail";
	}
	
	@RequestMapping(value="cupdateF.ad")
	public String adminCouponUpdateF(int cno, Model model) {
		Coupon c = adMemService.selectCoupon(cno);
		model.addAttribute("c", c);
		return "member/admin/adminCouponUpdateWindow";
	}
	
	@ResponseBody
	@RequestMapping(value="cupdate.ad")
	public String adminCouponUpdate(Coupon c, Model model) {
		System.out.println(c);
		int result = adMemService.updateCoupon(c);
		return result>0? "success" : "fail";
	}

	@RequestMapping(value="callgive.ad")
	public String allMemberCouponGive(Model model) {
		ArrayList<Coupon> list = adMemService.selectAllCouponList();
		ArrayList<Member> mlist = adMemService.selectAllMember();
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("mlist", mlist);
		return "member/admin/adminEntireMemCoupon";
	}
	
	@RequestMapping(value="pgiveF.ad")
	public String adminPointManager(Model model) {
		ArrayList<Member> mlist = adMemService.selectAllMember();
		model.addAttribute("mlist", mlist);
		return "member/admin/adminPointWindow";
	}
	
	@ResponseBody
	@RequestMapping(value="pgive.ad")
	public String adminPointGive(Point p, Model model) {
		System.out.println(p);
		int result = adMemService.adminEnrollPoint(p);
		
		return result>0? "success" : "fail";
	}
	
	@RequestMapping(value="orlist.ad")
	public String adminOrderList(@RequestParam(value="cpage",defaultValue="1") int currentPage, Model model) {

		// 클래스주문 카운트, 클래스 pi객체, 클래스주문리스트
		int clistCount = adMemService.selectClassOrderCount();
		PageInfo cPi = Pagination.getPageInfo(clistCount, currentPage, 5, 10);
		ArrayList<ClassOrder> clist = adMemService.selectClassOrderList(cPi);
		System.out.println(clistCount);
		System.out.println(clist);
		
		// 스토어 주문 카운트, 스토어 pi객체, 스토어 주문리스트
		int slistCount = adMemService.selectStoreOrderCount();
		PageInfo sPi = Pagination.getPageInfo(slistCount, currentPage, 5, 10);
		ArrayList<StoreOrder> slist = adMemService.selectStoreOrderList(sPi);
				
		model.addAttribute("cPi", cPi);
		model.addAttribute("clist", clist);

		model.addAttribute("sPi", sPi);
		model.addAttribute("slist", slist);
		return "member/admin/adminOrderList";
	}
	
	@ResponseBody
	@RequestMapping(value="sodelete.ad")
	public String deleteStoreOrderList(String hiddenList) {
		
		String[] slist = hiddenList.split(",");
		int result = 1;
		
		for(int i=0; i<slist.length; i++) {
			String storeNo = slist[i];
			System.out.println(storeNo);
			result *= adMemService.deleteStoreOrder(storeNo);
		}
		
		return result>0? "success" : "fail";
	}
	
	@RequestMapping(value="sodetail.ad")
	public String selectStoreOrderDetailF(String ono, Model model) {
		StoreOrder so = adMemService.selectStoreOrder(ono);
		ArrayList<StoreBuyList> buylist = adMemService.selectBuyList(ono);
		System.out.println(buylist);
		model.addAttribute("sOrder", so);
		model.addAttribute("buylist", buylist);
		return "member/admin/adminStoreOrderDetail";
	}
	
	@RequestMapping(value="codetail.ad")
	public String selectClassOrderDetailF(String ono, Model model) {
		ClassOrder co = adMemService.selectClassOrder(ono);
		System.out.println(co);

		model.addAttribute("co", co);
		//model.addAttribute("buylist", buylist);
		return "member/admin/adminClassOrderDetail";
	}
	
	@RequestMapping(value="orcancleF.ad")
	public String orderCancleFrom(String ono, Model model) {
		StoreOrder so = adMemService.selectStoreOrder(ono);
		model.addAttribute("order", so);
		System.out.println(so);
		return "member/admin/adminOrderCancleForm";
	}
	
	@RequestMapping(value="corcancleF.ad")
	public String classOrderCancleFrom(String ono, Model model) {
		ClassOrder co = adMemService.selectClassOrder(ono);
		model.addAttribute("order", co);
		System.out.println(co);
		return "member/admin/adminClassOrderCancleForm";
	}
	
	
	@ResponseBody
	@RequestMapping(value="orcancle.ad")
	public String classOrderCancle(StoreRefund refund, Model model) {
		System.out.println(refund);
		int result1 = adMemService.insertStoreRefund(refund);
		int result2 = adMemService.updateStoreOrderCancle(refund);
		return result1*result2 >0? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="corcancle.ad")
	public String storeOrderCancle(ClassRefund refund, Model model) {
		System.out.println(refund);
		int result = adMemService.insertClassRefund(refund);
		return result >0? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping(value="orsupdate.ad")
	public String updateorderStatus(StoreOrder order) {
		System.out.println(order);
		int result = adMemService.updateorderStatus(order);
		
		return result >0? "success" : "fail";
	}
	
	
	@RequestMapping(value="orsearch.ad")
	public String adminOrderSearch(@RequestParam(value="cpage",defaultValue="1") int currentPage, String category, String key, String sDate, String eDate, String lev, Model model) {

		HashMap<String, String> map = new HashMap<>();
		if(!category.equals("")) {
			map.put("category", category);	
			model.addAttribute("category", category);
		}
		if(!sDate.equals("")) {
			map.put("sDate", sDate);
			model.addAttribute("sDate", sDate);
		}
		if(!eDate.equals("")) {
			map.put("eDate", eDate);
			model.addAttribute("eDate", eDate);
		}
		if(!key.equals("")) {
			map.put("key", key);
			model.addAttribute("key", key);
		}
		
		System.out.println(map);

		if(category.equals("c")) {
			//클래스일 경우 
			int listCount = adMemService.adminSearchClassCount(map);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
			ArrayList<ClassOrder> list = adMemService.adminSearchClassList(map, pi);
 			model.addAttribute("pi", pi);
 			model.addAttribute("list",list);
 			System.out.println(pi);
 			System.out.println(list);
 		}else if(category.equals("s")) {
 			//스토어일 경우 
 			int listCount= adMemService.adminSearchStoreCount(map);
 			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
 			ArrayList<StoreOrder> list = adMemService.adminSearchStoreList(map, pi);
 			model.addAttribute("pi", pi);
 			model.addAttribute("list",list);
 			System.out.println(pi);
 			System.out.println(list);
 		} else {
 			model.addAttribute("errorMsg", "조회에 실패하였습니다.");
 			return "common/errorPage";
 		}
 		
		return "member/admin/adminOrderSearchList";
	}

	
	
	@RequestMapping(value="rplist.ad")
	public String adminReportList(@RequestParam(value="cpage",defaultValue="1") int currentPage, Model model) {
		int listCount = adMemService.adminReportCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Report> reportList = adMemService.adminReportList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("rpList", reportList);
		
		return "member/admin/adminReportList";
	}
	
	@RequestMapping(value="rpdetail.ad")
	public String adminReportDetail(String rpno, String category,  Model model) {
		System.out.println(rpno);
		System.out.println(category);
		Report rp = new Report();
		
		rp.setReportNo(rpno);
		rp.setRefCategory(category);

		
		Report report = adMemService.selectReportDetail(rp);
		System.out.println(report);
		model.addAttribute("rp", report);
		return "member/admin/adminReportDetail";
	}
	
	@RequestMapping(value="blacklist.ad")
	public String adminSelectBlackList(@RequestParam(value="cpage",defaultValue="1") int currentPage, Model model) {
		int listCount = adMemService.adminReportCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<Report> reportList = adMemService.adminReportList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("rpList", reportList);
		
		return "member/admin/adminBlackList";
	}
	
	
	@RequestMapping(value="rpdelete.ad")
	public String adminReportDelete(String rpno, String mno, HttpSession session) {
		
		int result = adMemService.adminReportDelete(rpno);
		Member m = adMemService.selectReportMem(mno);
		int result2 = adMemService.reportCountUp(m);
		
		if(result*result2>0) {
			session.setAttribute("alertMsg", "신고 게시글 삭제가 완료되었습니다.");
		} else {
			session.setAttribute("alertMsg", "신고 게시글 삭제가 실패했습니다.");
		}
		return "redirect:rplist.ad";
	}
	
	@RequestMapping(value="rpback.ad")
	public String adminReportRollback(String rpno, String mno, HttpSession session) {
		
		int result = adMemService.adminReportRollback(rpno);
		Member m = adMemService.selectReportMem(mno);
		int result2 = adMemService.reportCountDown(m);
		
		if(result*result2>0) {
			session.setAttribute("alertMsg", "신고 게시글 복구가 완료되었습니다.");
		} else {
			session.setAttribute("alertMsg", "신고 게시글 복구에 실패했습니다.");
		}
		return "redirect:rplist.ad";
	}
	
	@RequestMapping(value="blList.ad")
	public String adminBlackList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = adMemService.adminBlackListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Member> blList = adMemService.adminReportMemList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("blList", blList);
		return "member/admin/adminBlackListPage";
	}
	
	
	@RequestMapping(value="bmback.ad")
	public String adminBlackMemBack(String mno, HttpSession session) {
		int result = adMemService.blackMemBack(mno);
		if(result>0) {
			session.setAttribute("alertMsg", "회원상태 복구를 완료했습니다.");
		}
		return "redirect:blList.ad";
	}
	
	@RequestMapping(value="bmout.ad")
	public String adminBlackMemOut(String mno, HttpSession session) {
		int result = adMemService.blackMemOut(mno);
		if(result>0) {
			session.setAttribute("alertMsg", "회원상태 복구에 실패했습니다.");
		}
		return "redirect:blList.ad";
	}
	
	@RequestMapping(value="rpsearch.ad")
	public String adminSearchReportList(@RequestParam(value="cpage",defaultValue="1") int currentPage, String key, String status, String sDate, String eDate, Model model) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("status", status);
		model.addAttribute("status", status);
		if(!sDate.equals("")) {
			map.put("sDate", sDate);
			model.addAttribute("sDate", sDate);
		}
		if(!eDate.equals("")) {
			map.put("eDate", eDate);	
			model.addAttribute("eDate", eDate);
		}
		if(!key.equals("")) {
			map.put("key", key);
			model.addAttribute("key", key);
		}

		System.out.println(map);
		int listCount = adMemService.adminReportSearchCount(map);
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Report> rlist = adMemService.adminReportSearchList(pi, map);
		model.addAttribute("pi", pi);
		model.addAttribute("rlist", rlist);
		
		System.out.println(rlist);
		return "member/admin/adminReportSearchList";
	}
}
