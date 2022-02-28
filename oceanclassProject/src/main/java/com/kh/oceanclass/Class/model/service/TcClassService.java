package com.kh.oceanclass.Class.model.service;

import java.util.ArrayList;

import com.kh.oceanclass.Class.model.vo.ClassQna;
import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.PageInfo;

public interface TcClassService {

	// 내 클래스 조회
	ArrayList<ClassVo> myClassList(int memNo);
	
	// 클래스 내리기
	int endClass(int clNo);
	
	// 클래스 등록하기
	int insertClass(ClassVo c);
	
	// 클래스 수정폼
	ClassVo updateClassForm(int clNo);
	
	// 클래스 수정하기
	int updateClass(ClassVo c);
	
	// 클래스 이름 조회
	//ArrayList<ClassReview> myClassNameList(int clNo);
	
	// 클래스 리뷰 조회
	ArrayList<ClassReview> myClassReviewList(int memNo);
	
	// 클래스 문의 조회
	int tcQnaListCount(int memNo);
	ArrayList<ClassQna> myClassQnaList(int memNo, PageInfo pi);
	
	// 클래스 문의 상세보기
	ClassQna selectTcQnaDetail(int csQnaNo);
	
	// 클래스 문의 댓글 작성용 서비스 (ajax)
	int qnaInsertRf(ClassQna cq);
	
}
