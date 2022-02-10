package com.kh.oceanclass.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.member.model.dao.MypageDao;
import com.kh.oceanclass.member.model.vo.Member;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageDao myDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
		
	@Override
	public int updateProfile(Member m) {
		return myDao.updateProfile(sqlSession, m);
	}

	@Override
	public int deleteMem(String userId) {
		return myDao.deleteMem(sqlSession, userId);
	}

}
