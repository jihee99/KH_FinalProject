package com.kh.oceanclass.help.model.service;

import java.util.ArrayList;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.help.model.vo.Faq;
import com.kh.oceanclass.help.model.vo.Notice;
import com.kh.oceanclass.help.model.vo.Qna;
import com.kh.oceanclass.member.model.vo.Member;

public interface HelpService {
	
	/* 
	 * 	NOTICE 게시판 
	 */
	// 1. 공지사항 리스트
	int selectListCount();
	ArrayList<Notice> selectList(PageInfo pi);
	
	// 2. 공지사항 상세보기
	int increaseCount(int noNo);
	Notice selectNotice(int noNo);
	
	// 3. 공지사항 검색
	int selectHelpSearchCount(String category);
	ArrayList<Notice> selectHelpSearchList(PageInfo pi, String category);
	
	/*
	 * 	faq 게시판
	 */
	// 1. faq리스트
	ArrayList<Faq> selectFaqList();
	
	
	/*
	 * 	1:1 문의 게시판
	 */
	// 1. qna리스트
	int selectQnaCount();
	ArrayList<Qna> selectQnaList(PageInfo pi);
	// 2. qna 상세보기
	Qna selectQna(int qno);
	
	// 3. qna 작성
	int insertQna(Qna q);
	
	// 4. 카테고리 검색
	int selectCategoryCount(String category);
	ArrayList<Qna> selectCategoryQnaList(PageInfo pi, String category);
	
	// 5. 닉네임 검색
	int selectNickCount(String nickName);
	ArrayList<Qna> selectNickQnaList(PageInfo pi, String nickName);
	
	
	
}

