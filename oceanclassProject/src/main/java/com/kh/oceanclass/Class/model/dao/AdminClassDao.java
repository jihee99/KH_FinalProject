package com.kh.oceanclass.Class.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.Class.model.vo.ClassOrder;
import com.kh.oceanclass.Class.model.vo.ClassQna;
import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.LikeVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.model.vo.Reply;
import com.kh.oceanclass.event.model.vo.Event;
import com.kh.oceanclass.member.model.vo.MemCoupon;

@Repository
public class AdminClassDao {

	public int enrollClassListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminClassMapper.enrollClassListCount", map);
	}
	
	public ArrayList<ClassVo> selectEnrollClassList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("adminClassMapper.selectEnrollClassList", map, rowBounds);
	}
	
	public ClassVo selectClassDetail(SqlSessionTemplate sqlSession, String clNo) {
		return sqlSession.selectOne("adminClassMapper.selectClassDetail", clNo);
	}
	
	public int classApproval(SqlSessionTemplate sqlSession, int clNo) {
		return sqlSession.update("adminClassMapper.classApproval", clNo);
	}
	
	public int classReturn(SqlSessionTemplate sqlSession, ClassVo c) {
		return sqlSession.update("adminClassMapper.classReturn", c);
	}
	
}
