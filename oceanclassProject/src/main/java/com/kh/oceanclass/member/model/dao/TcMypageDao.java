package com.kh.oceanclass.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.member.model.vo.Teacher;

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
	
	public Teacher loginTc(SqlSessionTemplate sqlSession, Teacher t) {
		return sqlSession.selectOne("tcmyMapper.loginTc", t);
	}
	
	public int updateCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("tcmyMapper.updateCount", memNo);
	}
	
	public int insertTcPage(SqlSessionTemplate sqlSession, Teacher t) {
		return sqlSession.insert("tcmyMapper.insertTcPage", t);
	}
	
	public int updateTcPage(SqlSessionTemplate sqlSession, Teacher t) {
		return sqlSession.update("tcmyMapper.updateTcPage", t);
	}

}
