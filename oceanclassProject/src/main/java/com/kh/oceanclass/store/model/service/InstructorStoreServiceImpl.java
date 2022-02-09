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
		// 1. 상품 리스트 페이지 서비스(페이징)
		return inStoreDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Product> selectList(PageInfo pi) {
		// 1. 상품 리스트 페이지 목록
		return inStoreDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertProduct(Product p) {
		// 2.1 상품 등록 서비스
		return inStoreDao.insertProduct(sqlSession, p);
	}
	
	@Override
	public int insertProductOption(ProductOption option) {
		// 2.2 옵션 등록 서비스
		return inStoreDao.insertProductOption(sqlSession, option);
	}

	@Override
	public Product selectProduct(int pno) {
		// 3.1 상품 상세조회용 서비스
		return inStoreDao.selectProduct(sqlSession, pno);
	}
	
	@Override
	public ArrayList<ProductOption> selectProductOption(int pno) {
		// 3.2 상품 옵션 조회용 서비스
		return inStoreDao.selectProductOption(sqlSession, pno);
	}

	@Override
	public void updateProduct() {
		// 4.1 상품 수정용 서비스
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProductOption() {
		// 4.2 상품 옵션 수정용 서비스
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void deleteProduct() {
		// 5.1 상품 삭제용 서비스
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void updateProductOption() {
		// 5.2 상품옵션 삭제용 서비스
		// TODO Auto-generated method stub
		
	}


	@Override
	public void selectStoreQnaList() {
		// 6. 상품 문의 리스트 페이지 서비스
		// TODO Auto-generated method stub
		
	}

	@Override
	public void storeQnaAnswer() {
		// 7. 상품 문의 답변 서비스
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectStoreReviewList() {
		// 8. 상품 리뷰 리스트 페이지 서비스
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectStoreReview() {
		// 9. 상품 리뷰 상세조회용 서비스
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectStoreDeliveryList() {
		// 10. 상품 주문내역 리스트 페이지
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
