package com.kh.oceanclass.event.model.service;

import java.util.ArrayList;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.event.model.vo.Event;

public interface AdminEventService {
	
	
	// 1. 이벤트 리스트 페이지 서비스 (페이징)
	int selectListCount();
	ArrayList<Event> selectList(PageInfo pi);
	
	// 2-1. 이벤트 진행중 리스트 페이지 서비스(페이징)
	int statusListCount();
	ArrayList<Event> statusList(PageInfo pi);
	
	// 2-2. 이벤트 종료 리스트 페이지 서비스(페이징)
	int statusNListCount();
	ArrayList<Event> statusNList(PageInfo pi);
	
	// 3. 이벤트 작성하기 서비스
	int insertEvent(Event b);
	
	// 4. 이벤트 상세조회용 서비스
	Event selectEvent(int eventNo);
	
	// 5. 이벤트 삭제용 서비스
	int deleteEvent(int eventNo);
	
	// 6. 이벤트 수정용 서비스
	int updateEvent(Event e);
	
	// 7. 이벤트 종료용 서비스
	int endEvent(Event e);
	
	
}
