package com.kh.oceanclass.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.member.model.dao.AdminMemDao;
import com.kh.oceanclass.member.model.vo.Coupon;
import com.kh.oceanclass.member.model.vo.MemCoupon;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.member.model.vo.Point;
import com.kh.oceanclass.member.model.vo.Report;

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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Member> adminMemberList(Member m, PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Report> adminReportList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Report adminReportdetail(int reportNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminReportRestore(int reportNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminReportDelete(int reportNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Member> adminReportMemList(Member m, PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Point> adminPointList(Point p, PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminEnrollPoint(Point p) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Coupon> adminCouponList(Coupon c, PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminEnrollCoupon(Coupon c) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminMemCoupon(MemCoupon mc) {
		// TODO Auto-generated method stub
		return 0;
	}

}
