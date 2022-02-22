package com.kh.oceanclass.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.member.model.dao.TcMypageDao;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.member.model.vo.Teacher;

@Service
public class TcMypageServiceImpl implements TcMypageService{

	@Autowired
	private TcMypageDao tcDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member loginMember(Member m) {
		return tcDao.loginMember(sqlSession, m);
	}
	
	@Override
	public int updateInforPage(Member m) {
		return tcDao.updateInforPage(sqlSession, m);
	}
	
	@Override
	public int nickCheck(String nickCheck) {
		return tcDao.nickCheck(sqlSession, nickCheck);
	}
	
	@Override
	public Teacher loginTc(Teacher t) {
		return tcDao.loginTc(sqlSession, t);
	}
	
	@Override
	public int updateCount(int memNo) {
		return tcDao.updateCount(sqlSession, memNo);
	}
	
	@Override
	public int insertTcPage(Teacher t) {
		return tcDao.insertTcPage(sqlSession, t);
	}
	
	@Override
	public int updateTcPage(Teacher t) {
		return tcDao.updateTcPage(sqlSession, t);
	}

	@Override
	public int deleteTc(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	

	

	



}
