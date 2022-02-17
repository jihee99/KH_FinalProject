package com.kh.oceanclass.help.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.event.model.vo.Event;
import com.kh.oceanclass.help.model.vo.Faq;
import com.kh.oceanclass.help.model.vo.Notice;
import com.kh.oceanclass.help.model.vo.Qna;

@Repository
public class adminHelpDao {
	
	public int selectNtListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminHelpMapper.selectNtListCount");
	}
	public ArrayList<Notice> selectNtList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminHelpMapper.selectNtList", null, rowBounds);
	}
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("adminHelpMapper.insertNotice", n);
	}
	public Notice selectNotice(SqlSessionTemplate sqlSession, int noNo) {
		return sqlSession.selectOne("adminHelpMapper.selectNoticeAd", noNo);
	}
	public int deleteNotice(SqlSessionTemplate sqlSession, int noNo) {
		return sqlSession.update("adminHelpMapper.deleteNotice", noNo);
	}
	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		//System.out.println(n);
		return sqlSession.update("adminHelpMapper.updateNotice", n);
	}
}
