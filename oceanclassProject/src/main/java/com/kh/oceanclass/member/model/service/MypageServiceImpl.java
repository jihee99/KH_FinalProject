package com.kh.oceanclass.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.help.model.vo.Qna;
import com.kh.oceanclass.member.model.dao.MypageDao;
import com.kh.oceanclass.member.model.vo.Coupon;
import com.kh.oceanclass.member.model.vo.Member;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageDao myDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
		
	@Override
	public int updateProfile(Member m) {
		return myDao.updateProfile(sqlSession, m);
	}

	@Override
	public int updatePwd(Member m) {
		return myDao.updatePwd(sqlSession, m);
	}

	@Override
	public int deleteMem(String userId) {
		return myDao.deleteMem(sqlSession, userId);
	}
	
	@Override
	public int selectCouponCount(int memNo) {
		return myDao.selectCouponCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<Coupon> selectCouponList(PageInfo pi, int memNo) {
		return myDao.selectCouponList(sqlSession, pi, memNo);
	}

	@Override
	public int selectQnaCount(int memNo) {
		return myDao.selectQnaCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<Qna> selectQnaList(PageInfo pi, int memNo) {
		return myDao.selectQnaList(sqlSession, pi, memNo);
	}

	@Override
	public int myQnaCount(Qna q) {
		return myDao.myQnaCount(sqlSession, q);
	}

	@Override
	public ArrayList<Qna> selectMyQnaList(PageInfo pi, Qna q) {
		return myDao.selectMyQnaList(sqlSession, pi, q);
	}

	@Override
	public int checkNick(String nickName) {
		return myDao.checkNick(sqlSession, nickName);
	}

	@Override
	public int likeClassCount(int memNo) {
		return myDao.likeClassCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<ClassVo> selectLikeClass(PageInfo pi, int memNo) {
		return myDao.selectLikeClass(sqlSession, pi, memNo);
	}




}
