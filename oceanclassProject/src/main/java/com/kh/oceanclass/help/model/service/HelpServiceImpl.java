package com.kh.oceanclass.help.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.help.model.dao.HelpDao;
import com.kh.oceanclass.help.model.vo.Notice;

@Service
public class HelpServiceImpl implements HelpService{
	
	@Autowired
	private HelpDao hDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return hDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return hDao.selectList(sqlSession, pi);
	}

	@Override
	public int increaseCount(int noNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Notice selectNotice(int noNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
