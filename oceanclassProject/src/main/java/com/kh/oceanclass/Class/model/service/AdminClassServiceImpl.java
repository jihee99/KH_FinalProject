package com.kh.oceanclass.Class.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.Class.model.dao.AdminClassDao;
import com.kh.oceanclass.Class.model.vo.ClassManager;
import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.PageInfo;

@Service
public class AdminClassServiceImpl implements AdminClassService {

	@Autowired
	private AdminClassDao acDao;
	
	@Autowired
	public SqlSessionTemplate sqlSession;

	@Override
	public int enrollClassListCount(HashMap<String, String> map) {
		return acDao.enrollClassListCount(sqlSession, map);
	}
	
	@Override
	public ArrayList<ClassVo> selectEnrollClassList(HashMap<String, String> map, PageInfo pi) {
		return acDao.selectEnrollClassList(sqlSession, map, pi);
	}

	@Override
	public ClassVo selectClassDetail(String clNo) {
		return acDao.selectClassDetail(sqlSession, clNo);
	}

	@Override
	public int classApproval(int clNo) {
		return acDao.classApproval(sqlSession, clNo);
	}

	@Override
	public int classReturn(ClassVo c) {
		return acDao.classReturn(sqlSession, c);
	}

	@Override
	public int classManagerListCount(ClassManager cm) {
		return acDao.classManagerListCount(sqlSession, cm);
	}

	@Override
	public ArrayList<ClassVo> selectClassManagerList(ClassManager cm, PageInfo pi) {
		return acDao.selectClassManagerList(sqlSession, cm, pi);
	}

	@Override
	public int reviewListCount(ClassManager cm) {
		return acDao.reviewListCount(sqlSession, cm);
	}
	
	@Override
	public ArrayList<ClassReview> selectReviewList(ClassManager cm, PageInfo pi) {
		return acDao.selectReviewList(sqlSession, cm, pi);
	}

	@Override
	public int classShow(int clNo) {
		return acDao.classShow(sqlSession, clNo);
	}
	
	@Override
	public int classHide(int clNo) {
		return acDao.classHide(sqlSession, clNo);
	}
}
