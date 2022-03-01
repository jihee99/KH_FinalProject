package com.kh.oceanclass.common.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.common.model.dao.InstructorChartDao;
import com.kh.oceanclass.common.model.vo.InstructorQnaChart;
import com.kh.oceanclass.common.model.vo.InstructorStarChart;
import com.kh.oceanclass.store.model.vo.Product;

@Service
public class InstructorChartServiceImpl implements InstructorChartService{
	
	@Autowired
	private InstructorChartDao inDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Product> productList() {
		// 상품 전체 리스트 불러오는 메소드
		return inDao.productList(sqlSession);
	}

	@Override
	public ArrayList<InstructorStarChart> starChartList(String productNo) {
		// 별점 카운트하는 메소드
		return inDao.starChartList(sqlSession, productNo);
	}

	@Override
	public ArrayList<InstructorQnaChart> qnaChartList(String productNo) {
		// 문의사항 카운트하는 메소드
		return inDao.qnaChartList(sqlSession, productNo);
	}

	@Override
	public ArrayList<InstructorStarChart> mainStarChart() {
		return inDao.mainStarChart(sqlSession);
	}

	@Override
	public ArrayList<InstructorQnaChart> mainQnaChart() {
		// TODO Auto-generated method stub
		return inDao.mainQnaChart(sqlSession);
	}

}
