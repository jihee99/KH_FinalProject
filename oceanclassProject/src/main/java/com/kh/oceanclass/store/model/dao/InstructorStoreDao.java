package com.kh.oceanclass.store.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.ProductOption;

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

	
}
