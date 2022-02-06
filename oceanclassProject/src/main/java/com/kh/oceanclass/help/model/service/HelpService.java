package com.kh.oceanclass.help.model.service;

import java.util.ArrayList;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.help.model.vo.Notice;

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
	
	/*
	 * 	1:1 문의 게시판
	 */
	
	
}

