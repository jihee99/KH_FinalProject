package com.kh.oceanclass.Class.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.Class.model.vo.ClassManager;
import com.kh.oceanclass.Class.model.vo.ClassQna;
import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.PageInfo;

@Repository
public class AdminClassDao {

	public int enrollClassListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminClassMapper.enrollClassListCount", map);
	}
	
	public ArrayList<ClassVo> selectEnrollClassList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("adminClassMapper.selectEnrollClassList", map, rowBounds);
	}
	
	public ClassVo selectClassDetail(SqlSessionTemplate sqlSession, String clNo) {
		return sqlSession.selectOne("adminClassMapper.selectClassDetail", clNo);
	}
	
	public int classApproval(SqlSessionTemplate sqlSession, int clNo) {
		return sqlSession.update("adminClassMapper.classApproval", clNo);
	}
	
	public int classReturn(SqlSessionTemplate sqlSession, ClassVo c) {
		return sqlSession.update("adminClassMapper.classReturn", c);
	}
	
	public int classManagerListCount(SqlSessionTemplate sqlSession, ClassManager cm) {
		return sqlSession.selectOne("adminClassMapper.classManagerListCount", cm);
	}
	
	public ArrayList<ClassVo> selectClassManagerList(SqlSessionTemplate sqlSession, ClassManager cm, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminClassMapper.selectClassManagerList", cm, rowBounds);
	}
	
	public int reviewListCount(SqlSessionTemplate sqlSession, ClassManager cm) {
		return sqlSession.selectOne("adminClassMapper.reviewListCount", cm);
	}
	
	public ArrayList<ClassReview> selectReviewList(SqlSessionTemplate sqlSession, ClassManager cm, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminClassMapper.selectReviewList", cm, rowBounds);
	}
	
	public int classShow(SqlSessionTemplate sqlSession, int clNo) {
		return sqlSession.update("adminClassMapper.classShow", clNo);
	}
	
	public int classHide(SqlSessionTemplate sqlSession, int clNo) {
		return sqlSession.update("adminClassMapper.classHide", clNo);
	}
	
	public int reviewShow(SqlSessionTemplate sqlSession, int crNo) {
		return sqlSession.update("adminClassMapper.reviewShow", crNo);
	}
	
	public int reviewHide(SqlSessionTemplate sqlSession, int crNo) {
		return sqlSession.update("adminClassMapper.reviewHide", crNo);
	}
	
	public int qnaListCount(SqlSessionTemplate sqlSession, ClassManager cm) {
		return sqlSession.selectOne("adminClassMapper.qnaListCount", cm);
	}
	
	public ArrayList<ClassQna> selectQnaList(SqlSessionTemplate sqlSession, ClassManager cm, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminClassMapper.selectQnaList", cm, rowBounds);
	}
	
}
