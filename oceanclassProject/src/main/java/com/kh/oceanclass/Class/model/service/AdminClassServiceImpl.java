package com.kh.oceanclass.Class.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.Class.model.dao.AdminClassDao;
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

	
}
