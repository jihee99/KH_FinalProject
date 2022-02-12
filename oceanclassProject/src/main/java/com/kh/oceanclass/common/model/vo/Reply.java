package com.kh.oceanclass.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Reply{
	
	public int replyNo;	// 댓글고유번호
	public int memNo;		// 회원번호
	public int boardNo;		// 게시판분류 1.이벤트 2.클래스리뷰
	public int contentNo;	// 게시글 고유번호
	public String replyContent;	
	public String replyDate;
	public String replyStatus;
}
