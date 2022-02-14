package com.kh.oceanclass.event.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.event.model.dao.AdminEventDao;
import com.kh.oceanclass.event.model.vo.Event;

@Service
public class AdminEventServiceImpl implements AdminEventService{

	@Autowired
	private AdminEventDao aeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return aeDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Event> selectList(PageInfo pi) {
		return aeDao.selectList(sqlSession, pi);
	}
	
	@Override
	public int statusListCount() {
		return aeDao.statusListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Event> statusList(PageInfo pi) {
		return aeDao.statusList(sqlSession, pi);
	}
	
	@Override
	public int statusNListCount() {
		return aeDao.statusNListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Event> statusNList(PageInfo pi) {
		return aeDao.statusNList(sqlSession, pi);
	}

	@Override
	public int insertEvent(Event b) {
		return 0;
	}

	@Override
	public Event selectEvent(int eventNo) {
		return null;
	}

	@Override
	public int deleteEvent(int eventNo) {
		return 0;
	}

	@Override
	public int updateEvent(Event e) {
		return 0;
	}

	@Override
	public int endEvent(Event e) {
		return 0;
	}


}
