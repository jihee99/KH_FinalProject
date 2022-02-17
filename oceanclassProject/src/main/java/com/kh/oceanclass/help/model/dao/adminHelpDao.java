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
	
	// 공지사항
	
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
	
	// FAQ
	
	public int selectFaqListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminHelpMapper.selectFaqListCount");
	}
	public ArrayList<Faq> selectFaqList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminHelpMapper.selectFaqList", null, rowBounds);
	}
	public int insertFaq(SqlSessionTemplate sqlSession, Faq f) {
		return sqlSession.insert("adminHelpMapper.insertFaq", f);
	}
	public Faq selectFaq(SqlSessionTemplate sqlSession, int faqNo) {
		return sqlSession.selectOne("adminHelpMapper.selectFaqAd", faqNo);
	}
	public int deleteFaq(SqlSessionTemplate sqlSession, int faqNo) {
		return sqlSession.update("adminHelpMapper.deleteFaq", faqNo);
	}
	public int updateFaq(SqlSessionTemplate sqlSession, Faq f) {
		//System.out.println(n);
		return sqlSession.update("adminHelpMapper.updateFaq", f);
	}
	
	// QNA
	
	public int selectQnaListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminHelpMapper.selectQnaListCount");
	}
	public ArrayList<Qna> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminHelpMapper.selectQnaList", null, rowBounds);
	}
	public int insertQna(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.update("adminHelpMapper.insertQna", q);
	}
	public Qna selectQna(SqlSessionTemplate sqlSession, int qnaNo) {
		return sqlSession.selectOne("adminHelpMapper.selectQna", qnaNo);
	}
	public int deleteQna(SqlSessionTemplate sqlSession, int qnaNo) {
		return sqlSession.update("adminHelpMapper.deleteQna", qnaNo);
	}
}
