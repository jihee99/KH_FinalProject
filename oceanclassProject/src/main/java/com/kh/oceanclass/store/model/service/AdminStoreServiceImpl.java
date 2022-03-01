package com.kh.oceanclass.store.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.store.model.dao.AdminStoreDao;
import com.kh.oceanclass.store.model.vo.InProductOrder;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.StoreQna;
import com.kh.oceanclass.store.model.vo.StoreReview;

@Service
public class AdminStoreServiceImpl implements AdminStoreService {
	
	@Autowired
	private AdminStoreDao asDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<InProductOrder> selectInProductOrderList() {
		return asDao.selectInProductOrderList(sqlSession);
	}

	@Override
	public ArrayList<StoreReview> selectStoreReviewList() {
		return asDao.selectStoreReviewList(sqlSession);
	}

	@Override
	public ArrayList<StoreQna> selectStoreQnaList() {
		return asDao.selectStoreQnaList(sqlSession);
	}

	@Override
	public ArrayList<Product> selectProductList() {
		return asDao.selectProductList(sqlSession);
	}

}
