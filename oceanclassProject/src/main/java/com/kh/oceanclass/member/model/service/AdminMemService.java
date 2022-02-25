package com.kh.oceanclass.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.oceanclass.Class.model.vo.ClassOrder;
import com.kh.oceanclass.Class.model.vo.ClassRefund;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.member.model.vo.Coupon;
import com.kh.oceanclass.member.model.vo.MemCoupon;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.member.model.vo.Point;
import com.kh.oceanclass.member.model.vo.Report;
import com.kh.oceanclass.store.model.vo.StoreBuyList;
import com.kh.oceanclass.store.model.vo.StoreOrder;
import com.kh.oceanclass.store.model.vo.StoreRefund;

public interface AdminMemService {
	
	//나중에 검색도 추가하기
	
	//관리자 로그인기능
	Member loginAdmin(Member m);
	
	//관리자 전체회원 조회기능
	int selectMemCount();
	ArrayList<Member> selectMemList(PageInfo pi);
	
	int selectSearchMemCount(HashMap<String, String> map);
	ArrayList<Member> selectSearchMemList(PageInfo pi, HashMap<String, String> map);

	
	//------------신고------------
	//관리자 신고내역 조회기능
	int adminReportCount();
	ArrayList<Report> adminReportList(PageInfo pi);
	
	//관리자 신고내역 상세보기 기능
	Report selectReportDetail(Report rp);
	
	//관리자 신고내역 복구 기능
	int adminReportRollback(String reportNo);
	int reportCountDown(Member m);
	
	//관리자 신고내역 삭제 기능(블랙리스트로 등록)
	int adminReportDelete(String reportNo);
	int reportCountUp(Member m);
	
	//신고횟수 변경을 위한 회원 조회
	Member selectReportMem(String mno);
	
	//관리자 회원별 신고횟수 조회 기능(신고횟수가 3회 이상인 회원은 자동 블랙리스트 처리)
	int adminBlackListCount();
	ArrayList<Member> adminReportMemList(PageInfo pi);
	
	//블랙리스트 회원 복구하기 기능
	int blackMemBack(String mno);
	
	//블랙리스트 회원 탈퇴하기 기능
	int blackMemOut(String mno);
	
	// 신고 검색기능
	int adminReportSearchCount(HashMap<String, String> map);
	ArrayList<Report> adminReportSearchList(PageInfo pi, HashMap<String, String> map);
	
	//------------쿠폰/포인트------------
	//관리자포인트목록조회기능
	int selectPointCount();
	ArrayList<Point> selectPointList(PageInfo pi);
	
	//관리자 포인트지급기능
	int adminEnrollPoint(Point p);
	
	//관리자쿠폰목록조회기능
	int selectCouponCount();
	ArrayList<Coupon> selectCouponList(PageInfo pi);
	
	//관리자 쿠폰 목록 등록 기능
	int adminEnrollCoupon(Coupon c);
	
	//쿠폰목록 삭제 기능
	int deleteCoupon(int cno);
	
	//관리자 쿠폰발급 기능
	Coupon selectCoupon(int cno);
	int insertMemCoupon(MemCoupon mc);
	
	//멤버 전체리스트 불러오기
	ArrayList<Member> selectAllMember();
	
	//쿠폰정보 수정하기
	int updateCoupon(Coupon c);
	
	ArrayList<Coupon> selectAllCouponList();
	
	//------------주문------------
	//관리자 클래스 주문목록조회기능
	int selectClassOrderCount();
	ArrayList<ClassOrder> selectClassOrderList(PageInfo pi);
	
	//관리자 스토어 주문목록조회기능
	int selectStoreOrderCount();
	ArrayList<StoreOrder> selectStoreOrderList(PageInfo pi);

	//관리자 스토어 주문내역 삭제 기능
	int deleteStoreOrder(String storeNo);
	
	//관리자 클래스 주문내역 삭제기능
	int deleteClassOrder(String classNo);
	
	//관리자 클래스 주문 상세조회
	ClassOrder selectClassOrder(String classNo);
	
	// 관리자 스토어 주문 상세조회 
	StoreOrder selectStoreOrder(String sOrderNo);
	ArrayList<StoreBuyList> selectBuyList(String sOrderNo);
	
	
	//관리자 주문취소
	int insertStoreRefund(StoreRefund refund);
	int updateStoreOrderCancle(StoreRefund refund);

	int updateorderStatus(StoreOrder order);
	
	int insertClassRefund(ClassRefund refund);

	int adminSearchClassCount(HashMap<String, String> map);
	ArrayList<ClassOrder> adminSearchClassList(HashMap<String, String> map, PageInfo pi);

	int adminSearchStoreCount(HashMap<String, String> map);
	ArrayList<StoreOrder> adminSearchStoreList(HashMap<String, String> map, PageInfo pi);

	int selectPointSearchCount(HashMap<String, String> map);

	ArrayList<Point> selectPointSearchList(PageInfo pi, HashMap<String, String> map);

	int selectCouponSearchCount(HashMap<String, String> map);
	ArrayList<Coupon> selectCouponSearchList(PageInfo pi, HashMap<String, String> map);
	
	
}
