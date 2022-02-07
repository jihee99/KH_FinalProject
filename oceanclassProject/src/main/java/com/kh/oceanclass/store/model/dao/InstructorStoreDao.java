package com.kh.oceanclass.store.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.store.model.vo.Product;

@Repository
public class InstructorStoreDao {

	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession) {
		System.out.println( sqlSession.selectList("inStoreMapper.selectList") );
		return null;
	}

	
}
