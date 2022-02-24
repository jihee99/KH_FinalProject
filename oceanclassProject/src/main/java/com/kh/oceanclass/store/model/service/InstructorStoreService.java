package com.kh.oceanclass.store.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.store.model.vo.InProductOrder;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.ProductOption;
import com.kh.oceanclass.store.model.vo.Stock;
import com.kh.oceanclass.store.model.vo.StoreBuyList;
import com.kh.oceanclass.store.model.vo.StoreOrder;
import com.kh.oceanclass.store.model.vo.StoreQna;
import com.kh.oceanclass.store.model.vo.StoreReview;

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
	int updateProduct(Product p);
	
	// 4.2 상품 옵션 수정용 서비스
	// (기존 옵션 수와 동일하거나 더 작을 때)
	int updateProductOption(ProductOption option);
	// (기존 옵션 수보다 많아졌을 때)
	int upinsertProductOption(ProductOption option);
	
	// 5.1 상품 삭제용 서비스
	int deleteProduct(int pno);
	
	// 5.2 상품옵션 삭제용 서비스
	int deleteProductOption(int pno);
	
	
	// 6_1. 상품 문의 리스트 페이지 서비스
	int selectStoreQnaCount();
	ArrayList<StoreQna> selectStoreQnaList(PageInfo pi);
	
	//6_2. 상품별 문의 모아보기 서비스
	int selectStoreProductQnaCount(String pno);
	ArrayList<StoreQna> selectStoreProductQnaList(PageInfo pi, String pno);
	
	// 7_1. 상품 문의 상세보기 서비스
	StoreQna selectStoreQnaDetail(String qno);
	
	// 7_2. 상품 문의 답변 서비스
	int storeQnaAnswer(StoreQna sq);
	
	// 8. 상품 리뷰 리스트 페이지 서비스
	int selectStoreReviewCount();
	ArrayList<Product> selectReviewProductList(int userNo);
	ArrayList<StoreReview> selectStoreReviewList(PageInfo pi, int userNo);
	
	// 8_2. 상품별 리뷰 모아보기 서비스
	ArrayList<StoreReview> selectStoreProductReview(String pno);
	StoreReview selectStoreProductReviewCount(String pno);
	
	// 9. 상품 리뷰 상세조회용 서비스
	void selectStoreReview();
	
	// 10. 상품 주문내역 리스트 페이지
	int selectStoreDeliveryCount();
	ArrayList<StoreOrder> selectStoreDeliveryList(PageInfo pi);
	
	// 11_1. 상품 주문내역 상세조회용 서비스(상태변경)
	StoreOrder selectStoreDelivery(String ono);
	ArrayList<StoreBuyList> selectStoreBuyList(String ono);
	
	// 11_2. 상품 주문 상태변경 서비스
	int storeOrderUpdate(StoreOrder so);
	
	// 11_3. 상품주문 상태별 조회
	int searchStoreOrderCount(String orderStatus);
	ArrayList<StoreOrder> searchStoreOrderList(String orderStatus, PageInfo pi);
	
	// 11_4. 상품 주문내역 삭제 서비스
	int deleteStoreOrder(String orderNo);
	
	// 11_5. 상품 주문 내역 키워드 검색 서비스
	int searchKeyStoreOrderCount(HashMap<String, String> map);
	ArrayList<StoreOrder> searchKeyStoreOrderList(HashMap<String, String> map, PageInfo pi);
	
	// 12. 상품 재고 리스트 조회용 서비스
	int selectStockCount();
	ArrayList<Stock> selectStockList(PageInfo pi);
	
	// 13. 상품 재고 수정용 서비스
	int updateStockCount(Stock st);
	
	// 14. 상품발주요청용 서비스
	ArrayList<Product> selectProductList();
	int insertProductOrder(InProductOrder pOrder);




	
	
}
