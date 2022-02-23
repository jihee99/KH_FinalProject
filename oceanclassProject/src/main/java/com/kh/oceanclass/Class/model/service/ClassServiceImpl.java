package com.kh.oceanclass.Class.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.Class.model.dao.ClassDao;
import com.kh.oceanclass.Class.model.vo.ClassOrder;
import com.kh.oceanclass.Class.model.vo.ClassQna;
import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.LikeVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.model.vo.Reply;
import com.kh.oceanclass.event.model.vo.Event;
import com.kh.oceanclass.member.model.vo.MemCoupon;

@Service
public class ClassServiceImpl implements ClassService {

	@Autowired
	private ClassDao cDao;
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	
	@Override
	public int increaseCount(int clNo) {
		return cDao.increaseCount(sqlSession, clNo);
	}

	@Override
	public ClassVo selectClass(int clNo) {
		return cDao.selectClass(sqlSession, clNo);
	}
	
	@Override
	public int classSearchListCount(HashMap<String, String> map) {
		return cDao.classSearchListCount(sqlSession, map);
	}
	
	@Override
	public ArrayList<ClassVo> classSearchList(HashMap<String, String> map, PageInfo pi) {
		return cDao.classSearchList(sqlSession, map, pi);
	}

	@Override
	public int checkClassLike(LikeVo li) {
		return cDao.checkClassLike(sqlSession, li);
	}
	
	@Override
	public int insertClassLike(LikeVo li) {
		return cDao.insertClassLike(sqlSession, li);
	}

	@Override
	public int deleteClassLike(LikeVo li) {
		return cDao.deleteClassLike(sqlSession, li);
	}

	@Override
	public ArrayList<ClassReview> selectClassReviewList(int clNo) {
		return cDao.selectClassReviewList(sqlSession, clNo);
	}

	@Override
	public ArrayList<ClassReview> selectClassReviewTopList(int clNo) {
		return cDao.selectClassReviewTopList(sqlSession, clNo);
	}

	@Override
	public ArrayList<ClassReview> selectClassReviewMainList(int clNo) {
		return cDao.selectClassReviewMainList(sqlSession, clNo);
	}

	@Override
	public int classReviewListCount(int clNo) {
		return cDao.classReviewListCount(sqlSession, clNo);
	}

	@Override
	public ArrayList<ClassReview> selectClassReviewListPaging(int clNo, PageInfo pi) {
		return cDao.selectClassReviewListPaging(sqlSession, clNo, pi);
	}

	@Override
	public ClassReview selectClassReviewDetail(int crNo) {
		return cDao.selectClassReviewDetail(sqlSession, crNo);
	}

	@Override
	public int selectReplyListCount(int crNo) {
		return cDao.selectReplyListCount(sqlSession, crNo);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int crNo, PageInfo pi) {
		return cDao.selectReplyList(sqlSession, crNo, pi);
	}

	@Override
	public int insertClassReviewReply(Reply r) {
		return cDao.insertClassReviewReply(sqlSession, r);
	}

	@Override
	public int checkRecommend(ClassReview cr) {
		return cDao.checkRecommend(sqlSession, cr);
	}

	@Override
	public int deleteRecommend(ClassReview cr) {
		return cDao.deleteRecommend(sqlSession, cr);
	}

	@Override
	public int insertRecommend(ClassReview cr) {
		return cDao.insertRecommend(sqlSession, cr);
	}

	@Override
	public int deleteReply(int replyNo) {
		return cDao.deleteReply(sqlSession, replyNo);
	}

	@Override
	public int updateReply(Reply r) {
		return cDao.updateReply(sqlSession, r);
	}

	@Override
	public int enrollReviewCheck(ClassOrder co) {
		return cDao.enrollReviewCheck(sqlSession, co);
	}

	@Override
	public int insertClassReview(ClassReview cr) {
		return cDao.insertClassReview(sqlSession, cr);
	}

	@Override
	public int deleteReview(int crNo) {
		return cDao.deleteReview(sqlSession, crNo);
	}

	@Override
	public int updateReview(ClassReview cr) {
		return cDao.updateReview(sqlSession, cr);
	}

	@Override
	public ArrayList<ClassQna> selectClassQnaList(int clNo) {
		return cDao.selectClassQnaList(sqlSession, clNo);
	}

	@Override
	public ArrayList<ClassQna> selectClassQnaMainList(int clNo) {
		return cDao.selectClassQnaMainList(sqlSession, clNo);
	}

	@Override
	public int insertClassQna(ClassQna cq) {
		return cDao.insertClassQna(sqlSession, cq);
	}
	
	@Override
	public int deleteClassQna(ClassQna cq) {
		return cDao.deleteClassQna(sqlSession, cq);
	}
	
	@Override
	public int updateClassQna(ClassQna cq) {
		return cDao.updateClassQna(sqlSession, cq);
	}

	@Override
	public int classQnaPwdCheck(ClassQna cq) {
		return cDao.classQnaPwdCheck(sqlSession, cq);
	}

	@Override
	public int classQnaListCount(int referNo) {
		return cDao.classQnaListCount(sqlSession, referNo);
	}

	@Override
	public ArrayList<ClassQna> selectClassQnaListPaging(int referNo, PageInfo pi) {
		return cDao.selectClassQnaListPaging(sqlSession, referNo, pi);
	}

	@Override
	public ArrayList<ClassVo> classHotList() {
		return cDao.classHotList(sqlSession);
	}
	
	@Override
	public ArrayList<ClassVo> classNewList() {
		return cDao.classNewList(sqlSession);
	}
	
	@Override
	public int classCategoryListCount(String category) {
		return cDao.classCategoryListCount(sqlSession, category);
	}

	@Override
	public ArrayList<ClassVo> classCategoryList(HashMap<String, String> map, PageInfo pi) {
		return cDao.classCategoryList(sqlSession, map, pi);
	}
	
	@Override
	public int classPayCk(ClassOrder co) {
		return cDao.classPayCk(sqlSession, co);
	}
	
	@Override
	public ArrayList<MemCoupon> memberCouponList(int memNo) {
		return cDao.memberCouponList(sqlSession, memNo);
	}
	
	
	
	
	@Override
	public ArrayList<Event> mainSlideList() {
		return cDao.mainSlideList(sqlSession);
	}


}
