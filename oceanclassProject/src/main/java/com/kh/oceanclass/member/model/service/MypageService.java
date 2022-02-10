package com.kh.oceanclass.member.model.service;

import com.kh.oceanclass.member.model.vo.Member;

public interface MypageService {

	// 학생 마이페이지 기능
	// 프로필수정
	int updateProfile(Member m);
	
	// 회원탈퇴
	int deleteProfile(Member m);
	
}
