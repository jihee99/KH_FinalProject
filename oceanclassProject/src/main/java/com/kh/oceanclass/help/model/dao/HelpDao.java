package com.kh.oceanclass.help.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.help.model.vo.Notice;
import com.kh.oceanclass.help.model.vo.Qna;

@Repository
public class HelpDao {
	
	// 공지사항 
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("helpMapper.selectListCount");
	}

	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("helpMapper.selectList", null, rowBounds);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int noNo) {
		return sqlSession.update("helpMapper.increaseCount", noNo);
	}
	
	public Notice selectNotice(SqlSessionTemplate sqlSession, int noNo) {
		return sqlSession.selectOne("helpMapper.selectNotice", noNo);
	}
	
	
	// 1:1 문의
	public int selectQnaCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("helpMapper.selectQnaCount");
	}
	
	public ArrayList<Qna> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("helpMapper.selectQnaList", null, rowBounds);
	}

}
