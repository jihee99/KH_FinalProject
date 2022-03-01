package com.kh.oceanclass.store.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.store.model.vo.InProductOrder;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.StoreQna;
import com.kh.oceanclass.store.model.vo.StoreReview;

@Repository
public class AdminStoreDao {
	
	public ArrayList<InProductOrder> selectInProductOrderList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminStoreMapper.selectInProuctOrder");
	}
	
	public ArrayList<StoreReview> selectStoreReviewList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminStoreMapper.selectStoreReview");
	}
	
	public ArrayList<StoreQna> selectStoreQnaList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminStoreMapper.selectStoreQna");
	}
	
	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminStoreMapper.selectProduct");
	}
	

}
