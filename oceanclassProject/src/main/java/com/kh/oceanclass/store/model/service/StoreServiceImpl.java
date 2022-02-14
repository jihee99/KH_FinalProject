package com.kh.oceanclass.store.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.store.model.dao.StoreDao;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.ProductOption;
import com.kh.oceanclass.store.model.vo.StoreReview;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDao sDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return sDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Product> selectList(PageInfo pi) {
		return sDao.selectList(sqlSession, pi);
	}

	@Override
	public Product selectProduct(int productNo) {
		return null;
	}

	@Override
	public ArrayList<ProductOption> selectProductOption(int productNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void selectStoreReviewList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectStoreQnaList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int insertReview(StoreReview review) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Product> categorySearch(String category) {
		return sDao.categorySearch(sqlSession, category);
	}
	
	
	
}
