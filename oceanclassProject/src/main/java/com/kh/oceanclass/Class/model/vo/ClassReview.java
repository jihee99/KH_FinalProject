package com.kh.oceanclass.Class.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ClassReview {

	private int crNo;
	private int clNo;
	private String memNo;
	private String content;
	private String star;
	private String filePath;
	private String createDate;
	private String status;
	private int recommend;
	private int replyNum;
	private String filePathMessage;
	
	private String clName;
	private String img;
	
}
