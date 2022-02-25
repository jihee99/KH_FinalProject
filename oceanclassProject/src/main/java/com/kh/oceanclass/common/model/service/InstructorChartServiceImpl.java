package com.kh.oceanclass.common.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.common.model.dao.InstructorChartDao;

@Service
public class InstructorChartServiceImpl implements InstructorChartService{
	
	@Autowired
	private InstructorChartDao inDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
