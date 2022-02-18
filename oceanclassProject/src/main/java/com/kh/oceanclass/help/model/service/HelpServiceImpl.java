package com.kh.oceanclass.help.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.help.model.dao.HelpDao;
import com.kh.oceanclass.help.model.vo.Faq;
import com.kh.oceanclass.help.model.vo.Notice;
import com.kh.oceanclass.help.model.vo.Qna;
import com.kh.oceanclass.member.model.vo.Member;

@Service
public class HelpServiceImpl implements HelpService{
	
	@Autowired
	private HelpDao hDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/*
	 *	공지사항 게시판
	 */
	@Override
	public int selectListCount() {
		return hDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return hDao.selectList(sqlSession, pi);
	}

	@Override
	public int increaseCount(int nno) {
		return hDao.increaseCount(sqlSession, nno);
	}

	@Override
	public Notice selectNotice(int nno) {
		return hDao.selectNotice(sqlSession, nno);
	}
	
	
	/*
	 * 	1:1문의 게시판
	 */
	@Override
	public int selectQnaCount() {
		return hDao.selectQnaCount(sqlSession);
	}

	@Override
	public ArrayList<Qna> selectQnaList(PageInfo pi) {
		return hDao.selectQnaList(sqlSession, pi);
	}

	@Override
	public Qna selectQna(int qno) {
		return hDao.selectQna(sqlSession, qno);
	}
	
	@Override
	public int insertQna(Qna q) {
		return hDao.insertQna(sqlSession, q);
	}

	@Override
	public int selectCategoryCount(String category) {
		return hDao.selectCategoryCount(sqlSession, category);
	}

	@Override
	public int selectNickCount(String nickName) {
		return hDao.selectNickCount(sqlSession, nickName);
	}

	@Override
	public ArrayList<Qna> selectCategoryQnaList(PageInfo pi, String category) {
		return hDao.selectCategoryQnaList(sqlSession, pi, category);
	}

	@Override
	public ArrayList<Qna> selectNickQnaList(PageInfo pi, String nickName) {
		return hDao.selectNickQnaList(sqlSession, pi, nickName);
	}

	
	/*
	 * 	FAQ 게시판
	 */
	@Override
	public ArrayList<Faq> selectFaqList() {
		return hDao.selectFaqList(sqlSession);
	}


}
