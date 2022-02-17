package com.kh.oceanclass.Class.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.LikeVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.model.vo.Reply;

@Repository
public class ClassDao {

	public int increaseCount(SqlSessionTemplate sqlSession, int clNo) {
		return sqlSession.update("classMapper.increaseCount", clNo);
	}
	
	public ClassVo selectClass(SqlSessionTemplate sqlSession, int clNo) {
		return sqlSession.selectOne("classMapper.selectClass", clNo);
	}
	
	public int classSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map){
		return sqlSession.selectOne("classMapper.classSearchListCount", map);
	}
	
	public ArrayList<ClassVo> classSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("classMapper.classSearchList", map, rowBounds);
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
	
	public ArrayList<ClassReview> selectClassReviewList(SqlSessionTemplate sqlSession, int clNo){
		return (ArrayList)sqlSession.selectList("classMapper.selectClassReviewList", clNo);
	}
	
	public ArrayList<ClassReview> selectClassReviewTopList(SqlSessionTemplate sqlSession, int clNo){
		RowBounds rowBounds = new RowBounds(0, 5);
		return (ArrayList)sqlSession.selectList("classMapper.selectClassReviewTopList", clNo, rowBounds);
	}
	
	public ArrayList<ClassReview> selectClassReviewMainList(SqlSessionTemplate sqlSession, int clNo){
		RowBounds rowBounds = new RowBounds(0, 4);
		return (ArrayList)sqlSession.selectList("classMapper.selectClassReviewMainList", clNo, rowBounds);
	}
	
	public int classReviewListCount(SqlSessionTemplate sqlSession, int clNo) {
		return sqlSession.selectOne("classMapper.classReviewListCount", clNo);
	}
	
	public ArrayList<ClassReview> selectClassReviewListPaging(SqlSessionTemplate sqlSession, int clNo, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("classMapper.selectClassReviewList", clNo, rowBounds);
	}
	
	public ClassReview selectClassReviewDetail(SqlSessionTemplate sqlSession, int crNo) {
		return sqlSession.selectOne("classMapper.selectClassReviewDetail", crNo);
	}
	
	public int selectReplyListCount(SqlSessionTemplate sqlSession, int crNo) {
		return sqlSession.selectOne("classMapper.selectReplyListCount", crNo);
	}
	
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int crNo, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("classMapper.selectReplyList", crNo, rowBounds);
	}
	
}
