package com.kh.oceanclass.member.model.service;

import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.member.model.vo.Teacher;

public interface TcMypageService {
	
	// 로그인 서비스(select)
	Member loginMember(Member m);

	// 강사 내정보 업데이트
	int updateInforPage(Member m);
	
	// 닉네임 ajax
	int nickCheck(String nickCheck);
	
	// 강사 강사정보 업데이트 
	int updateMyPage(Teacher t);
	
	// 강사 탈퇴
	int deleteTc(String userId);
	
}
