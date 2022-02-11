package com.kh.oceanclass.Class.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.LikeVo;

@Repository
public class ClassDao {

	public int increaseCount(SqlSessionTemplate sqlSession, int clNo) {
		return sqlSession.update("classMapper.increaseCount", clNo);
	}
	
	public ClassVo selectClass(SqlSessionTemplate sqlSession, int clNo) {
		return sqlSession.selectOne("classMapper.selectClass", clNo);
	}
	
	public ArrayList<ClassVo> classSearchList(SqlSessionTemplate sqlSession, String keyword){
		return (ArrayList)sqlSession.selectList("classMapper.classSearchList", keyword);
	}
	
	public int checkClassLike(SqlSessionTemplate sqlSession, LikeVo li) {
		return sqlSession.selectOne("classMapper.checkClassLike", li);
	}
	
	public int insertClassLike(SqlSessionTemplate sqlSession, LikeVo li) {
		return sqlSession.insert("classMapper.insertClassLike", li);
	}
	
	public int deleteClassLike(SqlSessionTemplate sqlSession, LikeVo li) {
		return sqlSession.delete("classMapper.deleteClassLike", li);
	}
}
