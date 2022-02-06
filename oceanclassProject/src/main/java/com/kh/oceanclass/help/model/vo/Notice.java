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
	
	public int noNo;
	public int memNo;
	public String category;
	public String noTitle;
	public String noContent;
	public int count;
	public String createDate;
	public String status;
	public String img;

}
