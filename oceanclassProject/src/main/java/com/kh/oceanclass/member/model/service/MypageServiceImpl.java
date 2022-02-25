package com.kh.oceanclass.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.Class.model.vo.ClassOrder;
import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.CsQna;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.help.model.vo.Qna;
import com.kh.oceanclass.member.model.dao.MypageDao;
import com.kh.oceanclass.member.model.vo.Coupon;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.StorePay;
import com.kh.oceanclass.store.model.vo.StoreReview;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageDao myDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
		
	@Override
	public int updateProfile(Member m) {
		return myDao.updateProfile(sqlSession, m);
	}
	
	@Override
	public Member selectUser(Member m) {
		return myDao.selectUser(sqlSession, m);
	}

	@Override
	public int updatePwd(Member m) {
		return myDao.updatePwd(sqlSession, m);
	}

	@Override
	public int deleteMem(String userId) {
		return myDao.deleteMem(sqlSession, userId);
	}
	
	@Override
	public int selectCouponCount(int memNo) {
		return myDao.selectCouponCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<Coupon> selectCouponList(PageInfo pi, int memNo) {
		return myDao.selectCouponList(sqlSession, pi, memNo);
	}
	
	
	
// 문의내역
	@Override
	public int selectQnaCount(int memNo) {
		return myDao.selectQnaCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<Qna> selectQnaList(PageInfo pi, int memNo) {
		return myDao.selectQnaList(sqlSession, pi, memNo);
	}

	@Override
	public int myQnaCount(Qna q) {
		return myDao.myQnaCount(sqlSession, q);
	}

	@Override
	public ArrayList<Qna> selectMyQnaList(PageInfo pi, Qna q) {
		return myDao.selectMyQnaList(sqlSession, pi, q);
	}

	@Override
	public int checkNick(String nickName) {
		return myDao.checkNick(sqlSession, nickName);
	}
	
	
// 클래스
	@Override
	public ArrayList<ClassOrder> selectMyClass(int memNo) {
		return myDao.selectMyClass(sqlSession, memNo);
	}

	@Override
	public int likeClassCount(int memNo) {
		return myDao.likeClassCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<ClassVo> selectLikeClass(PageInfo pi, int memNo) {
		return myDao.selectLikeClass(sqlSession, pi, memNo);
	}

	@Override
	public int classReviewCount(int memNo) {
		return myDao.classReviewCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<ClassReview> classReviewList(PageInfo pi, int memNo) {
		return myDao.classReviewList(sqlSession, pi, memNo);
	}
	
	@Override
	public int classQnaCount(int memNo) {
		return myDao.classQnaCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<CsQna> classQnaList(PageInfo pi, int memNo) {
		return myDao.classQnaList(sqlSession, pi, memNo);
	}


	

// 스토어	
	@Override
	public int likeProductCount(int memNo) {
		return myDao.likeProductCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<Product> selectLikeProduct(PageInfo pi, int memNo) {
		return myDao.selectLikeProduct(sqlSession, pi, memNo);
	}

	@Override
	public int shoppingQnaCount(int memNo) {
		return myDao.shoppingQnaCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<CsQna> shoppingQnaList(PageInfo pi, int memNo) {
		return myDao.shoppingQnaList(sqlSession, pi, memNo);
	}

	@Override
	public int shoppingReviewCount(int memNo) {
		return myDao.shoppingReviewCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<StoreReview> shoppingReviewList(PageInfo pi, int memNo) {
		return myDao.shoppingReviewList(sqlSession, pi, memNo);
	}

	@Override
	public int shoppingCount(int memNo) {
		return myDao.shoppingCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<StorePay> shoppingList(PageInfo pi, int memNo) {
		return myDao.shoppingList(sqlSession, pi, memNo);
	}

	@Override
	public StorePay selectShopping(String orderNo) {
		return myDao.selectShopping(sqlSession, orderNo);
	}

	@Override
	public ArrayList<StorePay> searchShoppingList(StorePay pay) {
		return myDao.searchShoppingList(sqlSession, pay);
	}

	@Override
	public ArrayList<StorePay> ajaxSearchDate(StorePay pay) {
		return myDao.ajaxSearchDate(sqlSession, pay);
	}

	@Override
	public ArrayList<ClassVo> selectMainLikeClass(int memNo) {
		return myDao.selectMainLikeClass(sqlSession, memNo);
	}

	@Override
	public ArrayList<Product> selectMainLikeProduct(int memNo) {
		return myDao.selectMainLikeProduct(sqlSession, memNo);
	}

	@Override
	public ArrayList<ClassOrder> selectMainMyClass(int memNo) {
		return myDao.selectMainMyClass(sqlSession, memNo);
	}

}
