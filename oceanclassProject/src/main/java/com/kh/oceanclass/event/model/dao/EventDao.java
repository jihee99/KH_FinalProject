package com.kh.oceanclass.event.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.event.model.vo.Event;

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
	
}
