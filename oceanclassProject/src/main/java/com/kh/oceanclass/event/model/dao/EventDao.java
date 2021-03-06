package com.kh.oceanclass.event.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.model.vo.Reply;
import com.kh.oceanclass.event.model.vo.Event;
import com.kh.oceanclass.member.model.vo.Coupon;

@Repository
public class EventDao {
	
	public int selectEventCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("eventMapper.selectEventCount");
	}
	
	public ArrayList<Event> selectEventList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("eventMapper.selectEventList", null, rowBounds);
	}
	
	
	public ArrayList<Event> ajaxSearchEvent(SqlSessionTemplate sqlSession, String category){
		return (ArrayList)sqlSession.selectList("eventMapper.ajaxSearchEvent", category);
	}
	
	
	public Event selectEvent(SqlSessionTemplate sqlSession, int contentNo) {
		return sqlSession.selectOne("eventMapper.selectEvent", contentNo);
	}
	
	
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int eventNo){
		return (ArrayList)sqlSession.selectList("eventMapper.selectReply", eventNo);
	}
	
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("eventMapper.insertReply", r);
	}
	
	
	public int tagSelectCount(SqlSessionTemplate sqlSession, String hashtag) {
		return sqlSession.selectOne("eventMapper.tagSelecetCount", hashtag);
	}
	
	
	public ArrayList<ClassVo> tagSelectList(SqlSessionTemplate sqlSession, PageInfo pi, String hashtag){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("eventMapper.tagSelectList", hashtag, rowBounds);
	}
	
	
	public int insertCoupon(SqlSessionTemplate sqlSession, Coupon c) {
		return sqlSession.insert("eventMapper.insertCoupon", c);
	}

	public int countCoupon(SqlSessionTemplate sqlSession, int couponNo) {
		return sqlSession.update("eventMapper.countCoupon", couponNo);
	}
	
	public Coupon selectCoupon(SqlSessionTemplate sqlSession, int couponNo) {
		return sqlSession.selectOne("eventMapper.selectCoupon", couponNo);
	}
	
	public int couponHistoryMem(SqlSessionTemplate sqlSession, Coupon c) {
		return sqlSession.selectOne("eventMapper.couponHistoryMem", c);
	}
	
}
