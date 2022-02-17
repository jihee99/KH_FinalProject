package com.kh.oceanclass.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Report {

	private String reportNo;
	private int reportMemNo;
	private String refCategory;
	private String refBNo;
	private String content;
	private String status;
	
	private String userId;
	private String rpContent;	//신고된 게시글의 내용
}
