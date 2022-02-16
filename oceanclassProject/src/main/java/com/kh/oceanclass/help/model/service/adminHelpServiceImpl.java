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
		return 0;
	}

	@Override
	public ArrayList<Faq> selectFaqList(PageInfo pi) {
		return null;
	}

	@Override
	public int insertFaq(Faq f) {
		return 0;
	}

	@Override
	public Notice selectFaq(int faqNo) {
		return null;
	}

	@Override
	public int deleteFaq(int faqNo) {
		return 0;
	}

	@Override
	public int updateFaq(Faq f) {
		return 0;
	}

	// Qna
	
	@Override
	public int selectQnaListCount() {
		return 0;
	}

	@Override
	public ArrayList<Qna> selectQnaList(PageInfo pi) {
		return null;
	}

	@Override
	public int insertQna(Qna q) {
		return 0;
	}

	@Override
	public Notice selectQna(int qnaNo) {
		return null;
	}

	@Override
	public int deleteQna(int qnaNo) {
		return 0;
	}

	@Override
	public int updateQna(Qna q) {
		return 0;
	}

	



}
