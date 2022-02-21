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
	public int updateMyPage(Teacher t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteTc(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	



}
