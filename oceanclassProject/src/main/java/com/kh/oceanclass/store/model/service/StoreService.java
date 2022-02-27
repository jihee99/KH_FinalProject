package com.kh.oceanclass.store.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.oceanclass.common.model.vo.LikeVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.member.model.vo.Report;
import com.kh.oceanclass.store.model.vo.Cart;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.ProductOption;
import com.kh.oceanclass.store.model.vo.StoreQna;
import com.kh.oceanclass.store.model.vo.StoreReview;

public interface StoreService {
	
	// 1. 스토어 리스트 페이지 서비스 (페이징)
	int selectListCount(HashMap<String, String> map);
	ArrayList<Product> selectList(PageInfo pi, HashMap<String, String> map);
	
	// 2. 상품 상세조회용 서비스
	Product selectProduct(int pno, int memberNo);
	
	// 3. 상품 옵션 조회용 서비스
	ArrayList<ProductOption> selectProductOption(int pno);
	
	// 4. 상품 리뷰 리스트 페이지 서비스
	ArrayList<StoreReview> selectStoreReviewList(int pno);
	
	// 5. 상품 리뷰 작성 서비스
	int insertReview(StoreReview review);
	
	// 6. 상품 문의 리스트 페이지 서비스
	ArrayList<StoreQna> selectStoreQnaList(int pno);
	
	// 7. 상품 문의 작성용 서비스
	
	// 8. 상품 좋아요 확인 서비스
	int likeCheck(LikeVo li);
	
	// 9. 상품 찜하기 서비스
	int insertLike(LikeVo li);
	
	// 10. 상품 찜 삭제 서비스
	int deleteLike(LikeVo li);
	
	// 11. 장바구니 확인 서비스
	int cartCheck(Cart ca);
	
	// 12. 장바구니 담기 서비스
	int insertCart(Cart ca);
	
	// 13. 장바구니 삭제 서비스
	int deleteCart(Cart ca);
	
	// 14. 장바구니 수량 증가 서비스
	int updateCart(Cart ca);
	
	// 15. 장바구니 조회 서비스
	ArrayList<Cart> selectCart(int memberNo);
	
	ArrayList<Product> selectCartProduct(int productNo);
	
	ArrayList<ProductOption> selectCartOption(int optionNo);
	
	// 16. 리뷰 조회 서비스
	ArrayList<StoreReview> selectReviewList(int pno, PageInfo pi, int memberNo);
	
	StoreReview selectReviewCount(int pno);
	
	ArrayList<StoreReview> selectStoreReviewMainList(int pno);
	
	int storeReviewListCount(int pno);
	
	int checkRecommend(StoreReview review);
	int deleteRecommend(StoreReview review);
	int insertRecommend(StoreReview review);
	
	int insertReport(Report r);
	
	int storeQnaListCount(int pno);
	
	ArrayList<StoreQna> selectPagingQnaList(int pno, PageInfo pi);
	
	int insertQna(StoreQna qna);
	
	int storeQnaPwdCheck(StoreQna sq);
	
	ArrayList<Product> storeHotList();
	
	ArrayList<Product> storeNewList();
	
	Member selectMember(int memberNo);
	
	ProductOption selectPo(int pno);
	
	int reviewUpdate(StoreReview sr);
	int reviewDelete(int rno);
	int qnaUpdate(int csQno);
	int qnaDelete(int csQno);
	
	StoreReview selectReview(int rno);
	StoreQna selectQna(int csQno);
}

