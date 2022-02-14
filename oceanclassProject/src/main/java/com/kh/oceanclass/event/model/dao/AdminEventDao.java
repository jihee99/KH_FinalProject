package com.kh.oceanclass.event.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.event.model.vo.Event;

@Repository
public class AdminEventDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("eventMapper.selectListCount");
	}
	public ArrayList<Event> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("eventMapper.selectList", null, rowBounds);
	}
	
	public int statusListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("eventMapper.statusListCount");
	}
	
	public ArrayList<Event> statusList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("eventMapper.statusList", null, rowBounds);
	}
	
	public int statusNListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("eventMapper.statusNListCount");
	}
	
	public ArrayList<Event> statusNList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("eventMapper.statusNList", null, rowBounds);
	}
}
