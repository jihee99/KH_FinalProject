package com.kh.oceanclass.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.help.model.vo.Qna;
import com.kh.oceanclass.member.model.vo.Coupon;
import com.kh.oceanclass.member.model.vo.Member;

@Repository
public class MypageDao {
	
	public int updateProfile(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("myMapper.updateProfile", m);
	}
	
	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("myMapper.updatePwd", m);
	}
	
	public int deleteMem(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("myMapper.deleteMem", userId);
	}
	
	public int selectCouponCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("myMapper.selectCouponCount", memNo);
	}

	public ArrayList<Coupon> selectCouponList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myMapper.selectCouponList", memNo, rowBounds);
	}
	
	public int selectQnaCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("myMapper.selectQnaCount", memNo);
	}
	
	public ArrayList<Qna> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myMapper.selectQnaList", memNo, rowBounds);
	}

}// class
