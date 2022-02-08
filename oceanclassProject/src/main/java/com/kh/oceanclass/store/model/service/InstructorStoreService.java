package com.kh.oceanclass.store.model.service;

import java.util.ArrayList;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.ProductOption;

public interface InstructorStoreService {

	// 1. 상품 리스트 페이지 서비스(페이징)
	int selectListCount();
	ArrayList<Product> selectList(PageInfo pi);
	
	// 2.1 상품 등록 서비스
	int insertProduct(Product p);
	
	// 2.2 옵션 등록 서비스
	int insertProductOption(ProductOption option);
	
	
	// 3.1 상품 상세조회용 서비스
	Product selectProduct(int pno);
	
	// 3.2 상품 옵션 조회용 서비스
	ArrayList<ProductOption> selectProductOption(int pno);
	
	
	// 4.1 상품 수정용 서비스
	void updateProduct();
	
	// 4.2 상품 옵션 수정용 서비스
	void updateProductOption();
	
	
	// 5.1 상품 삭제용 서비스
	void deleteProduct();
	
	// 5.2 상품옵션 삭제용 서비스
	void deleteProductOption();
	
	
	// 6. 상품 문의 리스트 페이지 서비스
	void selectStoreQnaList();
	
	// 7. 상품 문의 답변 서비스
	void storeQnaAnswer();
	
	// 8. 상품 리뷰 리스트 페이지 서비스
	void selectStoreReviewList();
	
	// 9. 상품 리뷰 상세조회용 서비스
	void selectStoreReview();
	
	// 10. 상품 주문내역 리스트 페이지
	void selectStoreDeliveryList();
	
	// 11. 상품 주문내역 상세조회용 서비스(상태변경)
	void selectStoreDelivery();
	
	// 12. 상품 재고 리스트 조회용 서비스
	void selectStoreStockList();
	
	// 13. 상품 재고 수정용 서비스
	void selectStoreStock();
	
	// 14. 상품발주요청용 서비스
	void selectStoreOrder();
	
}
