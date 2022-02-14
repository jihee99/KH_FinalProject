package com.kh.oceanclass.Class.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.LikeVo;
import com.kh.oceanclass.common.model.vo.PageInfo;

public interface ClassService {

	// 클래스 상세보기용
	int increaseCount(int clNo);
	ClassVo selectClass(int clNo);
	
	// 클래스 검색용
	int classSearchListCount(HashMap<String, String> map);
	ArrayList<ClassVo> classSearchList(HashMap<String, String> map, PageInfo pi);

	// 클래스 찜하기용
	int checkClassLike(LikeVo li);
	int insertClassLike(LikeVo li);
	int deleteClassLike(LikeVo li);
}
