package com.kh.oceanclass.store.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.store.model.vo.InProductOrder;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.ProductOption;
import com.kh.oceanclass.store.model.vo.Stock;
import com.kh.oceanclass.store.model.vo.StoreBuyList;
import com.kh.oceanclass.store.model.vo.StoreOrder;
import com.kh.oceanclass.store.model.vo.StoreQna;
import com.kh.oceanclass.store.model.vo.StoreReview;

@Repository
public class InstructorStoreDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("inStoreMapper.selectListCount");
	}
	
	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("inStoreMapper.selectList", null, rowBounds);
	}
	
	//상품등록
	public int insertProduct(SqlSessionTemplate sqlSession, Product p) {	
		return sqlSession.insert("inStoreMapper.insertProduct", p);
	}

	public int insertProductOption(SqlSessionTemplate sqlSession, ProductOption option) {
		return sqlSession.insert("inStoreMapper.insertProductOption", option);
	}

	// 상품상세조회
	public Product selectProduct(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.selectOne("inStoreMapper.selectProduct", pno);
	}
	
	public ArrayList<ProductOption> selectProductOption(SqlSessionTemplate sqlSession, int pno) {
		return (ArrayList)sqlSession.selectList("inStoreMapper.selectProductOption", pno);
	}

	public int updateProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.update("inStoreMapper.updateProduct", p);
	}

	public int updateProductOption(SqlSessionTemplate sqlSession, ProductOption option) {
		return sqlSession.update("inStoreMapper.updateProductOption", option);
	}

	public int upinsertProductOption(SqlSessionTemplate sqlSession, ProductOption option) {
		return sqlSession.insert("inStoreMapper.upinsertProductOption", option);
	}
	
	public int deleteProduct(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.update("inStoreMapper.deleteProduct", pno);
	}
	
	public int deleteProductOption(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.delete("inStoreMapper.deleteProductOption", pno);
	}

	public int selectStockCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("inStoreMapper.selectStockCount");
	}
	
	public ArrayList<Stock> selectStockList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("inStoreMapper.selectStockList", null, rowBounds);
	}

	public int updateStockCount(SqlSessionTemplate sqlSession, Stock st) {
		return sqlSession.update("inStoreMapper.updateStockCount", st);
	}

	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("inStoreMapper.selectProductList");
	}

	
	public int insertProductOrder(SqlSessionTemplate sqlSession, InProductOrder pOrder) {
		return sqlSession.insert("inStoreMapper.insertProductOrder", pOrder);
	}

	public int selectStoreDeliveryCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("inStoreMapper.selectStoreDeliveryCount");
	}

	public ArrayList<StoreOrder> selectStoreDeliveryList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("inStoreMapper.selectStoreDeliveryList", null, rowBounds);
	}

	public StoreOrder selectStoreDelivery(SqlSessionTemplate sqlSession, String ono) {
		return sqlSession.selectOne("inStoreMapper.selectStoreDelivery", ono);
	}

	public ArrayList<StoreBuyList> selectStoreBuyList(SqlSessionTemplate sqlSession, String ono) {
		return (ArrayList)sqlSession.selectList("inStoreMapper.selectStoreBuyList", ono);
	}

	public int storeOrderUpdate(SqlSessionTemplate sqlSession, StoreOrder so) {
		return sqlSession.update("inStoreMapper.storeOrderUpdate", so);
	}

	public int searchStoreOrderCount(SqlSessionTemplate sqlSession, String orderStatus) {
		return sqlSession.selectOne("inStoreMapper.searchStoreOrderCount", orderStatus);
	}

	public ArrayList<StoreOrder> searchStoreOrderList(SqlSessionTemplate sqlSession, String orderStatus, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("inStoreMapper.searchStoreOrderList", orderStatus, rowBounds);
	}

	public int deleteStoreOrder(SqlSessionTemplate sqlSession, String orderNo) {
		return sqlSession.delete("inStoreMapper.deleteStoreOrder", orderNo);
	}

	public int searchKeyStoreOrderCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("inStoreMapper.searchKeyStoreOrderCount", map);
	}

	public ArrayList<StoreOrder> searchKeyStoreOrderList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("inStoreMapper.searchKeyStoreOrderList", map, rowBounds);
	}

	public int selectStoreReivewCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("inStoreMapper.selectStoreReviewCount");
	}

	public ArrayList<Product> selectReviewProductList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("inStoreMapper.selectReviewProductList", userNo);
	}
	
	public ArrayList<StoreReview> selectStoreReviewList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("inStoreMapper.selectStoreReviewList", userNo, rowBounds);
	}

	public ArrayList<StoreReview> selectStoreProductReview(SqlSessionTemplate sqlSession, String pno) {
		return (ArrayList)sqlSession.selectList("inStoreMapper.selectStoreProductReview",pno);
	}

	public StoreReview selectStoreProductReviewCount(SqlSessionTemplate sqlSession, String pno) {
		return sqlSession.selectOne("inStoreMapper.selectStoreProductReviewCount", pno);
	}

	public int selectStoreQnaCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("inStoreMapper.selectStoreQnaCount");
	}

	public ArrayList<StoreQna> selectStoreQnaList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("inStoreMapper.selectStoreQnaList", null, rowBounds);
	}

	public int selectStoreProductQnaCount(SqlSessionTemplate sqlSession, String pno) {
		return sqlSession.selectOne("inStoreMapper.selectStoreProductQnaCount");
	}

	public ArrayList<StoreQna> selectStoreProductQnaList(SqlSessionTemplate sqlSession, PageInfo pi, String pno) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("inStoreMapper.selectStoreProductQnaList", pno, rowBounds);
	}

	public StoreQna selectStoreQnaDetail(SqlSessionTemplate sqlSession, String qno) {
		return sqlSession.selectOne("inStoreMapper.selectStoreQnaDetail", qno);
	}

	public int storeQnaAnswer(SqlSessionTemplate sqlSession, StoreQna sq) {
		return sqlSession.update("inStoreMapper.updateStoreQnaAnswer", sq);
	}

	public int storeOrderStatusUpdate(SqlSessionTemplate sqlSession, StoreOrder so) {
		return sqlSession.update("inStoreMapper.storeOrderStatusUpdate", so);
	}

	
	
	
	
}
