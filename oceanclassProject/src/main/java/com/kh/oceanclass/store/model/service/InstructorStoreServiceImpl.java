package com.kh.oceanclass.store.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.store.model.dao.InstructorStoreDao;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.ProductOption;

@Service
public class InstructorStoreServiceImpl implements InstructorStoreService{

	@Autowired
	private InstructorStoreDao inStoreDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		return inStoreDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Product> selectList(PageInfo pi) {
		return inStoreDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertProduct(Product p) {		
		return inStoreDao.insertProduct(sqlSession, p);
	}
	
	@Override
	public int insertProductOption(ProductOption option) {
		return inStoreDao.insertProductOption(sqlSession, option);
	}

	@Override
	public Product selectProduct(int pno) {
		return inStoreDao.selectProduct(sqlSession, pno);
	}

	@Override
	public void updateProduct() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProduct() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectStoreQnaList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void storeQnaAnswer() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectStoreReviewList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectStoreReview() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectStoreDeliveryList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectStoreDelivery() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectStoreStockList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectStoreStock() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectStoreOrder() {
		// TODO Auto-generated method stub
		
	}


}
