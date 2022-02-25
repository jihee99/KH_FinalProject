package com.kh.oceanclass.Class.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.store.model.vo.Product;

@Repository
public class TcClassDao {

	public ArrayList<ClassVo> myClassList(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("tcclassMapper.myClassList", memNo);
	}
	
	public int endClass(SqlSessionTemplate sqlSession, int clNo) {
		return sqlSession.update("tcclassMapper.endClass",clNo);
	}
	
	public int insertClass(SqlSessionTemplate sqlSession, ClassVo c) {	
		return sqlSession.insert("tcclassMapper.insertClass", c);
	}
	
	public ClassVo updateClassForm(SqlSessionTemplate sqlSession, int clNo) {
		return sqlSession.selectOne("tcclassMapper.updateClassForm",clNo);
	}
	
	public int updateClass(SqlSessionTemplate sqlSession, ClassVo c) {	
		return sqlSession.update("tcclassMapper.updateClass", c);
	}
	/*
	public ArrayList<ClassReview> myClassNameList(SqlSessionTemplate sqlSession, int clNo){
		return (ArrayList)sqlSession.selectList("tcclassMapper.myClassNameList", clNo);
	}
	*/
	public ArrayList<ClassReview> myClassReviewList(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("tcclassMapper.myClassReviewList", memNo);
	}
	
}
