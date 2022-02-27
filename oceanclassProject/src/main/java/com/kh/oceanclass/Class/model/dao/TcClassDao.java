package com.kh.oceanclass.Class.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.Class.model.vo.ClassQna;
import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.event.model.vo.Event;
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
	
	public int tcQnaListCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("tcclassMapper.tcQnaListCount", memNo);
	}
	
	public ArrayList<ClassQna> myClassQnaList(SqlSessionTemplate sqlSession, int memNo, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("tcclassMapper.myClassQnaList", memNo, rowBounds);
	}
	
	public ClassQna selectTcQnaDetail(SqlSessionTemplate sqlSession, int csQnaNo) {
		return sqlSession.selectOne("tcclassMapper.selectTcQnaDetail", csQnaNo);
	}
	
}
