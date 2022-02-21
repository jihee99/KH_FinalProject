package com.kh.oceanclass.common.model.service;

import java.util.ArrayList;

import com.kh.oceanclass.Class.model.vo.ClassReview;
import com.kh.oceanclass.Class.model.vo.ClassVo;
import com.kh.oceanclass.common.model.vo.AdminStatistics;
import com.kh.oceanclass.common.model.vo.CsQna;
import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.help.model.vo.Qna;
import com.kh.oceanclass.member.model.vo.Coupon;
import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.store.model.vo.Product;
import com.kh.oceanclass.store.model.vo.StoreReview;

public interface AdminChartService {
	
	ArrayList<AdminStatistics> selectStatistics();
	
	ArrayList<AdminStatistics> selectMemStatistics();
	
	ArrayList<AdminStatistics> selectTeacherStatistics();
	
}
