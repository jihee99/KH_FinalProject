package com.kh.oceanclass.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.member.model.vo.Member;

@Repository
public class TcMypageDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int updateInforPage(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("tcmyMapper.updateInforPage", m);
	}
	
	public int nickCheck(SqlSessionTemplate sqlSession, String nickCheck) {
		return sqlSession.selectOne("memberMapper.nickCheck", nickCheck);
	}

}
