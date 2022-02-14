package com.kh.oceanclass.member.model.service;

import java.util.ArrayList;

import com.kh.oceanclass.common.model.vo.PageInfo;
import com.kh.oceanclass.help.model.vo.Qna;
import com.kh.oceanclass.member.model.vo.Coupon;
import com.kh.oceanclass.member.model.vo.Member;

public interface MypageService {

	// 학생 마이페이지 기능
	// 프로필수정
	int updateProfile(Member m);
	
	// 비밀번호 변경
	int  updatePwd(Member m);
	
	// 회원탈퇴
	int deleteMem(String userId);
	
	// 쿠폰 갯수 조회
	int selectCouponCount(int memNo);
	
	// 쿠폰 리스트 조회
	ArrayList<Coupon> selectCouponList(PageInfo pi, int memNo);
	
	// qna 갯수 조회
	int selectQnaCount(int memNo);
	
	// qna 리스트 조회
	ArrayList<Qna> selectQnaList(PageInfo pi, int memNo);
	
	
}
