package com.kh.oceanclass.member.model.service;

import java.util.ArrayList;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.member.model.vo.Coupon;
import com.kh.oceanclass.member.model.vo.MemCoupon;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.member.model.vo.Point;
import com.kh.oceanclass.member.model.vo.Report;

public interface AdminMemService {
	
	//나중에 검색도 추가하기
	
	//관리자 로그인기능
	Member loginAdmin(Member m);
	
	//관리자 전체회원 조회기능
	int selectMemCount();
	ArrayList<Member> selectMemList(PageInfo pi);
	
	int selectSMemCount();
	ArrayList<Member> selectSMemList(PageInfo pi);
	
	int selectTMemCount();
	ArrayList<Member> selectTMemList(PageInfo pi);
	
	
	//------------신고------------
	//관리자 신고내역 조회기능
	ArrayList<Report> adminReportList(PageInfo pi);
	
	//관리자 신고내역 상세보기 기능
	Report adminReportdetail(int reportNo);
	
	//관리자 신고내역 복구 기능
	int adminReportRestore(int reportNo);
	
	//관리자 신고내역 삭제 기능(블랙리스트로 등록)
	int adminReportDelete(int reportNo);
	
	//관리자 회원별 신고횟수 조회 기능(신고횟수가 3회 이상인 회원은 자동 블랙리스트 처리)
	ArrayList<Member> adminReportMemList(Member m, PageInfo pi);
	
	//회원탈퇴하기 기능도 있어야 하는지 물어보기
	
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
	
	//관리자 쿠폰발급 기능
	int adminMemCoupon(MemCoupon mc);
	
	
	//------------주문------------
	//관리자 클래스 주문목록조회기능
	
	//관리자 스토어 주문목록조회기능
	
	//관리자 주문목록 상세조회 기능
	
	//관리자 주문상태변경기능 
	
	//환불처리 어떻게 하지..................................................
	//미쳤나봐 왜이렇게 많지, 언제 다해.?
}
