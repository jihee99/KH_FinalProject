package com.kh.oceanclass.member.model.service;

import java.util.ArrayList;

import com.kh.oceanclass.Class.model.vo.ClassOrder;
import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.CsQna;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.help.model.vo.Qna;
import com.kh.oceanclass.member.model.vo.Coupon;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.StoreReview;

public interface MypageService {

	// 학생 마이페이지 기능
	// 프로필수정
	int updateProfile(Member m);
	
	// 비밀번호 변경
	int  updatePwd(Member m);
	
	// 회원탈퇴
	int deleteMem(String userId);
	
	// 쿠폰 갯수 조회
	int selectCouponCount(int memNo);
	
	// 쿠폰 리스트 조회
	ArrayList<Coupon> selectCouponList(PageInfo pi, int memNo);
	
	// qna 갯수 조회
	int selectQnaCount(int memNo);
	
	// qna 리스트 조회
	ArrayList<Qna> selectQnaList(PageInfo pi, int memNo);
	
	// qna 기간검색 갯수
	int myQnaCount(Qna q);
	
	// qna 기간검색 리스트
	ArrayList<Qna> selectMyQnaList(PageInfo pi, Qna q);
	
	// 닉네임 중복
	int checkNick(String nickName);
	
	// 좋아요 클래스 갯수
	int likeClassCount(int memNo);
	
	// 좋아요 클래스 리스트
	ArrayList<ClassVo> selectLikeClass(PageInfo pi, int memNo);
	
	// 내 클래스
	ArrayList<ClassOrder> selectMyClass(int memNo);
	
	// 클래스 review 갯수
	int classReviewCount(int memNo);
	
	// 클래스 review 리스트 조회
	ArrayList<ClassReview> classReviewList(PageInfo pi, int memNo);
	
	// 좋아요 상품 갯수
	int likeProductCount(int memNo);
	
	// 좋아요 상품 리스트
	ArrayList<Product> selectLikeProduct(PageInfo pi, int memNo);
	
	// 스토어 문의 내역
	int shoppingQnaCount(int memNo);
	ArrayList<CsQna> shoppingQnaList(PageInfo pi, int memNo);
	
	// 스토어 리뷰 내역
	int shoppingReviewCount(int memNo);
	ArrayList<StoreReview> shoppingReviewList(PageInfo pi, int memNo);
}
