package com.kh.oceanclass.Class.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.oceanclass.Class.model.vo.ClassVo;

@Repository
public class TcClassDao {

	public ArrayList<ClassVo> myClassList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("tcclassMapper.myClassList");
	}
	
	
	
}
