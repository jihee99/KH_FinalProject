package com.kh.oceanclass.store.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.Class.model.vo.ClassQna;
import com.kh.oceanclass.common.model.vo.LikeVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.member.model.vo.Report;
import com.kh.oceanclass.store.model.dao.StoreDao;
import com.kh.oceanclass.store.model.vo.Cart;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.ProductOption;
import com.kh.oceanclass.store.model.vo.StoreQna;
import com.kh.oceanclass.store.model.vo.StoreReview;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDao sDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount(HashMap<String, String> map) {
		return sDao.selectListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Product> selectList(PageInfo pi, HashMap<String, String> map) {
		return sDao.selectList(sqlSession, pi, map);
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
	public ArrayList<StoreQna> selectStoreQnaList(int pno) {
		return sDao.selectStoreQnaList(sqlSession, pno);
	}

	@Override
	public int insertReview(StoreReview review) {
		return sDao.insertReview(sqlSession, review);
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
	public ArrayList<StoreReview> selectReviewList(int pno, PageInfo pi, int memberNo) {
		return sDao.selectReviewList(sqlSession, pno, pi, memberNo);
	}

	@Override
	public StoreReview selectReviewCount(int pno) {
		return sDao.selectReviewCount(sqlSession,pno);
	}

	@Override
	public ArrayList<StoreReview> selectStoreReviewMainList(int pno) {
		return sDao.selectStoreReviewMainList(sqlSession, pno);
	}
	
	@Override
	public int storeReviewListCount(int pno) {
		return sDao.storeReviewListCount(sqlSession, pno);
	}
	
	@Override
	public int checkRecommend(StoreReview review) {
		return sDao.checkRecommend(sqlSession, review);
	}

	@Override
	public int deleteRecommend(StoreReview review) {
		return sDao.deleteRecommend(sqlSession, review);
	}

	@Override
	public int insertRecommend(StoreReview review) {
		return sDao.insertRecommend(sqlSession, review);
	}

	@Override
	public int insertReport(Report r) {
		return sDao.insertReport(sqlSession, r);
	}

	@Override
	public int storeQnaListCount(int pno) {
		return sDao.storeQnaListCount(sqlSession, pno);
	}

	@Override
	public ArrayList<StoreQna> selectPagingQnaList(int pno, PageInfo pi) {
		return sDao.selectPagingQnaList(sqlSession, pno, pi);
	}

	@Override
	public int insertQna(StoreQna qna) {
		return sDao.insertQna(sqlSession, qna);
	}
	
	@Override
	public int storeQnaPwdCheck(StoreQna sq) {
		return sDao.storeQnaPwdCheck(sqlSession, sq);
	}

	@Override
	public ArrayList<Product> storeHotList() {
		return sDao.storeHotList(sqlSession);
	}

	@Override
	public ArrayList<Product> storeNewList() {
		return sDao.storeNewList(sqlSession);
	}

	@Override
	public Member selectMember(int memberNo) {
		return sDao.selectMember(sqlSession, memberNo);
	}

	@Override
	public ProductOption selectPo(int pno) {
		return sDao.selectPo(sqlSession, pno);
	}

	@Override
	public int reviewUpdate(StoreReview sr) {
		return sDao.reviewUpdate(sqlSession, sr);
	}

	@Override
	public int reviewDelete(int rno) {
		return sDao.reviewDelete(sqlSession, rno);
	}

	@Override
	public int qnaDelete(StoreQna q) {
		return sDao.qnaDelete(sqlSession, q);
	}

	@Override
	public StoreReview selectReview(int rno) {
		return sDao.selectReview(sqlSession, rno);
	}

	@Override
	public StoreQna selectQna(int csQno) {
		return sDao.selectQna(sqlSession, csQno);
	}


	
}
