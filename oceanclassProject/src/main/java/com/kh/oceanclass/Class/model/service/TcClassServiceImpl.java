package com.kh.oceanclass.Class.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.Class.model.dao.TcClassDao;
import com.kh.oceanclass.Class.model.vo.ClassVo;

@Service
public class TcClassServiceImpl implements TcClassService {

	@Autowired
	private TcClassDao tcDao;
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<ClassVo> myClassList() {
		return tcDao.myClassList(sqlSession);
	}

	
	
}
