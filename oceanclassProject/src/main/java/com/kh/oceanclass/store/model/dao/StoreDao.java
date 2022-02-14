package com.kh.oceanclass.store.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.store.model.vo.Product;

@Repository
public class StoreDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("storeMapper.selectListCount");
	}
	
	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("storeMapper.selectList", null, rowBounds);
		
	}
	
	public ArrayList<Product> categorySearch(SqlSessionTemplate sqlSession, String category){
		return (ArrayList)sqlSession.selectList("storeMapper.categorySearch", category);
	}

}
