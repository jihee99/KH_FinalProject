package com.kh.oceanclass.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int selectSMemCount() {
		return adMemDao.selectSMemCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectSMemList(PageInfo pi) {
		return adMemDao.selectSMemList(sqlSession, pi);
	}

	@Override
	public int selectTMemCount() {
		return adMemDao.selectTMemCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectTMemList(PageInfo pi) {
		return adMemDao.selectTMemList(sqlSession, pi);
	}
	
	
	
	
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Point> selectPointList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminEnrollPoint(Point p) {
		// TODO Auto-generated method stub
		return 0;
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
	public int selectClassOrderCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<ClassVo> selectClassOrderList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
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
	public ClassVo selectClassOrder(String cOrderNo) {
		// TODO Auto-generated method stub
		return null;
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

	



}
