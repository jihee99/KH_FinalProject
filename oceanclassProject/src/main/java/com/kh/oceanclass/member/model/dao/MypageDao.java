package com.kh.oceanclass.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.member.model.vo.Member;

@Repository
public class MypageDao {
	
	public int updateProfile(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("myMapper.updateProfile", m);
	}
	
	public int deleteMem(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("myMapper.deleteMem", userId);
	}

}
