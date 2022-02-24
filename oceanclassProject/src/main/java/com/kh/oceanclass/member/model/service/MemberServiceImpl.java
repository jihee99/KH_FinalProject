package com.kh.oceanclass.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.member.model.dao.MemberDao;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.member.model.vo.Report;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member loginMember(Member m) {
		
		return mDao.loginMember(sqlSession, m);
		
	}

	@Override
	public int insertMember(Member m) {
		
		return mDao.insertMember(sqlSession, m);
		
	}

	@Override
	public int idCheck(String checkId) {
		return mDao.idCheck(sqlSession, checkId);
	}

	@Override
	public int nickCheck(String nickCheck) {
		return mDao.nickCheck(sqlSession, nickCheck);
	}
	
	@Override
	public Member findId(Member m) {
		return mDao.findId(sqlSession, m);
	}
	
	@Override
	public Member findPwd(Member m) {
		return mDao.findPwd(sqlSession, m);
	}

	@Override
	public int updatePwd(Member m) {
		return mDao.updatePwd(sqlSession, m);
	}

	@Override
	public int postReport(Report r) {
		return mDao.postReport(sqlSession, r);
	}

	
	
}
