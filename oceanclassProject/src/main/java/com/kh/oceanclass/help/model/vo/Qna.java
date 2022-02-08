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
	
	public int qnaNo;
	public String nickName;
	public String category;
	public String qnaTitle;
	public String qnaContent;
	public String createDate;
	public String img;
	public int pwd;
	public String ansContent;
	public String ansDate;

}
