package com.kh.oceanclass.Class.model.service;

import java.util.ArrayList;

import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;

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
	
}
