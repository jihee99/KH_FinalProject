package com.kh.oceanclass.help.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.help.model.dao.adminHelpDao;
import com.kh.oceanclass.help.model.vo.Faq;
import com.kh.oceanclass.help.model.vo.Notice;
import com.kh.oceanclass.help.model.vo.Qna;

@Service
public class adminHelpServiceImpl implements adminHelpService{
	
	@Autowired
	private adminHelpDao ahDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// Notice
	
	@Override
	public int selectNtListCount() {
		return ahDao.selectNtListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectNtList(PageInfo pi) {
		return ahDao.selectNtList(sqlSession, pi);
	}

	@Override
	public int insertNotice(Notice n) {
		return ahDao.insertNotice(sqlSession, n);
	}

	@Override
	public Notice selectNotice(int noNo) {
		return ahDao.selectNotice(sqlSession, noNo);
	}

	@Override
	public int deleteNotice(int noNo) {
		return ahDao.deleteNotice(sqlSession, noNo);
	}

	@Override
	public int updateNotice(Notice n) {
		return ahDao.updateNotice(sqlSession, n);
	}

	// Faq
	
	@Override
	public int selectFaqListCount() {
		return ahDao.selectFaqListCount(sqlSession);
	}

	@Override
	public ArrayList<Faq> selectFaqList(PageInfo pi) {
		return ahDao.selectFaqList(sqlSession, pi);
	}

	@Override
	public int insertFaq(Faq f) {
		return ahDao.insertFaq(sqlSession, f);
	}

	@Override
	public Faq selectFaq(int faqNo) {
		return ahDao.selectFaq(sqlSession, faqNo);
	}

	@Override
	public int deleteFaq(int faqNo) {
		return ahDao.deleteFaq(sqlSession, faqNo);
	}

	@Override
	public int updateFaq(Faq f) {
		return ahDao.updateFaq(sqlSession, f);
	}

	// Qna
	
	@Override
	public int selectQnaListCount() {
		return ahDao.selectQnaListCount(sqlSession);
	}

	@Override
	public ArrayList<Qna> selectQnaList(PageInfo pi) {
		return ahDao.selectQnaList(sqlSession, pi);
	}

	@Override
	public int insertQna(Qna q) {
		return ahDao.insertQna(sqlSession, q);
	}

	@Override
	public Qna selectQna(int qnaNo) {
		return ahDao.selectQna(sqlSession, qnaNo);
	}

	@Override
	public int deleteQna(int qnaNo) {
		return ahDao.deleteQna(sqlSession, qnaNo);
	}



}
