package com.kh.oceanclass.Class.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.Class.model.dao.TcClassDao;
import com.kh.oceanclass.Class.model.vo.ClassQna;
import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.PageInfo;

@Service
public class TcClassServiceImpl implements TcClassService {

	@Autowired
	private TcClassDao tcDao;
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<ClassVo> myClassList(int memNo) {
		return tcDao.myClassList(sqlSession, memNo);
	}

	@Override
	public int endClass(int clNo) {
		return tcDao.endClass(sqlSession, clNo);
	}

	@Override
	public int insertClass(ClassVo c) {
		return tcDao.insertClass(sqlSession, c);
	}

	@Override
	public ClassVo updateClassForm(int clNo) {
		return tcDao.updateClassForm(sqlSession, clNo);
	}
	
	@Override
	public int updateClass(ClassVo c) {
		return tcDao.updateClass(sqlSession, c);
	}
	/*
	@Override
	public ArrayList<ClassReview> myClassNameList(int clNo) {
		return tcDao.myClassNameList(sqlSession, clNo);
	}
	*/
	@Override
	public ArrayList<ClassReview> myClassReviewList(int memNo) {
		return tcDao.myClassReviewList(sqlSession, memNo);
	}
	
	@Override
	public int tcQnaListCount(int memNo) {
		return tcDao.tcQnaListCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<ClassQna> myClassQnaList(int memNo, PageInfo pi) {
		return tcDao.myClassQnaList(sqlSession, memNo, pi);
	}

	@Override
	public ClassQna selectTcQnaDetail(int csQnaNo) {
		return tcDao.selectTcQnaDetail(sqlSession, csQnaNo);
	}

	
}
