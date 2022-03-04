package com.kh.oceanclass.help.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter 
@Getter
@ToString
public class Notice {
	
	private int noNo;
	private int memNo;
	private String category;
	private String noTitle;
	private String noContent;
	private int count;
	private String createDate;
	private String status;
	private String img;
	
	private String nickname;
	private int important;

}
