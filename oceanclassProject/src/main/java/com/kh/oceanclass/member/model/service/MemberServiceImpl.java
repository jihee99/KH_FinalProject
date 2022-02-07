package com.kh.oceanclass.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.member.model.dao.MemberDao;
import com.kh.oceanclass.member.model.vo.Member;

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
		return 0;
	}

	@Override
	public int idCheck(String checkId) {
		return 0;
	}

	@Override
	public Member findId(Member m) {
		return null;
	}

	@Override
	public int updatePwd(Member m) {
		return 0;
	}
	
}
