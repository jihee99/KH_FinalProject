package com.kh.oceanclass.Class.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.oceanclass.Class.model.vo.ClassManager;
import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.PageInfo;

public interface AdminClassService {

	int enrollClassListCount(HashMap<String, String> map);
	ArrayList<ClassVo> selectEnrollClassList(HashMap<String, String> map, PageInfo pi);
	ClassVo selectClassDetail(String clNo);
	int classApproval(int clNo);
	int classReturn(ClassVo c);
	int classManagerListCount(ClassManager cm);
	ArrayList<ClassVo> selectClassManagerList(ClassManager cm, PageInfo pi);
	
	int reviewListCount(ClassManager cm);
	ArrayList<ClassReview> selectReviewList(ClassManager cm, PageInfo pi);
	int classShow(int clNo);
	int classHide(int clNo);
}
