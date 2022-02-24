package com.kh.oceanclass.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.Class.model.vo.ClassOrder;
import com.kh.oceanclass.Class.model.vo.ClassRefund;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.member.model.dao.AdminMemDao;
import com.kh.oceanclass.member.model.vo.Coupon;
import com.kh.oceanclass.member.model.vo.MemCoupon;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.member.model.vo.Point;
import com.kh.oceanclass.member.model.vo.Report;
import com.kh.oceanclass.store.model.vo.StoreBuyList;
import com.kh.oceanclass.store.model.vo.StoreOrder;
import com.kh.oceanclass.store.model.vo.StoreRefund;

@Service
public class AdminMemServiceImpl implements AdminMemService {

	@Autowired
	private AdminMemDao adMemDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member loginAdmin(Member m) {
		return adMemDao.loginAdmin(sqlSession, m);
	}
	
	@Override
	public int selectMemCount() {
		return adMemDao.selectMemCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectMemList(PageInfo pi) {
		return adMemDao.selectMemList(sqlSession, pi);
	}
	
	@Override
	public int selectSearchMemCount(HashMap<String, String> map) {
		return adMemDao.selectSearchMemCount(sqlSession, map);
	}

	@Override
	public ArrayList<Member> selectSearchMemList(PageInfo pi, HashMap<String, String> map) {
		return adMemDao.selectSearchMemList(sqlSession, map, pi);
	}
	
//-----------------------------------------------------------------------	
	
	@Override
	public int adminReportCount() {
		return adMemDao.selectReportCount(sqlSession);
	}
	
	@Override
	public ArrayList<Report> adminReportList(PageInfo pi) {
		return adMemDao.selectReportList(sqlSession, pi);
	}

	@Override
	public Report selectReportDetail(Report rp) {
		return adMemDao.selectReportDetail(sqlSession, rp);
	}

	@Override 
	public Member selectReportMem(String mno) {
		return adMemDao.selectReportMem(sqlSession, mno);
	}
	
	@Override
	public int adminReportRollback(String reportNo) {
		return adMemDao.adminReportRollback(sqlSession, reportNo);
	}

	@Override
	public int adminReportDelete(String reportNo) {
		return adMemDao.adminReportDelete(sqlSession, reportNo);
	}

	@Override
	public int adminBlackListCount() {
		return adMemDao.adminBlackListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> adminReportMemList(PageInfo pi) {
		return adMemDao.adminReportMemList(sqlSession, pi);
	}

	@Override
	public int blackMemBack(String mno) {
		// 블랙리스트 등록 회원 복구
		return adMemDao.blackMemBack(sqlSession, mno);
	}

	@Override
	public int blackMemOut(String mno) {
		// 블랙리스트 등록 회원 탈퇴
		return adMemDao.blackMemOut(sqlSession, mno);
	}
	
	@Override
	public int adminReportSearchCount(HashMap<String, String> map) {
		return adMemDao.adminReportSearchCount(sqlSession, map);
	}

	@Override
	public ArrayList<Report> adminReportSearchList(PageInfo pi, HashMap<String, String> map) {
		return adMemDao.adminReportSearchLig(sqlSession, pi, map);
	}
	
	
	@Override
	public int selectPointCount() {
		return adMemDao.selectPointCount(sqlSession);
	}

	@Override
	public ArrayList<Point> selectPointList(PageInfo pi) {
		return adMemDao.selectPointList(sqlSession, pi);
	}

	@Override
	public int adminEnrollPoint(Point p) {
		return adMemDao.adminEnrollPoint(sqlSession, p);
	}

	
	@Override
	public int selectCouponCount() {
		return adMemDao.selectCouponCount(sqlSession);
	}
	
	@Override
	public ArrayList<Coupon> selectCouponList(PageInfo pi) {
		return adMemDao.selectCouponList(sqlSession, pi);
	}

	@Override
	public int adminEnrollCoupon(Coupon c) {
		return adMemDao.adminEnrollCoupon(sqlSession, c);
	}

	@Override
	public int deleteCoupon(int cno) {
		return adMemDao.deleteCoupon(sqlSession, cno);
	}
	
	@Override
	public Coupon selectCoupon(int cno) {
		return adMemDao.selectCoupon(sqlSession, cno);
	}
	
	@Override
	public int insertMemCoupon(MemCoupon memC) {
		return adMemDao.insertMemCoupon(sqlSession, memC);
	}

	@Override
	public ArrayList<Member> selectAllMember() {
		return adMemDao.selectAllMember(sqlSession);
	}

	@Override
	public int updateCoupon(Coupon c) {
		return adMemDao.updateCoupon(sqlSession, c);
	}

	@Override
	public int selectPointSearchCount(HashMap<String, String> map) {
		return adMemDao.selectPointSearchCount(sqlSession, map);
	}

	@Override
	public ArrayList<Point> selectPointSearchList(PageInfo pi, HashMap<String, String> map) {
		return adMemDao.selectPointSearchList(sqlSession, pi, map);
	}

	@Override
	public int selectCouponSearchCount(HashMap<String, String> map) {
		return adMemDao.selectCouponSearchCount(sqlSession, map);
	}

	@Override
	public ArrayList<Coupon> selectCouponSearchList(PageInfo pi, HashMap<String, String> map) {
		return adMemDao.selectCouponSearchList(sqlSession, pi, map);
	}
	
	
	@Override
	public int selectClassOrderCount() {
		return adMemDao.selectClassOrderCount(sqlSession);
	}

	@Override
	public ArrayList<ClassOrder> selectClassOrderList(PageInfo pi) {
		return adMemDao.selectClassOrderList(sqlSession, pi);
	}

	@Override
	public int selectStoreOrderCount() {
		return adMemDao.selectStoreOrderCount(sqlSession);
	}

	@Override
	public ArrayList<StoreOrder> selectStoreOrderList(PageInfo pi) {
		return adMemDao.selectStoreOrderList(sqlSession, pi);
	}
	
	@Override
	public int deleteStoreOrder(String storeNo) {
		return adMemDao.deleteStoreOrder(sqlSession, storeNo);
	}
	
	@Override
	public int deleteClassOrder(String classNo) {
		return adMemDao.deleteClassOrder(sqlSession, classNo);
	}
	
	@Override
	public ClassOrder selectClassOrder(String classNo) {
		return adMemDao.selectClassOrder(sqlSession, classNo);
	}

	@Override
	public StoreOrder selectStoreOrder(String sOrderNo) {
		return adMemDao.selectStoreOrder(sqlSession, sOrderNo);
	}

	@Override
	public ArrayList<StoreBuyList> selectBuyList(String sOrderNo) {
		return adMemDao.selectBuyList(sqlSession, sOrderNo);
	}

	@Override
	public int insertStoreRefund(StoreRefund refund) {
		return adMemDao.insertStoreRefund(sqlSession, refund);
	}

	@Override
	public int updateStoreOrderCancle(StoreRefund refund) {
		return adMemDao.updateStoreOrderCancle(sqlSession, refund);
	}

	@Override
	public int updateorderStatus(StoreOrder order) {
		return adMemDao.updateorderStatus(sqlSession, order);
	}

	@Override
	public int insertClassRefund(ClassRefund refund) {
		return adMemDao.insertClassRefund(sqlSession, refund);
	}

	@Override
	public int adminSearchClassCount(HashMap<String, String> map) {
		return adMemDao.adminSearchClassCount(sqlSession, map);
	}
	
	@Override
	public ArrayList<ClassOrder> adminSearchClassList(HashMap<String, String> map, PageInfo pi) {
		return adMemDao.selectSearchClassList(sqlSession, map, pi);
	}


	@Override
	public int adminSearchStoreCount(HashMap<String, String> map) {
		return adMemDao.adminSearchStoreCount(sqlSession, map);
	}

	@Override
	public ArrayList<StoreOrder> adminSearchStoreList(HashMap<String, String> map, PageInfo pi) {
		return adMemDao.adminSearchStoreList(sqlSession, map, pi);
	}

	@Override
	public int reportCountDown(Member m) {
		return adMemDao.reportCountDown(sqlSession, m);
	}

	@Override
	public int reportCountUp(Member m) {
		return adMemDao.reportCountUp(sqlSession, m);
	}




	



}
