package com.kh.oceanclass.Class.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.Class.model.dao.ClassDao;
import com.kh.oceanclass.Class.model.vo.ClassVo;

@Service
public class ClassServiceImpl implements ClassService {

	@Autowired
	private ClassDao cDao;
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	
	@Override
	public int increaseCount(int clNo) {
		return cDao.increaseCount(sqlSession, clNo);
	}

	@Override
	public ClassVo selectClass(int clNo) {
		return cDao.selectClass(sqlSession, clNo);
	}
	
}
