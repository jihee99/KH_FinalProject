package com.kh.oceanclass.Class.model.service;

import java.util.ArrayList;

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
	public int enrollClassListCount() {
		return acDao.enrollClassListCount(sqlSession);
	}
	
	@Override
	public ArrayList<ClassVo> selectEnrollClassList(int array, PageInfo pi) {
		return acDao.selectEnrollClassList(sqlSession, array, pi);
	}

	
}
