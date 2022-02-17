package com.kh.oceanclass.event.model.service;

import java.util.ArrayList;

import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.model.vo.Reply;
import com.kh.oceanclass.event.model.vo.Event;

public interface EventService {
	
	// 1. 이벤트 리스트
	int selectEventCount();
	ArrayList<Event> selectEventList(PageInfo pi);
	
	// 2. 이벤트 상세보기
	Event selectEvent(int eventNo);
	
	// 3. 이벤트 댓글 보기
	ArrayList<Reply> selectReplyList(int contentNo);
	
	// 4. 이벤트 댓글 쓰기
	int insertReply(Reply r);
	
	// 5. 이벤트 카테고리 선택
	ArrayList<Event> ajaxSearchEvent(String category);
	
	// 6. 태그 리스트
	int tagSelectCount(String tag);
	ArrayList<ClassVo> tagSelectList(PageInfo pi);
	
}
