package com.kh.oceanclass.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.member.model.vo.Member;

@Repository
public class AdminMemDao {

	public Member loginAdmin(SqlSessionTemplate sqlSession, Member m) {
		return null;
	}

}
