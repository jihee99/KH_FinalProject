package com.kh.oceanclass.common.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.AdminStatistics;
import com.kh.oceanclass.common.model.vo.CsQna;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.help.model.vo.Qna;
import com.kh.oceanclass.member.model.vo.Coupon;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.StoreReview;

@Repository
public class AdminChartDao {

	public ArrayList<AdminStatistics> selectStatistics(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("chartMapper.selectChart");
	}
	
	public ArrayList<AdminStatistics> selectMemStatistics(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("chartMapper.selectMemChart");
	}
	
	public ArrayList<AdminStatistics> selectTeacherStatistics(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("chartMapper.selectTeacherChart");
	}
	
	public int selectClassStatistics(SqlSessionTemplate sqlSession, String category){
		return sqlSession.selectOne("chartMapper.selectQnaChart", category);
	}
	
	public int selectStoreStatistics(SqlSessionTemplate sqlSession, String category){
		return sqlSession.selectOne("chartMapper.selectQnaChart", category);
	}
	
	public int selectEtcStatistics(SqlSessionTemplate sqlSession, String category){
		return sqlSession.selectOne("chartMapper.selectQnaChart", category);
	}
	
}// class
