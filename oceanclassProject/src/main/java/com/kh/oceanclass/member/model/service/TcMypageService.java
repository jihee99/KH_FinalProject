package com.kh.oceanclass.member.model.service;

import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.member.model.vo.Teacher;

public interface TcMypageService {
	
	// 멤버 세션 업데이트 용(select)
	Member loginMember(Member m);

	// 강사 내정보 업데이트
	int updateInforPage(Member m);
	
	// 닉네임 ajax
	int nickCheck(String nickCheck);
	
	// 강사 세션 업데이트 용(select)
	Teacher loginTc(Teacher t);
	
	// 강사 insert 확인 용
	int updateCount(int memNo);
	
	// 강사 세션 인설트 용(insert)
	int insertTcPage(Teacher t);
	
	// 강사 강사정보 업데이트 
	int updateTcPage(Teacher t);
	
	// 강사 탈퇴
	int deleteTc(String userId);
	
}
