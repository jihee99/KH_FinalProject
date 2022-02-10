package com.kh.oceanclass.Class.model.service;

import com.kh.oceanclass.Class.model.vo.ClassVo;

public interface ClassService {

	// 클래스 상세보기용
	int increaseCount(int clNo);
	ClassVo selectClass(int clNo);
	
}
