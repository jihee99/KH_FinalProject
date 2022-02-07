package com.kh.oceanclass.store.model.service;

import java.util.ArrayList;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.store.model.vo.Product;

public interface InstructorStoreService {

	// 1. 상품 리스트 페이지 서비스(페이징)
	int selectListCount();
	ArrayList<Product> selectList(PageInfo pi);
	
	// 2. 상품 등록 서비스
	void insertProduct();
	
	// 3. 상품 상세조회용 서비스
	void selectProduct();
	
	// 4. 상품 수정용 서비스
	void updateProduct();
	
	// 5. 상품 삭제용 서비스
	void deleteProduct();
	
	// 6. 상품 문의 리스트 페이지 서비스
	void selectStoreQnaList();
	
	// 8. 상품 문의 답변 서비스
	void storeQnaAnswer();
	
	// 9. 상품 리뷰 리스트 페이지 서비스
	void selectStoreReviewList();
	
	// 10. 상품 리뷰 상세조회용 서비스
	void selectStoreReview();
	
	// 11. 상품 주문내역 리스트 페이지
	void selectStoreDeliveryList();
	
	// 12. 상품 주문내역 상세조회용 서비스(상태변경)
	void selectStoreDelivery();
	
	// 13. 상품 재고 리스트 조회용 서비스
	void selectStoreStockList();
	
	// 14. 상품 재고 수정용 서비스
	void selectStoreStock();
	
	// 15. 상품발주요청용 서비스
	void selectStoreOrder();
	
}
