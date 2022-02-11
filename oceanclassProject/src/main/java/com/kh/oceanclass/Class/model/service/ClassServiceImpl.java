package com.kh.oceanclass.Class.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.Class.model.dao.ClassDao;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.LikeVo;

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
	
	@Override
	public ArrayList<ClassVo> classSearchList(String keyword) {
		return cDao.classSearchList(sqlSession, keyword);
	}

	@Override
	public int checkClassLike(LikeVo li) {
		return cDao.checkClassLike(sqlSession, li);
	}
	
	@Override
	public int insertClassLike(LikeVo li) {
		return cDao.insertClassLike(sqlSession, li);
	}

	@Override
	public int deleteClassLike(LikeVo li) {
		return cDao.deleteClassLike(sqlSession, li);
	}

	
}
