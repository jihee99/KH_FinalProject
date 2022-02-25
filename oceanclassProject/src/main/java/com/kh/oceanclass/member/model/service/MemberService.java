package com.kh.oceanclass.member.model.service;

import com.kh.oceanclass.member.model.vo.Member;
import com.kh.oceanclass.member.model.vo.Report;

public interface MemberService {

	// 로그인 서비스 (select)
	Member loginMember(Member m);
	
	// 회원가입 서비스 (insert)
	int insertMember(Member m);
	
	// 아이디 중복 체크 (select)
	int idCheck(String checkId);
	
	// 닉네임 중복 체크 (select)
	int nickCheck(String nickCheck);
	
	// 아이디 찾기 (select)
	Member findId(Member m);
	
	// 비밀번호 찾기 (select)
	Member findPwd(Member m);
	
	// 비밀번호 재설정 (update)
	int updatePwd(Member m);
	
	//신고하기
	int postReport(Report r);
	
}
