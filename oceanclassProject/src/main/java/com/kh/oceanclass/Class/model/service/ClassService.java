package com.kh.oceanclass.Class.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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

public interface ClassService {

	// 클래스 메인용
	ArrayList<ClassVo> classHotList();
	ArrayList<ClassVo> classNewList();
	ArrayList<Event> mainSlideList();
	int classCategoryListCount(String category);
	ArrayList<ClassVo> classCategoryList(HashMap<String, String> map, PageInfo pi);
	
	// 클래스 상세보기용
	int increaseCount(int clNo);
	ClassVo selectClass(int clNo);
	
	// 클래스 리뷰용
	ArrayList<ClassReview> selectClassReviewList(int clNo);
	ArrayList<ClassReview> selectClassReviewTopList(int clNo);
	ArrayList<ClassReview> selectClassReviewMainList(int clNo);
	int classReviewListCount(int clNo);
	ArrayList<ClassReview> selectClassReviewListPaging(int clNo, PageInfo pi);
	ClassReview selectClassReviewDetail(int crNo);
	int enrollReviewCheck(ClassOrder co);
	int insertClassReview(ClassReview cr);
	int deleteReview(int crNo);
	int updateReview(ClassReview cr);
	
	// 클래스 리뷰 댓글용
	int selectReplyListCount(int crNo);
	ArrayList<Reply> selectReplyList(int crNo, PageInfo pi);
	int insertClassReviewReply(Reply r);
	int deleteReply(int replyNo);
	int updateReply(Reply r);
	
	// 클래스 검색용
	int classSearchListCount(HashMap<String, String> map);
	ArrayList<ClassVo> classSearchList(HashMap<String, String> map, PageInfo pi);

	// 클래스 찜하기용
	int checkClassLike(LikeVo li);
	int insertClassLike(LikeVo li);
	int deleteClassLike(LikeVo li);
	
	// 클래스 추천용
	int checkRecommend(ClassReview cr);
	int deleteRecommend(ClassReview cr);
	int insertRecommend(ClassReview cr);
	
	// 클래스 문의용
	ArrayList<ClassQna> selectClassQnaList(int clNo);
	ArrayList<ClassQna> selectClassQnaMainList(int clNo);
	int insertClassQna(ClassQna cq);
	int deleteClassQna(ClassQna cq);
	int updateClassQna(ClassQna cq);
	int classQnaPwdCheck(ClassQna cq);
	int classQnaListCount(int referNo);
	ArrayList<ClassQna> selectClassQnaListPaging(int referNo, PageInfo pi);
	
	// 클래스 구매용
	int classPayCk(ClassOrder co);
	ArrayList<MemCoupon> memberCouponList(int memNo);
	MemCoupon useCouponData(int useCouponNo);
	int insertClassOrder(ClassOrder co);
	ClassOrder selectClassOrder(ClassOrder co);
	int insertUsePoint(ClassOrder coInfo);
	int deleteCoupon(ClassOrder coInfo);
	int downMemberPoint(ClassOrder coInfo);
	int insertSavingPoint(ClassOrder coInfo);
	int upMemberPoint(ClassOrder coInfo);
	Member selectMember(int memNo);
	
	// 클래스 신고하기
	ClassReview selectReview(String refBNo);
	int reportReview(Report rp);
	Reply selectReply(String refBNo);
	int reportReviewReply(Report rp);
	ClassQna selectQna(String refBNo);
	int reportQna(Report rp);
	
	// 카카오페이 
	String kakaoPayReady(ClassOrder co);
}
