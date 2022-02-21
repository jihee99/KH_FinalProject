package com.kh.oceanclass.common.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.common.model.dao.AdminChartDao;
import com.kh.oceanclass.common.model.vo.AdminStatistics;

@Service
public class AdminChartServiceImpl implements AdminChartService{
	
	@Autowired
	private AdminChartDao acDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<AdminStatistics> selectStatistics() {
		return acDao.selectStatistics(sqlSession);
	}

	@Override
	public ArrayList<AdminStatistics> selectMemStatistics() {
		return acDao.selectMemStatistics(sqlSession);
	}

	@Override
	public ArrayList<AdminStatistics> selectTeacherStatistics() {
		return acDao.selectTeacherStatistics(sqlSession);
	}

}
