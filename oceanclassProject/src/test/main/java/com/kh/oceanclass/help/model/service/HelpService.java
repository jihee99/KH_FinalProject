package com.kh.oceanclass.help.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.help.model.vo.Faq;
import com.kh.oceanclass.help.model.vo.Notice;
import com.kh.oceanclass.help.model.vo.Qna;

@Service
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
	
	/*
	 * 	faq 게시판
	 */
	// 1. faq리스트
	ArrayList<Faq> selectFaqList();
	
	/*
	 * 	1:1 문의 게시판
	 */
	int selectQnaCount();
	ArrayList<Qna> selectQnaList(PageInfo pi);
	
	Qna selectQna(int qno);
	
	int insertQna(Qna q);
	
}

