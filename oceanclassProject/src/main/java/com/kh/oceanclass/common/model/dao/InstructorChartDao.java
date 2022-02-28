package com.kh.oceanclass.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.common.model.vo.InstructorQnaChart;
import com.kh.oceanclass.common.model.vo.InstructorStarChart;
import com.kh.oceanclass.store.model.vo.Product;

@Repository
public class InstructorChartDao {

	public ArrayList<Product> productList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("inChartMapper.productList");
	}

	public ArrayList<InstructorStarChart> starChartList(SqlSessionTemplate sqlSession, String productNo) {
		return (ArrayList)sqlSession.selectList("inChartMapper.starChartList", productNo);
	}

	public ArrayList<InstructorQnaChart> qnaChartList(SqlSessionTemplate sqlSession, String productNo) {
		return (ArrayList)sqlSession.selectList("inChartMapper.qnaChartList", productNo);
	}

	
	
}
