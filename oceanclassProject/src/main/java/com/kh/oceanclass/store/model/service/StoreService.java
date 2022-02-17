package com.kh.oceanclass.store.model.service;

import java.util.ArrayList;

import com.kh.oceanclass.common.model.vo.LikeVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.ProductOption;
import com.kh.oceanclass.store.model.vo.StoreReview;

public interface StoreService {
	
	// 1. 스토어 리스트 페이지 서비스 (페이징)
	int selectListCount();
	ArrayList<Product> selectList(PageInfo pi, int memberNo);
	
	// 1-2. 스토어 카테고리 검색
	ArrayList<Product> categorySearch(String category, String memberNo, String sort);
	
	// 2. 상품 상세조회용 서비스
	Product selectProduct(int productNo);
	
	// 3. 상품 옵션 조회용 서비스
	ArrayList<ProductOption> selectProductOption(int productNo);
	
	// 4. 상품 리뷰 리스트 페이지 서비스
	void selectStoreReviewList();
	
	// 5. 상품 리뷰 작성 서비스
	int insertReview(StoreReview review);
	
	// 6. 상품 문의 리스트 페이지 서비스
	void selectStoreQnaList();
	
	// 7. 상품 문의 작성용 서비스
	
	// 8. 상품 좋아요 확인 서비스
	int likeCheck(LikeVo li);
	
	// 9. 상품 찜하기 서비스
	int insertLike(LikeVo li);
	
	// 10. 상품 찜 삭제 서비스
	int deleteLike(LikeVo li);
	
}
