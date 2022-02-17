package com.kh.oceanclass.store.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.common.model.vo.LikeVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.store.model.vo.Product;

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
	
	public ArrayList<Product> categorySearch(SqlSessionTemplate sqlSession, String category, String memberNo, String sort){
		Product p = new Product();
		p.setCategory(category);
		p.setMemberNo(memberNo);
		p.setSort(sort);
		return (ArrayList)sqlSession.selectList("storeMapper.categorySearch", p);
	}
	
	public Product selectProduct(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("storeMapper.selectProduct", productNo);
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

}
