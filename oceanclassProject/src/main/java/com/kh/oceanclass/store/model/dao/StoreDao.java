package com.kh.oceanclass.store.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.common.model.vo.LikeVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.member.model.vo.Report;
import com.kh.oceanclass.store.model.vo.Cart;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.ProductOption;
import com.kh.oceanclass.store.model.vo.StoreQna;
import com.kh.oceanclass.store.model.vo.StoreReview;

@Repository
public class StoreDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("storeMapper.selectListCount");
	}
	
	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, PageInfo pi, int memberNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("storeMapper.selectList", memberNo, rowBounds);
		
	}
	
	public ArrayList<Product> categorySearch(SqlSessionTemplate sqlSession, Product p){
		
		return (ArrayList)sqlSession.selectList("storeMapper.categorySearch", p);
	}
	
	public Product selectProduct(SqlSessionTemplate sqlSession, int pno, int memberNo) {
		Product p = new Product();
		//int productNo = pno;
		p.setProductNo(pno);
		p.setMemberNo(memberNo);
		return sqlSession.selectOne("storeMapper.selectProduct", p);
	}
	
	public int likeCheck(SqlSessionTemplate sqlSession, LikeVo li) {
		return sqlSession.selectOne("storeMapper.likeCheck", li);
	}
	
	public int insertLike(SqlSessionTemplate sqlSession, LikeVo li) {
		return sqlSession.insert("storeMapper.insertLike", li);
	}
	
	public int deleteLike(SqlSessionTemplate sqlSession, LikeVo li) {
		return sqlSession.delete("storeMapper.deleteLike", li);
	}
	
	public ArrayList<ProductOption> selectOption(SqlSessionTemplate sqlSession, int pno) {
		return (ArrayList)sqlSession.selectList("storeMapper.selectOption", pno);
	}
	
	public int cartCheck(SqlSessionTemplate sqlSession, Cart ca) {
		return sqlSession.selectOne("storeMapper.cartCheck", ca);
	}
	
	public int insertCart(SqlSessionTemplate sqlSession, Cart ca) {
		return sqlSession.insert("storeMapper.insertCart", ca);
	}
	
	public int deleteCart(SqlSessionTemplate sqlSession, Cart ca) {
		return sqlSession.delete("storeMapper.deleteCart", ca);
	}
	
	public int updateCart(SqlSessionTemplate sqlSession, Cart ca) {
		return sqlSession.update("storeMapper.updateCart", ca);
	}
	
	public ArrayList<Cart> selectCart(SqlSessionTemplate sqlSession, int memberNo) {
		System.out.println(memberNo);
		return (ArrayList)sqlSession.selectList("storeMapper.selectCart", memberNo);
	}
	
	public ArrayList<Product> selectCartProduct(SqlSessionTemplate sqlSession, int productNo){
		return (ArrayList)sqlSession.selectList("storeMapper.selectCartProduct", productNo);
	}
	
	public ArrayList<ProductOption> selectCartOption(SqlSessionTemplate sqlSession, int optionNo){
		return (ArrayList)sqlSession.selectList("storeMapper.selectCartOption", optionNo);
	}
	
	public ArrayList<StoreReview> selectReviewList(SqlSessionTemplate sqlSession, int pno, PageInfo pi, int memberNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		StoreReview sr = new StoreReview();
		sr.setProductNo(pno);
		sr.setMemberNo(memberNo);
		return (ArrayList)sqlSession.selectList("storeMapper.selectReviewList", sr, rowBounds);
	}
	
	public StoreReview selectReviewCount(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.selectOne("storeMapper.selectReviewCount", pno);
	}
	
	public ArrayList<StoreReview> selectStoreReviewList(SqlSessionTemplate sqlSession, int pno){
		return (ArrayList)sqlSession.selectList("storeMapper.selectStoreReviewList", pno);
	}
	
	public ArrayList<StoreReview> selectStoreReviewMainList(SqlSessionTemplate sqlSession, int pno){
		return (ArrayList)sqlSession.selectList("storeMapper.selectStoreReviewMainList", pno);
	}
	
	public int storeReviewListCount(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.selectOne("storeMapper.selectReviewListCount", pno);
	}
	
	public int insertReview(SqlSessionTemplate sqlSession, StoreReview review) {
		return sqlSession.insert("storeMapper.insertReview", review);
	}
	
	public int insertRecommend(SqlSessionTemplate sqlSession, StoreReview review) {
		return sqlSession.insert("storeMapper.insertRecommend", review);
	}
	
	public int deleteRecommend(SqlSessionTemplate sqlSession, StoreReview review) {
		return sqlSession.delete("storeMapper.deleteRecommend", review);
	}
	
	public int checkRecommend(SqlSessionTemplate sqlSession, StoreReview review) {
		return sqlSession.selectOne("storeMapper.checkRecommend", review);
	}
	
	public int insertReport(SqlSessionTemplate sqlSession, Report r) {
		return sqlSession.insert("storeMapper.insertReport", r);
	}
	
	public ArrayList<StoreQna> selectStoreQnaList(SqlSessionTemplate sqlSession, int pno){
		return (ArrayList)sqlSession.selectList("storeMapper.selectStoreQnaList", pno);
	}
	
	public int storeQnaListCount(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.selectOne("storeMapper.selectQnaListCount", pno);
	}
	
	public ArrayList<StoreQna> selectPagingQnaList(SqlSessionTemplate sqlSession, int pno, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("storeMapper.selectStoreQnaList", pno, rowBounds);
	}
	
	public int insertQna (SqlSessionTemplate sqlSession, StoreQna qna) {
		return sqlSession.insert("storeMapper.insertQna", qna);
	}

}
