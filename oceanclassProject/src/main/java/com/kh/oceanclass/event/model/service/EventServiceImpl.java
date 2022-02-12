package com.kh.oceanclass.event.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.event.model.dao.EventDao;
import com.kh.oceanclass.event.model.vo.Event;

@Service
public class EventServiceImpl implements EventService{
	
	@Autowired
	private EventDao eDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	@Override
	public int selectEventCount() {
		return eDao.selectEventCount(sqlSession);
	}

	@Override
	public ArrayList<Event> selectEventList(PageInfo pi) {
		return eDao.selectEventList(sqlSession, pi);
	}

	@Override
	public Event selectEvent(int eventNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Event> ajaxSearchEvent(String category) {
		return eDao.ajaxSearchEvent(sqlSession, category);
	}

}
