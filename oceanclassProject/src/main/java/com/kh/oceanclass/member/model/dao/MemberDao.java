package com.kh.oceanclass.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.member.model.vo.Member;

@Repository
public class MemberDao {
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	public int nickCheck(SqlSessionTemplate sqlSession, String nickCheck) {
		return sqlSession.selectOne("memberMapper.nickCheck", nickCheck);
	}
	public Member findId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);
	}
	public Member findPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findPwd", m);
	}
	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePwd", m);
	}
}
