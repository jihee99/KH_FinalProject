package com.kh.oceanclass.store.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.common.model.vo.LikeVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.store.model.dao.StoreDao;
import com.kh.oceanclass.store.model.vo.Cart;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.ProductOption;
import com.kh.oceanclass.store.model.vo.StoreReview;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDao sDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return sDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Product> selectList(PageInfo pi, int memberNo) {
		return sDao.selectList(sqlSession, pi, memberNo);
	}
	
	@Override
	public Product selectProduct(int pno, int memberNo) {
		return sDao.selectProduct(sqlSession, pno, memberNo);
	}

	@Override
	public ArrayList<ProductOption> selectProductOption(int pno) {
		return sDao.selectOption(sqlSession, pno);
	}

	@Override
	public ArrayList<StoreReview> selectStoreReviewList(int pno) {
		return sDao.selectStoreReviewList(sqlSession, pno);
	}

	@Override
	public void selectStoreQnaList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int insertReview(StoreReview review) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public ArrayList<Product> categorySearch(String category, int memberNo, String sort) {
		return sDao.categorySearch(sqlSession, category, memberNo, sort);
	}

	@Override
	public int likeCheck(LikeVo li) {
		return sDao.likeCheck(sqlSession, li);
	}

	@Override
	public int insertLike(LikeVo li) {
		return sDao.insertLike(sqlSession, li);
	}

	@Override
	public int deleteLike(LikeVo li) {
		return sDao.deleteLike(sqlSession, li);
	}

	@Override
	public int cartCheck(Cart ca) {
		return sDao.cartCheck(sqlSession, ca);
	}

	@Override
	public int insertCart(Cart ca) {
		return sDao.insertCart(sqlSession, ca);
	}
	
	@Override
	public int deleteCart(Cart ca) {
		return sDao.deleteCart(sqlSession, ca);
	}

	@Override
	public int updateCart(Cart ca) {
		return sDao.updateCart(sqlSession, ca);
	}

	@Override
	public ArrayList<Cart> selectCart(int memberNo) {
		return sDao.selectCart(sqlSession, memberNo);
	}

	@Override
	public ArrayList<Product> selectCartProduct(int productNo) {
		return sDao.selectCartProduct(sqlSession, productNo);
	}

	@Override
	public ArrayList<ProductOption> selectCartOption(int optionNo) {
		return sDao.selectCartOption(sqlSession, optionNo);
	}

	@Override
	public ArrayList<StoreReview> selectReviewList(int pno) {
		return sDao.selectReviewList(sqlSession, pno);
	}

	@Override
	public StoreReview selectReviewCount(int pno) {
		return sDao.selectReviewCount(sqlSession,pno);
	}

	@Override
	public ArrayList<StoreReview> selectStoreReviewMainList(int pno) {
		return sDao.selectStoreReviewMainList(sqlSession, pno);
	}
	
	
	
}
