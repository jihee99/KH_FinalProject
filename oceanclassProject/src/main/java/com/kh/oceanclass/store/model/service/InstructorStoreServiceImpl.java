package com.kh.oceanclass.store.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.store.model.dao.InstructorStoreDao;
import com.kh.oceanclass.store.model.vo.Product;

@Service
public class InstructorStoreServiceImpl implements InstructorStoreService{

	@Autowired
	private InstructorStoreDao inStoreDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void selectListCount() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<Product> selectList() {
		return inStoreDao.selectList(sqlSession);
	}

	@Override
	public void insertProduct() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectProduct() {
		// TODO Auto-generated method stub
		
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
