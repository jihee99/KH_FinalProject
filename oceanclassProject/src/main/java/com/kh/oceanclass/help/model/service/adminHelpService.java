package com.kh.oceanclass.help.model.service;

import java.util.ArrayList;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.event.model.vo.Event;
import com.kh.oceanclass.help.model.vo.Faq;
import com.kh.oceanclass.help.model.vo.Notice;
import com.kh.oceanclass.help.model.vo.Qna;

public interface adminHelpService {
	
	// 1. 공지사항 리스트 (페이징)
	int selectNtListCount();
	ArrayList<Notice> selectNtList(PageInfo pi);
	
	// 2. 공지사항 작성 서비스
	int insertNotice(Notice n);
	
	// 3. 공지사항 상세 조회
	Notice selectNotice(int noNo);
	
	// 4. 공지사항 삭제
	int deleteNotice(int noNo);
	
	// 5. 공지사항 수정
	int updateNotice(Notice n);
	
	
	
	// 1. FAQ 리스트 (페이징)
	int selectFaqListCount();
	ArrayList<Faq> selectFaqList(PageInfo pi);
	
	// 2. FAQ 작성 서비스
	int insertFaq(Faq f);
	
	// 3. FAQ 상세 조회
	Notice selectFaq(int faqNo);
	
	// 4. FAQ 삭제
	int deleteFaq(int faqNo);
	
	// 5. FAQ 수정
	int updateFaq(Faq f);
	
	
	
	// 1. Qna 리스트 (페이징)
	int selectQnaListCount();
	ArrayList<Qna> selectQnaList(PageInfo pi);
	
	// 2. Qna 작성 서비스
	int insertQna(Qna q);
	
	// 3. Qna 상세 조회
	Notice selectQna(int qnaNo);
	
	// 4. Qna 삭제
	int deleteQna(int qnaNo);
	
	// 5. Qna 수정
	int updateQna(Qna q);
}

