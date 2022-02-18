package com.kh.oceanclass.help.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter 
@Getter
@ToString
public class Qna {
	
	private int qnaNo;
	private int memNo;
	private String nickName;
	private String category;
	private String qnaTitle;
	private String qnaContent;
	private String createDate;
	private String pwd;
	private String ansContent;
	private String ansDate;
	
}


