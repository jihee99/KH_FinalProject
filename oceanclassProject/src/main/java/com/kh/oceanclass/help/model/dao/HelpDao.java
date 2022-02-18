package com.kh.oceanclass.help.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.help.model.vo.Faq;
import com.kh.oceanclass.help.model.vo.Notice;
import com.kh.oceanclass.help.model.vo.Qna;
import com.kh.oceanclass.member.model.vo.Member;

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
	
	public Qna selectQna(SqlSessionTemplate sqlSession, int qno) {
		return sqlSession.selectOne("helpMapper.selectQna", qno);
	}
	
	public int insertQna(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.insert("helpMapper.insertQna", q);
	}
	
	public int selectCategoryCount(SqlSessionTemplate sqlSession, String category) {
		return sqlSession.selectOne("helpMapper.selectCategoryCount", category);
	}
	
	public ArrayList<Qna> selectCategoryQnaList(SqlSessionTemplate sqlSession, PageInfo pi, String category){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("helpMapper.selectCategoryQnaList", category, rowBounds);
	}
	
	public int selectNickCount(SqlSessionTemplate sqlSession, String nickName) {
		return sqlSession.selectOne("helpMapper.selectNickCount", nickName);
	}
	
	public ArrayList<Qna> selectNickQnaList(SqlSessionTemplate sqlSession, PageInfo pi, String nickName){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("helpMapper.selectNickQnaList", nickName, rowBounds);
	}
	
	// FAQ
	public ArrayList<Faq> selectFaqList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("helpMapper.selectFaqList");
	}
}
