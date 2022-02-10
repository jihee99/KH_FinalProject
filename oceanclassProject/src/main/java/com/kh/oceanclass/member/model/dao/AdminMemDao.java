package com.kh.oceanclass.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.member.model.vo.Member;

@Repository
public class AdminMemDao {

	public Member loginAdmin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("adMemMapper.loginAdmin", m);
	}

	public int selectMemCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adMemMapper.selectMemCount");
	}

	public ArrayList<Member> selectMemList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adMemMapper.selectMemList", null, rowBounds);
	}

	public int selectSMemCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adMemMapper.selectSMemCount");
	}

	public ArrayList<Member> selectSMemList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("adMemMapper.selectSMemList", null, rowBounds);
	}

	public int selectTMemCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adMemMapper.selectTMemCount");
	}

	public ArrayList<Member> selectTMemList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("adMemMapper.selectTMemList", null, rowBounds);
	}
	
	

}
