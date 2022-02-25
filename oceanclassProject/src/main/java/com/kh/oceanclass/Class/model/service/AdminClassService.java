package com.kh.oceanclass.Class.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.oceanclass.Class.model.vo.ClassOrder;
import com.kh.oceanclass.Class.model.vo.ClassQna;
import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.LikeVo;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.common.model.vo.Reply;
import com.kh.oceanclass.event.model.vo.Event;
import com.kh.oceanclass.member.model.vo.MemCoupon;

public interface AdminClassService {

	int enrollClassListCount(HashMap<String, String> map);
	ArrayList<ClassVo> selectEnrollClassList(HashMap<String, String> map, PageInfo pi);
	ClassVo selectClassDetail(String clNo);
	int classApproval(int clNo);
	int classReturn(ClassVo c);
}
