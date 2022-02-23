package com.kh.oceanclass.event.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.model.vo.Reply;
import com.kh.oceanclass.event.model.dao.EventDao;
import com.kh.oceanclass.event.model.vo.Event;
import com.kh.oceanclass.member.model.vo.Coupon;

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
		return eDao.selectEvent(sqlSession, eventNo);
	}
	
	@Override
	public ArrayList<Reply> selectReplyList(int contentNo) {
		return eDao.selectReplyList(sqlSession, contentNo);
	}
	
	@Override
	public int insertReply(Reply r) {
		return eDao.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Event> ajaxSearchEvent(String category) {
		return eDao.ajaxSearchEvent(sqlSession, category);
	}

	@Override
	public int tagSelectCount(String tag) {
		return eDao.tagSelectCount(sqlSession, tag);
	}

	@Override
	public ArrayList<ClassVo> tagSelectList(PageInfo pi, String hashtag) {
		return eDao.tagSelectList(sqlSession, pi, hashtag);
	}

	@Override
	public int insertCoupon(Coupon c) {
		return eDao.insertCoupon(sqlSession, c);
	}

	@Override
	public int countCoupon(int couponNo) {
		return eDao.countCoupon(sqlSession, couponNo);
	}

	@Override
	public Coupon selectCoupon(int couponNo) {
		return eDao.selectCoupon(sqlSession, couponNo);
	}

	@Override
	public int couponHistoryMem(Coupon c) {
		return eDao.couponHistoryMem(sqlSession, c);
	}

	

}
