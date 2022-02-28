package com.kh.oceanclass.member.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.Class.model.vo.ClassOrder;
import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.CsQna;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.help.model.vo.Qna;
import com.kh.oceanclass.member.model.vo.Coupon;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.member.model.vo.Point;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.StorePay;
import com.kh.oceanclass.store.model.vo.StoreReview;

@Repository
public class MypageDao {
	
// 마이페이지 메인	
	public ArrayList<ClassVo> selectMainLikeClass(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("myMapper.selectMainLikeClass", memNo);
	}
	
	public ArrayList<Product> selectMainLikeProduct(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("myMapper.selectMainLikeProduct", memNo);
	}
	
	public ArrayList<ClassOrder> selectMainMyClass(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("myMapper.selectMainMyClass", memNo);
	}
	
	

// 프로필 관련
	public int updateProfile(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("myMapper.updateProfile", m);
	}
	
	public Member selectUser(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("myMapper.selectUser", m);
	}
	
	public int updatePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("myMapper.updatePwd", m);
	}
	
	public int deleteMem(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("myMapper.deleteMem", userId);
	}

	public int checkNick(SqlSessionTemplate sqlSession, String nickName){
		return sqlSession.selectOne("myMapper.checkNick", nickName);
	}
	
	

// 적립금,쿠폰관련
	public int selectCouponCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("myMapper.selectCouponCount", memNo);
	}

	public ArrayList<Coupon> selectCouponList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myMapper.selectCouponList", memNo, rowBounds);
	}
	
	public int selectPointCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("myMapper.selectPointCount", memNo);
	}
	
	public int pointSum(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("myMapper.selectPointSum", memNo);
	}

	public ArrayList<Point> selectPointList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myMapper.selectPointList", memNo, rowBounds);
	}
	
	public ArrayList<Point> PointMinusList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("myMapper.PointMinusList", memNo);
	}

	
	
// 1:1문의 관련	
	public int selectQnaCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("myMapper.selectQnaCount", memNo);
	}
	
	public ArrayList<Qna> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myMapper.selectQnaList", memNo, rowBounds);
	}
	
	public int myQnaCount(SqlSessionTemplate sqlSession, Qna q) {
		if(q.getCreateDate().equals("week")) {
			return sqlSession.selectOne("myMapper.myQnaWeekCount", q);
		}else if(q.getCreateDate().equals("2week")) {
			return sqlSession.selectOne("myMapper.myQna2WeekCount", q);
		}else {
			return sqlSession.selectOne("myMapper.myQnaMonthCount", q);
		}
	}
	
	public ArrayList<Qna> selectMyQnaList(SqlSessionTemplate sqlSession, PageInfo pi, Qna q){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		if(q.getCreateDate().equals("week")) {
			return (ArrayList)sqlSession.selectList("myMapper.myQnaWeek", q, rowBounds);
		}else if(q.getCreateDate().equals("2week")) {
			return (ArrayList)sqlSession.selectList("myMapper.myQna2Week", q, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("myMapper.myQnaMonth", q, rowBounds);
		}
	}
	
	public ArrayList<Qna> ajaxSearchQnaDate(SqlSessionTemplate sqlSession, Map<String, Object> option) {
		return (ArrayList)sqlSession.selectList("myMapper.ajaxSearchQnaDate", option);
	}
	
	
	
// 클래스 관련
	public ArrayList<ClassOrder> selectMyClass(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("myMapper.selectMyClass", memNo);
	}
	
	public ArrayList<ClassOrder> selectMyAllClass(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("myMapper.selectMyAllClass", memNo);
	}
	
	public int likeClassCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("myMapper.likeClassCount", memNo);
	}
	
	public ArrayList<ClassVo> selectLikeClass(SqlSessionTemplate sqlSession, PageInfo pi, int memNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myMapper.selectLikeClass", memNo, rowBounds);
	}
	
	public int classReviewCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("myMapper.classReviewCount", memNo);
	}
	
	public ArrayList<ClassReview> classReviewList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myMapper.classReviewList", memNo, rowBounds);
	}
	
	public int classQnaCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("myMapper.classQnaCount", memNo);
	}
	
	public ArrayList<CsQna> classQnaList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myMapper.classQnaList", memNo, rowBounds);
	}
	
	public CsQna ajaxClassQna(SqlSessionTemplate sqlSession, int csQno) {
		return sqlSession.selectOne("myMapper.ajaxClassQna", csQno);
	}
	
	
	
// 상품관련
	public int likeProductCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("myMapper.likeProductCount", memNo);
	}
	
	public ArrayList<Product> selectLikeProduct(SqlSessionTemplate sqlSession, PageInfo pi, int memNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myMapper.selectLikeProduct", memNo, rowBounds);
	}
	
	public int shoppingQnaCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("myMapper.shoppingQnaCount", memNo);
	}
	
	public ArrayList<CsQna> shoppingQnaList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myMapper.shoppingQnaList", memNo, rowBounds);
	}
	
	public CsQna ajaxShoppingQna(SqlSessionTemplate sqlSession, int csQno) {
		return sqlSession.selectOne("myMapper.ajaxShoppingQna", csQno);
	}
	
	public int shoppingReviewCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("myMapper.shoppingReviewCount", memNo);
	}
	
	public ArrayList<StoreReview> shoppingReviewList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myMapper.shoppingReviewList", memNo, rowBounds);
	}
	
	public int shoppingCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("myMapper.shoppingCount", memNo);
	}
	
	public ArrayList<StorePay> shoppingList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myMapper.shoppingList", memNo, rowBounds);
	}
	
	public StorePay selectShopping(SqlSessionTemplate sqlSession, String orderNo) {
		return sqlSession.selectOne("myMapper.selectShopping", orderNo);
	}
	
	public ArrayList<StorePay> searchShoppingList(SqlSessionTemplate sqlSession, StorePay pay){		
		return (ArrayList)sqlSession.selectList("myMapper.searchShoppingList", pay);
	}
	
	public ArrayList<StorePay> ajaxSearchDate(SqlSessionTemplate sqlSession, StorePay pay){
		return (ArrayList)sqlSession.selectList("myMapper.ajaxSearchDate", pay);
	}


}
