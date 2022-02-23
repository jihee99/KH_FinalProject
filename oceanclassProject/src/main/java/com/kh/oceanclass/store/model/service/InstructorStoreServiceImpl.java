package com.kh.oceanclass.store.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.store.model.dao.InstructorStoreDao;
import com.kh.oceanclass.store.model.vo.InProductOrder;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.ProductOption;
import com.kh.oceanclass.store.model.vo.Stock;
import com.kh.oceanclass.store.model.vo.StoreBuyList;
import com.kh.oceanclass.store.model.vo.StoreOrder;
import com.kh.oceanclass.store.model.vo.StoreReview;

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
	public int updateProduct(Product p) {
		// 4.1 상품 수정용 서비스
		return inStoreDao.updateProduct(sqlSession, p);
	}

	public int updateProductOption(ProductOption option) {
		// 4.2 상품 옵션 수정용 서비스
		return inStoreDao.updateProductOption(sqlSession, option);
		
	}
	
	@Override
	public int upinsertProductOption(ProductOption option) {
		// 4-2. 기존 옵션 수보다 많을 때 사용
		return inStoreDao.upinsertProductOption(sqlSession, option);
	}

	
	@Override
	public int deleteProduct(int pno) {
		// 5.1 상품 삭제용 서비스
		return inStoreDao.deleteProduct(sqlSession, pno);
	}
	
	@Override
	public int deleteProductOption(int pno) {
		// 5.2 상품옵션 삭제용 서비스
		return inStoreDao.deleteProductOption(sqlSession, pno);
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
	public int selectStoreReviewCount() {
		// 8_1. 상품 리뷰 카운트 
		return inStoreDao.selectStoreReivewCount(sqlSession);
	}
	
	@Override
	public ArrayList<Product> selectReviewProductList(int userNo){
		// 8_2_1. 해당 회원의 상품리스트 불러오기
		return inStoreDao.selectReviewProductList(sqlSession, userNo);
	}
	
	@Override
	public ArrayList<StoreReview> selectStoreReviewList(PageInfo pi, int userNo) {
		// 8_2. 상품 리뷰 리스트 페이지 서비스
		return inStoreDao.selectStoreReviewList(sqlSession, pi, userNo);
		
	}

	@Override
	public ArrayList<StoreReview> selectStoreProductReview(String pno) {
		// 8_3. 상품별 리뷰 모아보기 서비스
		return inStoreDao.selectStoreProductReview(sqlSession, pno);
	}
	
	@Override
	public StoreReview selectStoreProductReviewCount(String pno) {
		// 8_3. 상품별 리뷰 모아보기 개수 카운트
		return inStoreDao.selectStoreProductReviewCount(sqlSession, pno);
	}


	
	@Override
	public void selectStoreReview() {
		// 9. 상품 리뷰 상세조회용 서비스
		
	}
	
	@Override
	public int selectStoreDeliveryCount() {
		return inStoreDao.selectStoreDeliveryCount(sqlSession);
	}
	
	@Override
	public ArrayList<StoreOrder> selectStoreDeliveryList(PageInfo pi) {
		// 10. 상품 주문내역 리스트 페이지
		return inStoreDao.selectStoreDeliveryList(sqlSession,pi);
	}

	@Override
	public StoreOrder selectStoreDelivery(String ono) {
		return inStoreDao.selectStoreDelivery(sqlSession, ono);
	}

	@Override
	public ArrayList<StoreBuyList> selectStoreBuyList(String ono) {
		return inStoreDao.selectStoreBuyList(sqlSession, ono);
	}

	@Override
	public int storeOrderUpdate(StoreOrder so) {
		return inStoreDao.storeOrderUpdate(sqlSession, so);
	}

	@Override
	public int searchStoreOrderCount(String orderStatus) {
		return inStoreDao.searchStoreOrderCount(sqlSession, orderStatus);
	}

	@Override
	public ArrayList<StoreOrder> searchStoreOrderList(String orderStatus, PageInfo pi) {
		return inStoreDao.searchStoreOrderList(sqlSession, orderStatus, pi);
	}
	
	@Override
	public int deleteStoreOrder(String orderNo) {
		return inStoreDao.deleteStoreOrder(sqlSession, orderNo);
	}

	@Override
	public int searchKeyStoreOrderCount(HashMap<String, String> map) {
		return inStoreDao.searchKeyStoreOrderCount(sqlSession, map);
	}

	@Override
	public ArrayList<StoreOrder> searchKeyStoreOrderList(HashMap<String, String> map, PageInfo pi) {
		return inStoreDao.searchKeyStoreOrderList(sqlSession, map, pi);
	}
	
	@Override
	public int selectStockCount() {
		// 12_1. 상품 재고 조회용 카운트
		return inStoreDao.selectStockCount(sqlSession);
	}

	@Override
	public ArrayList<Stock> selectStockList(PageInfo pi) {
		return inStoreDao.selectStockList(sqlSession, pi);
	}

	@Override
	public int updateStockCount(Stock st) {
		return inStoreDao.updateStockCount(sqlSession, st);	
	}


	@Override
	public ArrayList<Product> selectProductList() {
		return inStoreDao.selectProductList(sqlSession);
	}
	
	@Override
	public int insertProductOrder(InProductOrder pOrder) {
		return inStoreDao.insertProductOrder(sqlSession, pOrder);		
	}










}
