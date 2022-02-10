package com.kh.oceanclass.Class.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.Class.model.vo.ClassVo;

@Repository
public class ClassDao {

	public int increaseCount(SqlSessionTemplate sqlSession, int clNo) {
		return sqlSession.update("classMapper.increaseCount", clNo);
	}
	
	public ClassVo selectClass(SqlSessionTemplate sqlSession, int clNo) {
		return sqlSession.selectOne("classMapper.selectClass", clNo);
	}
	
}
