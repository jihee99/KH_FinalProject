package com.kh.oceanclass.Class.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.Class.model.vo.ClassOrder;
import com.kh.oceanclass.Class.model.vo.ClassQna;
import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.LikeVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.model.vo.Reply;
import com.kh.oceanclass.event.model.vo.Event;
import com.kh.oceanclass.member.model.vo.MemCoupon;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.member.model.vo.Report;

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
	
	public int insertClassReviewReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("classMapper.insertClassReviewReply", r);
	}
	
	public int checkRecommend(SqlSessionTemplate sqlSession, ClassReview cr) {
		return sqlSession.selectOne("classMapper.checkRecommend", cr);
	}
	
	public int deleteRecommend(SqlSessionTemplate sqlSession, ClassReview cr) {
		return sqlSession.delete("classMapper.deleteRecommend", cr);
	}
	
	public int insertRecommend(SqlSessionTemplate sqlSession, ClassReview cr) {
		return sqlSession.insert("classMapper.insertRecommend", cr);
	}
	
	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("classMapper.deleteReply", replyNo);
	}
	
	public int updateReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("classMapper.updateReply", r);
	}
	
	public int enrollReviewCheck(SqlSessionTemplate sqlSession, ClassOrder co) {
		return sqlSession.selectOne("classMapper.enrollReviewCheck", co);
	}
	
	public int insertClassReview(SqlSessionTemplate sqlSession, ClassReview cr) {
		return sqlSession.insert("classMapper.insertClassReview", cr);
	}
	
	public int deleteReview(SqlSessionTemplate sqlSession, int crNo) {
		return sqlSession.update("classMapper.deleteReview", crNo);
	}
	
	public int updateReview(SqlSessionTemplate sqlSession, ClassReview cr) {
		return sqlSession.update("classMapper.updateReview", cr);
	}
	
	public ArrayList<ClassQna> selectClassQnaList(SqlSessionTemplate sqlSession, int clNo){
		return (ArrayList)sqlSession.selectList("classMapper.selectClassQnaList", clNo);
	}
	
	public ArrayList<ClassQna> selectClassQnaMainList(SqlSessionTemplate sqlSession, int clNo){
		RowBounds rowBounds = new RowBounds(0, 3);
		return (ArrayList)sqlSession.selectList("classMapper.selectClassQnaList", clNo, rowBounds);
	}
	
	public int insertClassQna(SqlSessionTemplate sqlSession, ClassQna cq) {
		return sqlSession.insert("classMapper.insertClassQna", cq);
	}
	
	public int deleteClassQna(SqlSessionTemplate sqlSession, ClassQna cq) {
		return sqlSession.update("classMapper.deleteClassQna", cq);
	}
	
	public int updateClassQna(SqlSessionTemplate sqlSession, ClassQna cq) {
		return sqlSession.update("classMapper.updateClassQna", cq);
	}
	
	public int classQnaPwdCheck(SqlSessionTemplate sqlSession, ClassQna cq) {
		return sqlSession.selectOne("classMapper.classQnaPwdCheck", cq);
	}
	
	public int classQnaListCount(SqlSessionTemplate sqlSession, int referNo) {
		return sqlSession.selectOne("classMapper.classQnaListCount", referNo);
	}
	
	public ArrayList<ClassQna> selectClassQnaListPaging(SqlSessionTemplate sqlSession, int referNo, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("classMapper.selectClassQnaList", referNo, rowBounds);
	}

	public ArrayList<ClassVo> classHotList(SqlSessionTemplate sqlSession){
		RowBounds rowBounds = new RowBounds(0, 6);
		return (ArrayList)sqlSession.selectList("classMapper.classHotList", null, rowBounds);
	}
	
	public ArrayList<ClassVo> classNewList(SqlSessionTemplate sqlSession){
		RowBounds rowBounds = new RowBounds(0, 6);
		return (ArrayList)sqlSession.selectList("classMapper.classNewList", null, rowBounds);
	}
	
	public int classCategoryListCount(SqlSessionTemplate sqlSession, String category) {
		return sqlSession.selectOne("classMapper.classCategoryListCount", category);
	}
	
	public ArrayList<ClassVo> classCategoryList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("classMapper.classCategoryList", map, rowBounds);
	}
	
	public ArrayList<Event> mainSlideList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("classMapper.mainSlideList");
	}
	
	public int classPayCk(SqlSessionTemplate sqlSession, ClassOrder co) {
		return sqlSession.selectOne("classMapper.classPayCk", co);
	}
	
	public ArrayList<MemCoupon> memberCouponList(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("classMapper.memberCouponList", memNo);
	}

	public MemCoupon useCouponData(SqlSessionTemplate sqlSession, int useCouponNo) {
		return sqlSession.selectOne("classMapper.useCouponData", useCouponNo);
	}
	
	public int insertClassOrder(SqlSessionTemplate sqlSession, ClassOrder co) {
		return sqlSession.insert("classMapper.insertClassOrder", co);
	}
	
	public ClassOrder selectClassOrder(SqlSessionTemplate sqlSession, ClassOrder co) {
		return sqlSession.selectOne("classMapper.selectClassOrder", co);
	}
	
	public int insertUsePoint(SqlSessionTemplate sqlSession, ClassOrder coInfo) {
		return sqlSession.insert("classMapper.insertUsePoint", coInfo);
	}
	
	public int deleteCoupon(SqlSessionTemplate sqlSession, ClassOrder coInfo) {
		return sqlSession.update("classMapper.deleteCoupon", coInfo);
	}
	
	public int downMemberPoint(SqlSessionTemplate sqlSession, ClassOrder coInfo) {
		return sqlSession.update("classMapper.downMemberPoint", coInfo);
	}
	
	public int insertSavingPoint(SqlSessionTemplate sqlSession, ClassOrder coInfo) {
		return sqlSession.insert("classMapper.insertSavingPoint", coInfo);
	}
	
	public int upMemberPoint(SqlSessionTemplate sqlSession, ClassOrder coInfo) {
		return sqlSession.update("classMapper.upMemberPoint", coInfo);
	}
	
	public ClassReview selectReview(SqlSessionTemplate sqlSession, String refBNo) {
		return sqlSession.selectOne("classMapper.selectReview", refBNo);
	}
	
	public int reportReview(SqlSessionTemplate sqlSession, Report rp) {
		return sqlSession.insert("classMapper.reportReview", rp);
	}
	
	public Reply selectReply(SqlSessionTemplate sqlSession, String refBNo) {
		return sqlSession.selectOne("classMapper.selectReply", refBNo);
	}
	
	public int reportReviewReply(SqlSessionTemplate sqlSession, Report rp) {
		return sqlSession.insert("classMapper.reportReviewReply", rp);
	}
	
	public ClassQna selectQna(SqlSessionTemplate sqlSession, String refBNo) {
		return sqlSession.selectOne("classMapper.selectQna", refBNo);
	}
	
	public int reportQna(SqlSessionTemplate sqlSession, Report rp) {
		return sqlSession.insert("classMapper.reportQna", rp);
	}
	
	public Member selectMember(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("classMapper.selectMember", memNo);
	}
}
